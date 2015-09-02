using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group_Project_Online_Exam
{
    public partial class FinishExam : MasterPageSwitch
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // lblRight.Text = Session["right"].ToString();
            //    lblWrong.Text = Session["wrong"].ToString();
            if (!IsPostBack)
            {
                
            }
            if(Session["Finish"]!=null)
            {
                loadThanks();
            }
        }
        public void loadThanks()
        {
            lblThanks.Text = Session["Finish"].ToString();

        }
    }
}