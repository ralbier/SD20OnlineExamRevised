<%@ Page Title="" Language="C#" MasterPageFile="~/Header_Footer.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Group_Project_Online_Exam.Registration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
    <table>
        <asp:Label ID="lblMessage" runat="server" Text=" "></asp:Label>
        <tr>
            <td>First Name:</td>
            <td>
                <asp:TextBox ID="txtFName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="valFName" runat="server" ErrorMessage="First Name is Required!" ControlToValidate="txtFName" EnableClientScript="false" Text="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>LastName:</td>
            <td>
                <asp:TextBox ID="txtLName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="valLName" runat="server" ErrorMessage="Last Name is Required!" ControlToValidate="txtLName" EnableClientScript="false" Text="*"></asp:RequiredFieldValidator>

            </td>
        </tr>
        <tr>
            <td>Email:</td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="valEmail" runat="server" ErrorMessage="Email is Required!" ControlToValidate="txtEmail" EnableClientScript="false" Text="*"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RvalEmail" runat="server" ErrorMessage="Email is Required!" ControlToValidate="txtEmail" EnableClientScript="false" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>Password:</td>
            <td>
                <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="valPassword" runat="server" ErrorMessage="Password is Required!" ControlToValidate="txtPassword" EnableClientScript="false"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Confirm Password:
          

            </td>
            <td>
                <asp:TextBox ID="txtCPassword" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Confirm Password" ControlToValidate="txtPassword" EnableClientScript="false"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password is not the same!" EnableClientScript="false" ControlToCompare="txtPassword" ControlToValidate="txtCPassword"></asp:CompareValidator></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />

            </td>
            
        </tr>
    </table>
    
</ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
