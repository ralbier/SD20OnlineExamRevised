<%@ Page Title="" Language="C#" MasterPageFile="~/NestedTeacherMasterPage.master" AutoEventWireup="true" CodeBehind="QuizResponseByUser.aspx.cs" Inherits="Group_Project_Online_Exam.QuizResponseByUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DropDownList ID="ddtest" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddtest_SelectedIndexChanged"></asp:DropDownList>
     <asp:GridView ID="GVQuizResponseByUser" runat="server" AllowPaging="True" AllowSorting="True" Width="628px" AutoGenerateColumns="False">
         <AlternatingRowStyle BackColor="#99CCFF" />
         <Columns>
             <asp:BoundField DataField="UserId" HeaderText="UserId" />
             <asp:BoundField DataField="Email" HeaderText="Email" />
             <asp:BoundField DataField="QuizTitle" HeaderText="QuizTitle" />
             <asp:BoundField DataField="ExamDate" HeaderText="ExamDate" DataFormatString="{0:D}" />
             <asp:BoundField DataField="Correct Responses" HeaderText="Correct" />
             <asp:BoundField DataField="Number Of Questions" HeaderText="Questions" />
             <asp:BoundField DataField="Grade" HeaderText="Grade" DataFormatString="{0:p}"/>
             <asp:BoundField DataField="Pass/Fail" HeaderText="Pass/Fail" />
         </Columns>
         </asp:GridView>
</asp:Content>
