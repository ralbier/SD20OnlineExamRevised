using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data.SqlClient;
using DAL_Project;
using System.Configuration;
using System.Net.Mail;
using System.Data;
namespace Group_Project_Online_Exam
{
    public partial class ForgotPassword : MasterPageSwitch
    {
        string conn = ConfigurationManager.ConnectionStrings["Exam"].ConnectionString;
        string emailDomain = ConfigurationManager.AppSettings["EmailDomainName"];

        protected void Page_Load(object sender, EventArgs e)
        {
            UpdatePanel pnlLogin = (UpdatePanel)Master.FindControl("UpdatePanelLogin");
            pnlLogin.Visible = false;

        }



        protected void btnRecoverPassword_Click(object sender, EventArgs e)
        {
            DAL mydal = new DAL(conn);
            mydal.AddParam("Email", txtEmail.Text + emailDomain);
            DataSet ds = new DataSet();
            ds = mydal.ExecuteProcedure("spResetPassword");

            string theEmail = ds.Tables[0].Rows[0]["Email"].ToString();
            string id = ds.Tables[0].Rows[0]["Uniqueid"].ToString();
           
            string Email = txtEmail.Text;
            sendpasswordEmail(theEmail, id);
           
        }

        private void sendpasswordEmail(string ToEmail, string uniqueId)
        {

            MailMessage mailmessage = new MailMessage("Rimon.Bishay@robertsoncollege.net", ToEmail);
            StringBuilder sbEmailBody = new StringBuilder();
            sbEmailBody.Append("Dear"+" "+ ToEmail + ",<br/><br/>");
            sbEmailBody.Append("Please Click on the following link to reset your password");
            sbEmailBody.Append("<br/>");
            sbEmailBody.Append("<a href='http://" + HttpContext.Current.Request.Url.Authority + "/ChangePassword.aspx?uid=" + uniqueId + "'>http://" + HttpContext.Current.Request.Url.Authority + "/ChangePassword.aspx?uid=" + uniqueId + "</a>");
            sbEmailBody.Append("<br/><br/>");
            sbEmailBody.Append("<br>Steve WebSite<br/>");
            mailmessage.IsBodyHtml = true;
            mailmessage.Body = sbEmailBody.ToString();
            mailmessage.Subject = "Reset Your Password";
            SmtpClient smtpclient = new SmtpClient("smtp.gmail.com", 587);
            smtpclient.Credentials = new System.Net.NetworkCredential()
            {
                UserName = "Rimon.Bishay@robertsoncollege.net",
                Password = "robertson"
            };
            smtpclient.EnableSsl = true;
            smtpclient.Send(mailmessage);
            Response.Redirect("Home.aspx");

        }
               
           }
    }
