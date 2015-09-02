<%@ Page Title="" Language="C#" MasterPageFile="~/Header_Footer.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="Group_Project_Online_Exam.ForgotPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="content">
        <asp:Panel ID="pnlForgot" CssClass="ForgotTextbox" runat="server">
            <div id="RetrievePass" runat="server">
                <a>Forgotten Password</a>
                <br />
                <table>
                    <tr>
                        <td>Enter Your Email</td>
                        <td>
                            <asp:TextBox ID="txtEmail" runat="server" Width="149px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="valEamil" runat="server" ErrorMessage="Required Email" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="valEmalRegex" runat="server"  ErrorMessage="Email is Required!" ControlToValidate="txtEmail" EnableClientScript="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

                        </td>
                        <td>@robertsoncollege.net
                        </td>
                    </tr>
                </table>
            </div>
            <asp:Button ID="btnRecoverPassword" CssClass="button" runat="server" Text="Recover Password" OnClick="btnRecoverPassword_Click" />
        </asp:Panel>
    </div>
</asp:Content>
