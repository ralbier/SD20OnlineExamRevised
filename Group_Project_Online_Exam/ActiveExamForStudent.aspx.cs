using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using DAL_Project;

namespace Group_Project_Online_Exam
{
    public partial class ActiveExamForStudent : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["Exam"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                LoadAvailableExamforlogedInUser();
            }

        }
        public void LoadAvailableExamforlogedInUser()
        {
            Security s = new Security();
            DAL mydal = new DAL(conn);
            mydal.AddParam("@UserId",s.Userid);
            DataSet ds = mydal.ExecuteProcedure("spGetActiveQuizByUser");
            string QuizName = ds.Tables[0].Rows[0]["QuizTitle"].ToString();
            lblShowQuiz.Text = QuizName;
            Session["QuizName"] = QuizName;
        }
    }
}