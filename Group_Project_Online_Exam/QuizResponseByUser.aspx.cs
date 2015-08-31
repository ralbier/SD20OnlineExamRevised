using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL_Project;
using System.Configuration;
using System.Data;

namespace Group_Project_Online_Exam
{
    public partial class QuizResponseByUser : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["Exam"].ToString();

        protected void Page_Load(object sender, EventArgs e)
        {
            Security mySecurity = new Security();

            if (!IsPostBack)
            {
                LoadQuizResponseByUser();
                LoadQuiz();
            }
        }


          private void LoadQuiz()
        {
            DAL mydal = new DAL(conn);
            DataSet ds = new DataSet();
            ds = mydal.ExecuteProcedure("spGetQuiz");
            ddtest.DataSource = ds.Tables[0];
            ddtest.DataTextField = "QuizTitle";
            ddtest.DataValueField = "QuizId";
            ddtest.DataBind();
            ddtest.Items.Insert(0, new ListItem("Select a Quiz"));
        }

        
        private void LoadQuizResponseByUser()
        {
            //Security mySecurity = new Security();
            //DAL myDal = new DAL(conn);
            //myDal.AddParam("@QuizId",Session["QuizIdForReport"]);
            //GVQuizResponseByUser.DataSource = myDal.ExecuteProcedure("spGetAllQuizReponsesByQuizId");
            //GVQuizResponseByUser.DataBind();
        }

        protected void ddtest_SelectedIndexChanged(object sender, EventArgs e)
        {
            DAL myDal = new DAL(conn);
            myDal.AddParam("@QuizId",ddtest.SelectedValue);
            GVQuizResponseByUser.DataSource = myDal.ExecuteProcedure("spGetAllQuizReponsesByQuizId");
            GVQuizResponseByUser.DataBind();
            
        }
    }
}
