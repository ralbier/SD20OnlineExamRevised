﻿using System;
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
    public partial class ExamPage : MasterPageSwitch
    {
        string conn = ConfigurationManager.ConnectionStrings["Exam"].ConnectionString;
        DataTable dt = new DataTable();
        int rowindex = 0;
        int counter = 0;
        string[] Responses;

        protected void Page_Load(object sender, EventArgs e)
        {

            GetQuizId();

            rowindex = ViewState["RowIndex"] == null ? 0 : (int)ViewState["RowIndex"];
            if (ViewState["RowIndex"] == null) ViewState["RowIndex"] = 0;
            loadQuestions();

            if (!IsPostBack)
            {
                CountNumberOfQuestions();
                Responses = new string[counter];
                Session["Responses"] = Responses;
                GetEndTime();
                LoadQuestion();
            }
            else
            {
                btnback.Enabled = true;

            }

            counter = (int)Session["NumberofQuestion"];
            Responses = (string[])Session["Responses"];

            if (rowindex != -1)
            {
                lblQuestion.Text = dt.Rows[rowindex]["Question"].ToString();
            }

        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            btnback.Enabled = true;
            string value = ViewState["CorrectAnswer"].ToString();

            if (RadioButtonList1.SelectedItem != null)
            {
                Responses[rowindex] = RadioButtonList1.SelectedIndex.ToString();
            }

            rowindex++;
            ViewState["RowIndex"] = rowindex;


            if (rowindex > dt.Rows.Count - 1)
            {
                btnNext.Enabled = false;
                btnback.Enabled = true;
                rowindex = dt.Rows.Count;
                ViewState["RowIndex"] = rowindex - 1;
               // Response.Redirect("FinishExam.aspx");

                // TEST IS OVER.
            }
            else
            {
                LoadQuestion();
            }

        }

        protected void btnback_Click(object sender, EventArgs e)
        {
            btnNext.Enabled = true;
            if (rowindex - 1 >= 0)
            {
                rowindex--;
                ViewState["RowIndex"] = rowindex;

                loadQuestions();
                LoadQuestion();

            }
            else
            {
                btnback.Enabled = false;
                // you're at the first question, cant go back!
            }



        }
       
        private void CountNumberOfQuestions()
        {
            DAL mydal = new DAL(conn);
            mydal.AddParam("QuizId", (int)Session["QuizId"]);
            DataSet ds = mydal.ExecuteProcedure("spCountNumberOfQuestions");
            counter = int.Parse(ds.Tables[0].Rows[0]["numberofquestions"].ToString());
            Session["NumberofQuestion"] = counter;
        }

        private void LoadQuestion()
        {
            int j = (int)ViewState["RowIndex"] +1;
                string QuestionNumber = j.ToString(); ;
                lblComplted.Text = "Questions &nbsp" + QuestionNumber + "&nbsp of &nbsp" + dt.Rows.Count + "<br/>";
                lblmsg.Text = "Question #" + QuestionNumber + ":&nbsp";
                lblQuestion.Text = dt.Rows[rowindex]["Question"].ToString();
                RadioButtonList1.Items.Clear();
                for (int i = 0; i <=3; i++)
                {
                    string answerText = dt.Rows[rowindex]["Answer" + i].ToString();

                    if (!string.IsNullOrEmpty(answerText))
                    {
                        RadioButtonList1.Items.Add(new ListItem(answerText, i.ToString()));
                    }
                }
            
            if (!string.IsNullOrEmpty(Responses[rowindex]))
            {
                int IndexValue = int.Parse(Responses[rowindex].ToString());
                RadioButtonList1.Items[IndexValue].Selected = true;//.SelectedItem.Value = Responses[rowindex].ToString();
            }
        }

        public void GetEndTime()
        {
            DAL mydal = new DAL(conn);
            DataSet ds = mydal.ExecuteProcedure("spShowActiveExam");
            DateTime EndTime = Convert.ToDateTime(ds.Tables[0].Rows[0]["EndTime"].ToString());
            DateTime StartTime = Convert.ToDateTime(ds.Tables[0].Rows[0]["StartTime"].ToString());
            Session["EndTime"] = EndTime;
            Session["StartTime"] = StartTime;
            hiddenSeconds.Value = Math.Round((EndTime - DateTime.Now).TotalSeconds, 0).ToString();
            // UpdateTimer();
            if (int.Parse(hiddenSeconds.Value) < 0)
            {
                UpdatePanel1.Visible = false;
                updateResponses();
            }
        }

        public void GetQuizId()
        {
            DAL mydal = new DAL(conn);
            DataSet ds = mydal.ExecuteProcedure("spShowQuiz");
            Session["QuizId"] = int.Parse(ds.Tables[0].Rows[0]["QuizId"].ToString());

        }


        public void loadQuestions()
        {
            if (rowindex != -1)
            {
                DAL mydal = new DAL(conn);
                mydal.AddParam("@QuizId", Session["QuizId"].ToString());
                DataSet ds = mydal.ExecuteProcedure("sploadQuestions");
                dt = ds.Tables[0];
                string CorrectAnswer = dt.Rows[rowindex]["CorrectAnswer"].ToString();

                ViewState["CorrectAnswer"] = CorrectAnswer;
                if (dt.Rows.Count < 1)
                {
                    lblQuestion.Text = "ERROR, QUIZ RETURNED WITH 0 ROWS!";
                }
            }
        }


        protected void btnfinish_Click1(object sender, EventArgs e)
        {
            updateResponses();
        }


        public void updateResponses()
        {
            bool isFinish = false;
            Security s = new Security();
            DAL mydal = new DAL(conn);

            string newQuizResponseId = insertQuizInformation();

            int j = (int)Session["NumberofQuestion"];
            for (int i = 0; i < (int)Session["NumberofQuestion"]; i++)
            {
                if (Responses[i] != null)
               {
                    mydal.ClearParams();
                    mydal.AddParam("@newQuizResponseId", newQuizResponseId);
                    mydal.AddParam("@QuestionId", (i + 1).ToString());
                    mydal.AddParam("@Response", Responses[i]);
                    DataSet ds = mydal.ExecuteProcedure("spInsertQuestionResponse");
                    string Result = ds.Tables[0].Rows[0]["Result"].ToString();
                    if (Result == "success")
                    {

                        isFinish = true;
                    }
               }
               
            
            }

            if (isFinish)
            {
                Response.Redirect("FinishExam.aspx");
            }
            else
            {
                //to do
            }

        }


        public string insertQuizInformation ()
        {
            Security S = new Security();
            DAL mydal = new DAL(conn);
            mydal.AddParam("@UserId", S.Userid);
            mydal.AddParam("@QuizId", (int)Session["QuizId"]);
          DataSet ds=  mydal.ExecuteProcedure("spInsertQuizInformation");
          return ds.Tables[0].Rows[0]["newQuizResponseId"].ToString();
        }
    }
}


