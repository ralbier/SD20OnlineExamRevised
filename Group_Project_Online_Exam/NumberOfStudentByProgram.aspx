<%@ Page Title="" Language="C#" MasterPageFile="~/NestedTeacherMasterPage.master" AutoEventWireup="true" CodeBehind="NumberOfStudentByProgram.aspx.cs" Inherits="Group_Project_Online_Exam.NumberOfStudentByProgram" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
          
<asp:GridView ID="GvNumberOfStudentByProgram" runat="server" AllowPaging="True" AllowSorting="True" Width="668px" PageIndex="2" OnSorting="GvNumberOfStudentByProgram_Sorting" OnPageIndexChanging="GvNumberOfStudentByProgram_PageIndexChanging" Height="220px" >
    <AlternatingRowStyle BackColor="#99CCFF" />

      </asp:GridView>

</asp:Content>
