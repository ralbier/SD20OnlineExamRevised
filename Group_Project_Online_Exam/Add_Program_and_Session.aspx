<%@ Page Title="" Language="C#" MasterPageFile="~/NestedTeacherMasterPage.master" AutoEventWireup="true" CodeBehind="Add_Program_and_Session.aspx.cs" Inherits="Group_Project_Online_Exam.Add_Program_and_Session" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbSD20ConnectionString %>" DeleteCommand="DELETE FROM [tbProgram] WHERE [ProgramId] = @ProgramId" InsertCommand="INSERT INTO [tbProgram] ([ProgramName]) VALUES (@ProgramName)" SelectCommand="SELECT [ProgramId], [ProgramName] FROM [tbProgram]" UpdateCommand="UPDATE [tbProgram] SET [ProgramName] = @ProgramName WHERE [ProgramId] = @ProgramId" OnDeleted="SqlDataSource1_Deleted">
        <DeleteParameters>
            <asp:Parameter Name="ProgramId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ProgramName" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ProgramName" Type="String" />
            <asp:Parameter Name="ProgramId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <h3>Program List</h3>
    <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="update" runat="server" />
    <asp:ValidationSummary ID="ValidationSummary2" ValidationGroup="insert" runat="server" />
        <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ProgramId" DataSourceID="SqlDataSource1" ShowFooter="True">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ValidationGroup="update" />
            <asp:TemplateField HeaderText="ProgramId" InsertVisible="False" SortExpression="ProgramId">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ProgramId") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("ProgramId") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:LinkButton ID="lkInsertProgram" ValidationGroup="insert" runat="server" OnClick="lkInsertProgram_Click">Insert</asp:LinkButton>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ProgramName" SortExpression="ProgramName">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ProgramName") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="val1ProgramName" ControlToValidate="TextBox1" runat="server" ValidationGroup="update" Text="*" ErrorMessage="Required Program Name"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("ProgramName") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtprogram" ValidationGroup="insert" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator Text="*" ID="valProgramName" ControlToValidate="txtprogram" runat="server" ValidationGroup="insert" ErrorMessage="Required Program Name"></asp:RequiredFieldValidator>
                </FooterTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <br />
    <br />
    <br />
    <br />

    <h3>Session List</h3>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbSD20ConnectionString %>" SelectCommand="SELECT * FROM [tbSession]" DeleteCommand="DELETE FROM [tbSession] WHERE [SessionId] = @SessionId" InsertCommand="INSERT INTO [tbSession] ([SessionCode], [ProgramId]) VALUES (@SessionCode, @ProgramId)" UpdateCommand="UPDATE [tbSession] SET [SessionCode] = @SessionCode, [ProgramId] = @ProgramId WHERE [SessionId] = @SessionId" OnDeleted="SqlDataSource2_Deleted">
        <DeleteParameters>
            <asp:Parameter Name="SessionId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="SessionCode" Type="String" />
            <asp:Parameter Name="ProgramId" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="SessionCode" Type="String" />
            <asp:Parameter Name="ProgramId" Type="Int32" />
            <asp:Parameter Name="SessionId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>


        <asp:Label ID="lblError1" runat="server" Text=""></asp:Label>
    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="SessionId" DataSourceID="SqlDataSource2">
        <Columns>
            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
            <asp:BoundField DataField="SessionId" HeaderText="SessionId" InsertVisible="False" ReadOnly="True" SortExpression="SessionId" />
            <asp:TemplateField HeaderText="SessionCode" SortExpression="SessionCode">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("SessionCode") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("SessionCode") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ProgramId" SortExpression="ProgramId">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" SelectedValue='<%# Bind("ProgramId") %>' runat="server" DataSourceID="SqlDataSource3" DataTextField="ProgramName" DataValueField="ProgramId">
                    </asp:DropDownList>
                    <br />
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:dbSD20ConnectionString %>" SelectCommand="SELECT [ProgramName], [ProgramId] FROM [tbProgram]"></asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("ProgramId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
        </ContentTemplate>
        </asp:UpdatePanel>
</asp:Content>
