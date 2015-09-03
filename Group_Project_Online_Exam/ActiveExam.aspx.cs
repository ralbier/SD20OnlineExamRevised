using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL_Project;
using System.Data;
using System.Configuration;

namespace Group_Project_Online_Exam
{
    public partial class ActiveExam1 : MasterPageSwitch
    {
        string conn = ConfigurationManager.ConnectionStrings["Exam"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                for (int index = 1; index <= 24; index++)
                {
                    dd1startH.Items.Add(index.ToString("00"));
                    dd2EndH.Items.Add(index.ToString("00"));
                }
                for (int index = 1; index <= 60; index++)
                {
                    dd1startM.Items.Add(index.ToString("00"));
                    dd2EndM.Items.Add(index.ToString("00"));
                }

                loadAvailableExam();
                loadSession();
                loadQuizTitle();

            }
        }
        public void loadAvailableExam()
        {
            DAL mydal = new DAL(conn);
            DataSet ds = new DataSet();
            ds = mydal.ExecuteProcedure("spShowExam");
            gvActiveExam.DataSource = ds.Tables[0];
            gvActiveExam.DataBind();
        }
        public void loadSession()
        {
            DAL mydal = new DAL(conn);
            DataSet ds = new DataSet();
            ds = mydal.ExecuteProcedure("spSelectSession");
            ddSession.DataSource = ds.Tables[0];
            ddSession.DataTextField = "SessionCode";
            ddSession.DataValueField = "SessionId";
            ddSession.DataBind();
        }
        public void loadQuizTitle()
        {
            DAL mydal = new DAL(conn);
            DataSet ds = new DataSet();
            ds = mydal.ExecuteProcedure("spSelectQuiz");
            ddQuiz.DataSource = ds.Tables[0];
            ddQuiz.DataTextField = "QuizTitle";
            ddQuiz.DataValueField = "QuizId";
            ddQuiz.DataBind();
        }

        protected void BtnACtive_Click(object sender, EventArgs e)
        {
            DAL mydal = new DAL(conn);
            DataSet ds = new DataSet();
            DateTime start = Convert.ToDateTime(txtStartDate.Text);
            DateTime end = Convert.ToDateTime(txtEndDate.Text);
            //   DateTime starttime = Convert.ToDateTime(txtStartTime.Text);
            //// BASED ON txtStartTime.Text somehow
            int hours = Int32.Parse(dd1startH.SelectedValue);
            int minutes = Int32.Parse(dd1startM.SelectedValue);
            start = start.AddHours(hours).AddMinutes(minutes);

            int Ehours = Int32.Parse(dd2EndH.SelectedValue);
            int Eminutes = Int32.Parse(dd2EndM.SelectedValue);
            end = end.AddHours(Ehours).AddMinutes(Eminutes);

            mydal.AddParam("@StartTime", start);
            mydal.AddParam("@EndTime", end);
            mydal.AddParam("@QuizId", ddQuiz.SelectedValue);
            mydal.AddParam("@SessionId", ddSession.SelectedValue);
            ds = mydal.ExecuteProcedure("spActiveExam");
            string result = ds.Tables[0].Rows[0]["Result"].ToString();
            if (result == "Success")
            {
                lblMsg.Text = "Exam Actived";
            }
            else
            {
                lblMsg.Text = "something Wrong .Try Later!!";
            }
        }

        protected void gvActiveExam_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            gvActiveExam.SelectedIndex = Convert.ToInt32(e.CommandArgument);
            switch (e.CommandName)
            {
                case "act":
                    UpdatePanelActive.Visible = true;
                   
                    break;
                case "del":
                    DAL mydal1 = new DAL(conn);
                    DataSet ds1 = new DataSet();
                    mydal1.AddParam("QuizId", gvActiveExam.SelectedDataKey.Value.ToString());
                    ds1 = mydal1.ExecuteProcedure("spDeleteQuiz");
                    string Result = "";
                    Result = ds1.Tables[0].Rows[0]["Result"].ToString();
                    if (Result == "Success")
                    {
                        lblError.Text = "DELETED SUCCESSFULLY!";
                    }
                    else if (Result == "Failed")
                    {
                        lblError.Text = "YOU CANNOT DELETE IT IS ALREADY IN USE!";
                    }
                    loadAvailableExam();
                    break;
                default:
                    break;
            }
        }

        
        protected void btnActive1_Click(object sender, EventArgs e)
        {
            UpdatePanelActive.Visible = true;

        }
    }
}