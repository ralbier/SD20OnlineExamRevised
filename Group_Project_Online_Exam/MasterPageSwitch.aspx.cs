using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Group_Project_Online_Exam
{
    public partial class MasterPageSwitch : System.Web.UI.Page
    {
        protected override void OnPreInit(EventArgs e)
        {
            Security s = new Security();
            if (s.IsStudent())
            {
                this.MasterPageFile = "NestedStudentMasterPage.Master";
            }
            else if(s.IsTeacher() || s.IsAdmin())
            {
                this.MasterPageFile = "NestedTeacherMasterPage.Master";
            }
            // default is neither.
        } 

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}