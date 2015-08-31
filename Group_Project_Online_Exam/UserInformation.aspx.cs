using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group_Project_Online_Exam
{
    public partial class UserInformation : MasterPageSwitch
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void linkButtonInsert_Click(object sender, EventArgs e)
        {
            SqlDataSource1.InsertParameters["FirstName"].DefaultValue =((TextBox)gvUserInfo.FooterRow.FindControl("txtFirstName")).Text;
            SqlDataSource1.InsertParameters["LastName"].DefaultValue = ((TextBox)gvUserInfo.FooterRow.FindControl("txtLastName")).Text;
            SqlDataSource1.InsertParameters["Email"].DefaultValue = ((TextBox)gvUserInfo.FooterRow.FindControl("txtEmail")).Text;
            SqlDataSource1.InsertParameters["Password"].DefaultValue = ((TextBox)gvUserInfo.FooterRow.FindControl("txtPassword")).Text;
            SqlDataSource1.InsertParameters["SecurityLevel"].DefaultValue = ((TextBox)gvUserInfo.FooterRow.FindControl("txtSecurityLevel")).Text;
            SqlDataSource1.Insert();
        }

        protected void SqlDataSource1_Deleted(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                //ADMIN CANNOT DELETE  
                lblError.Text = "YOU CANNOT DELETE USER,   ALREADY IN USE!";
                e.ExceptionHandled = true;
            }
        }
    }
}