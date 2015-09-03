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
    public partial class FinishExam : MasterPageSwitch
    {
        string conn = ConfigurationManager.ConnectionStrings["Exam"].ConnectionString;

        string[] FinalResponse;
        int QuizId;
        int Right;
        int wrong;
        protected void Page_Load(object sender, EventArgs e)
        {
            // lblRight.Text = Session["right"].ToString();
            //    lblWrong.Text = Session["wrong"].ToString();
            if (!IsPostBack)
            {
                int j = (int)Session["NumberofQuestion"];
                FinalResponse = new string[j];
                loadMarks();
            }
   
            QuizId = (int)Session["QuizId"];
        }
        public void loadMarks()
        {
            FinalResponse = (string[])Session["Responses"];
           // lblThanks.Text = Session["Responses"].ToString();
            DAL mydal = new DAL(conn);
            mydal.AddParam("@QuizId", (int)Session["QuizId"]);
            DataSet ds= mydal.ExecuteProcedure("sploadQuestions");
            int GetResponses;
            for (int i = 0; i < (int)Session["NumberofQuestion"]; i++)
            {
                int correctAnswer = (int)ds.Tables[0].Rows[i]["CorrectAnswer"];
                if (FinalResponse[i] != null)
                {
                    GetResponses = int.Parse(FinalResponse[i].ToString());



                    if (correctAnswer == GetResponses)
                    {
                        Right++;
                    }
                    else
                    {
                        wrong++;
                    }

                }
                else
                {
                    wrong++;
                }
            }
            lblRight.Text = Convert.ToInt32(Right).ToString();
            lblWrong.Text = Convert.ToInt32(wrong).ToString(); 
        }

        public void loadResult()
        {
            DAL mydal = new DAL(conn);
          //  mydal.AddParam("");

        }
    }
}