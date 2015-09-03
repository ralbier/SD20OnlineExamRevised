<%@ Page Title="" Language="C#" MasterPageFile="~/Header_Footer.Master" AutoEventWireup="true" CodeBehind="ActiveExam.aspx.cs" Inherits="Group_Project_Online_Exam.ActiveExam1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
    <asp:GridView ID="gvActiveExam" runat="server" DataKeyNames="QuizId" OnRowCommand="gvActiveExam_RowCommand">
         <AlternatingRowStyle BackColor="#99CCFF" />
        <Columns>
            <asp:ButtonField ButtonType="Button" Text="Active" CommandName="act" />
            <asp:ButtonField ButtonType="Button" Text="Delete" CommandName="del" />

        </Columns>
    </asp:GridView>
    <asp:UpdatePanel ID="UpdatePanelActive" Visible="false" runat="server">

        <ContentTemplate>
            <table>
                <tr>
                    <td>Start Date / Time
                    </td>
                    <td>
                        <asp:TextBox ID="txtStartDate" runat="server" type="date"></asp:TextBox>
                    </td>
                    <td>/ 
                      <asp:DropDownList ID="dd1startH" runat="server">
                      </asp:DropDownList>
                        <asp:DropDownList ID="dd1startM" runat="server">
                        </asp:DropDownList>
                       
                        <%--<asp:TextBox ID="txtStartTime" runat="server" type="time"></asp:TextBox>--%>
                    </td>
                </tr>
                <tr>
                    <td>End Date / Time
                    </td>
                    <td>
                        <asp:TextBox ID="txtEndDate" runat="server" type="date"></asp:TextBox>
                    </td>
                    <td>
                        <asp:DropDownList ID="dd2EndH" runat="server">
                        </asp:DropDownList>
                        <asp:DropDownList ID="dd2EndM" runat="server">
                        </asp:DropDownList>
                       

                        <%--<asp:TextBox ID="txtEndTime" runat="server" type="time"></asp:TextBox>--%>
                    </td>
                </tr>
                <tr>
                    <td>Pick a Session
                    </td>
                    <td>
                        <asp:DropDownList ID="ddSession" runat="server" AutoPostBack="True"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>Pick the Exam
                    </td>
                    <td>
                        <asp:DropDownList ID="ddQuiz" runat="server" AutoPostBack="True"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="BtnACtive" runat="server" Text="Active Exam" OnClick="BtnACtive_Click" />
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
