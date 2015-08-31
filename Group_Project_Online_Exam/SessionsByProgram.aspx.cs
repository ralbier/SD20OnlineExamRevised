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
    public partial class WebForm2 : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["Exam"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            Security mySecurity = new Security();

            if (!IsPostBack)
            {

                LoadSessionsByProgram();
              
            }
        }

      
    
        private void LoadSessionsByProgram()
        {
            Security mySecurity = new Security();
            DAL myDal = new DAL(conn);
            gvSessionsByProgram.DataSource = myDal.ExecuteProcedure("spGetSessionsByProgram");
            gvSessionsByProgram.DataBind();

        }
    }
}
