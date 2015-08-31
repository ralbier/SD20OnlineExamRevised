using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Net.Mail;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using DAL_Project;
namespace Group_Project_Online_Exam
{
    public partial class ChangePassword : MasterPageSwitch
    {
        string conn = ConfigurationManager.ConnectionStrings["Exam"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            Panel pnlLogin = (Panel)Master.FindControl("pnlLogin");
            pnlLogin.Visible = false;

            if (!string.IsNullOrEmpty(Request["uid"]))
            { 
                DAL mydal = new DAL(conn);
                mydal.AddParam("@GUID", Request["uid"]);
                DataSet ds = mydal.ExecuteProcedure("spIsPasswordResetLinkValid");

                string isValid = ds.Tables[0].Rows[0]["IsvalidPasswordResetLink"].ToString();

                if (isValid == "0")
                {
                    lblMessage.Text = "Error";
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            DAL mydal = new DAL(conn);
            mydal.AddParam("@GUID", Request["uid"]);
            mydal.AddParam("@Password", txtPassword.Text);
            mydal.ExecuteProcedure("spChangePassword");

            lblMessage.Text = "New password saved";
            Response.Redirect("Home.aspx");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}