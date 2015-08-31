using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group_Project_Online_Exam
{
    public partial class NestedTeacherMasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Security s = new Security();
            if (s.IsStudent() || !s.IsLoggedIn())
            {
                Response.Redirect("Home.aspx");
            }
        }
    }
}