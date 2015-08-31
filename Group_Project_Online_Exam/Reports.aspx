<%@ Page Title="" Language="C#" MasterPageFile="~/NestedTeacherMasterPage.master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="Group_Project_Online_Exam.Reports1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HyperLink ID="H1Report1" runat="server" NavigateUrl="~/StudentEachProgram.aspx? link=1" ><b>1-Student By Each Program</b> </asp:HyperLink>
    <br /><br />
    
       <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/QutionNumberbyExam.aspx? link=2" ><b>2-Question Number By Exam</b> </asp:HyperLink>
       <br /><br />
    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/SessionsByProgram.aspx? link=2" ><b>3-Session By Program</b> </asp:HyperLink>
  <br /><br />

    <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/NumberOfStudentByProgram.aspx? link=3" ><b>4-Number Of student Ny Program</b> </asp:HyperLink>
  <br /><br />
    <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/QuizResponseByUser.aspx? link=4" ><b>5-Quiz Response By User</b> </asp:HyperLink>
      <br /><br />
</asp:Content>
