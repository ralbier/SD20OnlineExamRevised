<%@ Page Title="" Language="C#" MasterPageFile="~/Header_Footer.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="Group_Project_Online_Exam.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
    <tr>
            <td colspan="2">
                <asp:ValidationSummary ID="valsum" runat="server" />
            </td>
            </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="lblMessage" runat="server" Text="" Font-Bold="true" ForeColor="Red" Font-Size="Larger"></asp:Label>
            </td>
        </tr>
    <tr>
            <td class="auto-style6">New Password</td>
            <td class="auto-style5">
                
                
            <asp:TextBox ID="txtPassword" runat="server" Width="188px" TextMode="Password" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="valPassword" runat="server" ErrorMessage="Password Needed" EnableClientScript="false" ControlToValidate="txtPassword" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
        </tr>
        <tr>
            <td class="auto-style3">Confirm New Password</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtConfirmpassword" runat="server" TextMode="Password" Width="188px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="valConfirmPassword" runat="server" ErrorMessage="Confirm password" EnableClientScript="false" ControlToValidate="txtConfirmpassword" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="compvalConfirmpassword" runat="server" ErrorMessage="Password not matched" Text="*" ForeColor="Red" EnableClientScript="false" ControlToValidate="txtConfirmpassword" ValueToCompare="txtPassword" Operator="Equal"></asp:CompareValidator>
            </td>
        </tr>
</table>
            
      <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />

 
   <asp:Button ID="btnSave" runat="server" Text="Save"  Width="59px" style="margin-bottom: 0px" OnClick="btnSave_Click" />
</asp:Content>
