using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group_Project_Online_Exam
{
    public partial class Add_Program_and_Session : MasterPageSwitch
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lkInsertProgram_Click(object sender, EventArgs e)
        {
            SqlDataSource1.InsertParameters["ProgramName"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtProgram")).Text;
            SqlDataSource1.Insert();
        }

        protected void SqlDataSource1_Deleted(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                //ADMIN CANNOT DELETE  
                lblError.Text = "YOU CANNOT DELETE PROGRAM,   ALREADY IN USE!";
                e.ExceptionHandled = true;
            }
        }

        protected void SqlDataSource2_Deleted(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                //ADMIN CANNOT DELETE  
                lblError1.Text = "YOU CANNOT DELETE SESSION,   ALREADY IN USE!";
                e.ExceptionHandled = true;
            }
        }

      
    }
}