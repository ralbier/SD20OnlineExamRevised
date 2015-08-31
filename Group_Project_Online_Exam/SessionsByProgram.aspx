<%@ Page Title="" Language="C#" MasterPageFile="~/NestedTeacherMasterPage.master" AutoEventWireup="true" CodeBehind="SessionsByProgram.aspx.cs" Inherits="Group_Project_Online_Exam.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbSD20ConnectionString %>" SelectCommand="spGetSessionsByProgram" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server"  AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="ProgramId">
        <AlternatingRowStyle BackColor="#99CCFF" />
        <Columns>
            <asp:BoundField DataField="ProgramName" HeaderText="ProgramName" SortExpression="ProgramName" />
            <asp:TemplateField HeaderText="NumberOfSession" SortExpression="NumberOfSession">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("NumberOfSession") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:HiddenField ID="hidPK" runat="server" Value='<%# Eval("ProgramId") %>' />
                    <asp:DropDownList ID="DropDownList1"  runat="server" DataSourceID="SqlDataSource2" DataTextField="SessionCode" DataValueField="SessionId">
                    </asp:DropDownList>
                    <br />
                    <asp:SqlDataSource ID="SqlDataSource2"  runat="server" ConnectionString="<%$ ConnectionStrings:dbSD20ConnectionString %>" SelectCommand='SELECT * FROM [tbSession] where ProgramId =@ProgramId'>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hidPK" PropertyName="Value" Name="ProgramId" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                   <%-- <asp:Label ID="Label1" runat="server" Text='<%# Bind("NumberOfSession") %>'></asp:Label>--%>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
       
    </asp:GridView>

       <asp:GridView ID="gvSessionsByProgram" runat="server"  AllowSorting="True" Width="628px" >
           <AlternatingRowStyle BackColor="#99CCFF" />

           </asp:GridView>
</asp:Content>
