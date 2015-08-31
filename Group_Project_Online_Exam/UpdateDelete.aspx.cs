using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group_Project_Online_Exam
{
    public partial class UpdateDelete : MasterPageSwitch
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddQuiz_Click(object sender, EventArgs e)
        {
            Response.Redirect("Quiz.aspx");
        }

        protected void SqlDataSource2_Deleted(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                //ADMIN CANNOT DELETE  
                lblError.Text = "YOU CANNOT DELETE QUIZ,   ALREADY IN USE!";
                e.ExceptionHandled = true;
            }
        }

        protected void SqlDataSource1_Deleted(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                //ADMIN CANNOT DELETE  
                lblError1.Text = "YOU CANNOT DELETE QUESTION,   ALREADY IN USE!";
                e.ExceptionHandled = true;
            }
        }
    }
}