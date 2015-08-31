using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using DAL_Project;

namespace Group_Project_Online_Exam
{
    public partial class InstructionForExam : MasterPageSwitch
    {
        string conn = ConfigurationManager.ConnectionStrings["Exam"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnStart_Click(object sender, EventArgs e)
        {
            DAL mydal = new DAL(conn);
            DataSet ds= mydal.ExecuteProcedure("spActiveExam");
            DateTime starttime =Convert.ToDateTime(ds.Tables[0].Rows[0]["Date"].ToString());
            int StartTime = Convert.ToInt32(ds.Tables[0].Rows[0]["StartTime"].ToString());
            int EndTime = Convert.ToInt32(ds.Tables[0].Rows[0]["EndTime"].ToString());
            Response.Redirect("");
        }

        protected void btnnext_Click(object sender, EventArgs e)
        {
            Response.Redirect("ActiveExamForStudent.aspx");
            
        }
    }
}