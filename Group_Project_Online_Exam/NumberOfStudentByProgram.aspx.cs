using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL_Project;
using System.Configuration;
namespace Group_Project_Online_Exam
{
    public partial class NumberOfStudentByProgram : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["Exam"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            Security mySecurity = new Security();

            if (!IsPostBack)
            {

                LoadNumberOfStudentByProgram("ProgramName");

                Session["Column"] = "ProgramName";
            }
        }
        private void LoadNumberOfStudentByProgram(string SortColumn)
        {
            DAL myDal = new DAL(conn);

            myDal.AddParam("@Direction", GetDirection());

            GvNumberOfStudentByProgram.DataSource = myDal.ExecuteProcedure("spGetNumberOfStudentByProgram");

            GvNumberOfStudentByProgram.DataBind();
        }

        private string GetDirection()
        {

            if (Session["Direction"] == null)
            {

                Session["Direction"] = "asc";

            }

            else if (Session["Direction"].ToString() == "asc")
            {

                Session["Direction"] = "desc";

            }

            else
            {

                Session["Direction"] = "asc";

            }

            return Session["Direction"].ToString();

        }

        protected void GvNumberOfStudentByProgram_Sorting(object sender, GridViewSortEventArgs e)
        {
                 string SortColumn = e.SortExpression.ToString();

                 Session["Column"] = SortColumn;

                 LoadNumberOfStudentByProgram(SortColumn);
             }

        protected void GvNumberOfStudentByProgram_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
         GvNumberOfStudentByProgram.PageIndex = e.NewPageIndex;
                 LoadNumberOfStudentByProgram("CategoryName");
        }

       }

    }
