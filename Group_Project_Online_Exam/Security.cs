using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using DAL_Project;
using System.Configuration;
namespace Group_Project_Online_Exam
{
   
        public class Security
        {
            int SecurityLevel;
            public int Userid;
            public string Firstname;

            public Security()
            {

                if (HttpContext.Current.Session["SecurityLevel"] != null)
                {
                    SecurityLevel = (int)HttpContext.Current.Session["SecurityLevel"];
                    Userid = (int)HttpContext.Current.Session["Userid"];
                    Firstname = HttpContext.Current.Session["Firstname"].ToString();
                }
                else
                {
                    SecurityLevel = 0;
                    Firstname = "";
                }

            }


            public Security(int PageSecurityLevel) : this()
            {
                if (PageSecurityLevel > SecurityLevel)
                {
                    HttpContext.Current.Session.Abandon();
                    HttpContext.Current.Response.Redirect("Home.aspx");
                }
            }


            public Security(string Email, String Password)
            {
                DataSet ds = new DataSet();
               
                DAL myDal = new DAL(ConfigurationManager.ConnectionStrings["Exam"].ConnectionString);
                myDal.ClearParams();
                myDal.AddParam("@Email", Email + ConfigurationManager.AppSettings["EmailDomainName"]);
                myDal.AddParam("@Password", Password);
                ds = myDal.ExecuteProcedure("UserspLogin");

                if (ds.Tables[0].Rows.Count == 0)
                {
                    SecurityLevel = 0;
                    Firstname = "Invalid Login";
                    Userid = -1;

                }
                else
                {
                    SecurityLevel = Convert.ToInt32(ds.Tables[0].Rows[0]["SecurityLevel"].ToString());
                    Firstname = "Welcome " + ds.Tables[0].Rows[0]["FirstName"].ToString() + "!";
                    Userid = Convert.ToInt32(ds.Tables[0].Rows[0]["Userid"].ToString());
                }
                HttpContext.Current.Session["Firstname"] = Firstname;
                HttpContext.Current.Session["SecurityLevel"] = SecurityLevel;
                HttpContext.Current.Session["Userid"] = Userid;
            }
          
            public int GetSecurityLevel()
            {
                return SecurityLevel;
            }
       
            public string GetId()
            {
                return Userid.ToString();
            }

            public string GetRole()
            {
                string role = string.Empty;

                Security mySecurity = new Security();
                if (mySecurity.GetSecurityLevel() == 3)
                {
                    role = "admin";
                }

                else if (mySecurity.GetSecurityLevel() == 2)
                {
                    role = "Teacher";
                }

                else if (mySecurity.GetSecurityLevel() == 1)
                {
                    role = "student";
                }
                return role;
            }

            public bool IsAdmin()
            {
                return GetRole() == "admin";
            }
            public bool IsTeacher()
            {
                return GetRole() == "Teacher";
            }
            public bool IsStudent()
            {
                return GetRole() == "student";
            }
            public bool IsLoggedIn()
            {
                return SecurityLevel != 0;
            }
        }

    }
