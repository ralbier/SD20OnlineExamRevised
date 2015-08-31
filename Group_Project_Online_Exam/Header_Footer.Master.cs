using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
namespace Group_Project_Online_Exam
{
    public partial class Header_Footer : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckSecurity();

            if (!IsPostBack)
            {

            }
        }
        private void CheckSecurity()
        {
            Security mySecurity = new Security();
            lblFirstname.Text = mySecurity.Firstname;
            if (!mySecurity.IsLoggedIn())
            {
                btnLogout.Visible = false;
             
            }
            else
            { //Adjust links visible according to Security Level(Admin or Regular)

                UpdatePanelLogin.Visible = false;
                pnlLogout.Visible = true;
                hlRegistration.Visible = false;
            }

           

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string FullEmail = txtUserName.Text;
            Security mySecurity = new Security(FullEmail, txtPassword.Text);
            if (mySecurity.IsLoggedIn())
            {
              
                if (mySecurity.IsTeacher()||mySecurity.IsAdmin())
                {
                    Response.Redirect("TeacherInstructions.aspx");
                }
                Response.Redirect("Home.aspx");
             
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Your User Name or Password Not Correct');", true);
            }
            
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Home.aspx");
            UpdatePanelLogin.Visible = true;
            
        }

    }
}