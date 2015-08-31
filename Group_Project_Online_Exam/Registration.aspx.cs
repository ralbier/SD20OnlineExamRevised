using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group_Project_Online_Exam
{
    public partial class Registration : MasterPageSwitch
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UpdatePanel pnlLogin = (UpdatePanel)Master.FindControl("UpdatePanelLogin");
            pnlLogin.Visible = false;

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //lblmessage.Text = "You successfully Registerd";
        }
    }
}