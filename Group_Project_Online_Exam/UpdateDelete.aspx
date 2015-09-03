<%@ Page Title="" Language="C#" MasterPageFile="~/Header_Footer.Master" AutoEventWireup="true" CodeBehind="UpdateDelete.aspx.cs" Inherits="Group_Project_Online_Exam.UpdateDelete" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
    <h3>Quiz List</h3>
            <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbSD20ConnectionString %>" SelectCommand="SELECT * FROM [tbQuiz]" DeleteCommand="DELETE FROM [tbQuiz] WHERE [QuizId] = @QuizId" InsertCommand="INSERT INTO [tbQuiz] ([QuizTitle], [TimeinMinute], [ProgramId], [DifficultyId], [TypeOfQuestionsId]) VALUES (@QuizTitle, @TimeinMinute, @ProgramId, @DifficultyId, @TypeOfQuestionsId)" UpdateCommand="UPDATE [tbQuiz] SET [QuizTitle] = @QuizTitle, [TimeinMinute] = @TimeinMinute, [ProgramId] = @ProgramId, [DifficultyId] = @DifficultyId, [TypeOfQuestionsId] = @TypeOfQuestionsId WHERE [QuizId] = @QuizId" OnDeleted="SqlDataSource2_Deleted">
        <DeleteParameters>
            <asp:Parameter Name="QuizId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="QuizTitle" Type="String" />
            <asp:Parameter Name="TimeinMinute" Type="DateTime" />
            <asp:Parameter Name="ProgramId" Type="Int32" />
            <asp:Parameter Name="DifficultyId" Type="Int32" />
            <asp:Parameter Name="TypeOfQuestionsId" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="QuizTitle" Type="String" />
            <asp:Parameter Name="TimeinMinute" Type="DateTime" />
            <asp:Parameter Name="ProgramId" Type="Int32" />
            <asp:Parameter Name="DifficultyId" Type="Int32" />
            <asp:Parameter Name="TypeOfQuestionsId" Type="Int32" />
            <asp:Parameter Name="QuizId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
                <div style="overflow-x: auto; width: 550px">
                    <asp:ValidationSummary ID="ValidationSummary2" runat="server" />
    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="QuizId" DataSourceID="SqlDataSource2">
        <Columns>
            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
            <asp:BoundField DataField="QuizId" HeaderText="QuizId" InsertVisible="False" ReadOnly="True" SortExpression="QuizId" />
            <asp:TemplateField HeaderText="QuizTitle" SortExpression="QuizTitle">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("QuizTitle") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="valTitle" runat="server" EnableClientScript="true" ControlToValidate="TextBox1" ErrorMessage="Required QuizTitle"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("QuizTitle") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="TimeinMinute" SortExpression="TimeinMinute">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("TimeinMinute") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="valMintues" runat="server" EnableClientScript="true" ControlToValidate="TextBox2" ErrorMessage="Required TimeInMintue"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("TimeinMinute") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ProgramId" SortExpression="ProgramId">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" SelectedValue='<%# Bind("ProgramId") %>'  DataValueField="ProgramId"  DataSourceID="SqlDataSource3" DataTextField="ProgramName"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:dbSD20ConnectionString %>" SelectCommand="SELECT * FROM [tbProgram]"></asp:SqlDataSource>

                    <%--  <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ProgramId") %>'></asp:TextBox>--%>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("ProgramId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="DifficultyId" SortExpression="DifficultyId">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList5" runat="server" SelectedValue='<%# Bind("DifficultyId") %>' DataSourceID="SqlDataSource6" DataTextField="difficultyName" DataValueField="DifficultyId">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:dbSD20ConnectionString %>" SelectCommand="SELECT * FROM [tbDifficulty]"></asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("DifficultyId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="TypeOfQuestionsId" SortExpression="TypeOfQuestionsId">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList4" runat="server" SelectedValue='<%# Bind("TypeOfQuestionsId") %>' DataValueField='TypeOfQuestionsId' DataSourceID="SqlDataSource5" DataTextField="TypeName"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:dbSD20ConnectionString %>" SelectCommand="SELECT * FROM [tbTypeOfQuestions]"></asp:SqlDataSource>


                    <%--     <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("TypeOfQuestionsId") %>'></asp:TextBox>--%>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("TypeOfQuestionsId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
            </div>
   <br /><br />
   

    <h3>Questions List</h3>

   <%-- <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbSD20ConnectionString %>" DeleteCommand="DELETE FROM [tbQuestion] WHERE [QuestionId] = @QuestionId" InsertCommand="INSERT INTO [tbQuestion] ([Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [Marks], [QuizId]) VALUES (@Question, @Answer1, @Answer2, @Answer3, @Answer4, @CorrectAnswer, @Marks, @QuizId)" SelectCommand="SELECT [QuestionId], [Question], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [Marks], [QuizId] FROM [tbQuestion]" UpdateCommand="UPDATE [tbQuestion] SET [Question] = @Question, [Answer1] = @Answer1, [Answer2] = @Answer2, [Answer3] = @Answer3, [Answer4] = @Answer4, [CorrectAnswer] = @CorrectAnswer, [Marks] = @Marks, [QuizId] = @QuizId WHERE [QuestionId] = @QuestionId" OnDeleted="SqlDataSource1_Deleted">
        <DeleteParameters>
            <asp:Parameter Name="QuestionId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Question" Type="String" />
            <asp:Parameter Name="Answer1" Type="String" />
            <asp:Parameter Name="Answer2" Type="String" />
            <asp:Parameter Name="Answer3" Type="String" />
            <asp:Parameter Name="Answer4" Type="String" />
            <asp:Parameter Name="CorrectAnswer" Type="String" />
            <asp:Parameter Name="Marks" Type="Int32" />
            <asp:Parameter Name="QuizId" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Question" Type="String" />
            <asp:Parameter Name="Answer1" Type="String" />
            <asp:Parameter Name="Answer2" Type="String" />
            <asp:Parameter Name="Answer3" Type="String" />
            <asp:Parameter Name="Answer4" Type="String" />
            <asp:Parameter Name="CorrectAnswer" Type="String" />
            <asp:Parameter Name="Marks" Type="Int32" />
            <asp:Parameter Name="QuizId" Type="Int32" />
            <asp:Parameter Name="QuestionId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>



    <div style="overflow-x: auto; width: 550px">
        <asp:Label ID="lblError1" runat="server" Text=""></asp:Label>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="QuestionId" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:TemplateField HeaderText="QuestionId" InsertVisible="False" SortExpression="QuestionId">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("QuestionId") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("QuestionId") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Question" SortExpression="Question">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Question") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Question") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Answer1" SortExpression="Answer1">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Answer1") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Answer1") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Answer2" SortExpression="Answer2">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Answer2") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Answer2") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Answer3" SortExpression="Answer3">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Answer3") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Answer3") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Answer4" SortExpression="Answer4">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Answer4") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Answer4") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="CorrectAnswer" SortExpression="CorrectAnswer">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("CorrectAnswer") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("CorrectAnswer") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Marks" SortExpression="Marks">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Marks") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("Marks") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="QuizId" SortExpression="QuizId">
                    <EditItemTemplate>


                        <asp:DropDownList ID="DropDownList1" SelectedValue='<%# Bind("QuizId") %>' runat="server" DataValueField='QuizId' DataSourceID="SqlDataSource1" DataTextField="QuizTitle"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbSD20ConnectionString %>" SelectCommand="SELECT * FROM [tbQuiz]"></asp:SqlDataSource>
                        <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbSD20ConnectionString %>" SelectCommand="SELECT [QuizTitle] FROM [tbQuiz]"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("QuizId") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    <asp:Button ID="btnAddQuiz" runat="server" Text="Add New Quiz" OnClick="btnAddQuiz_Click" />--%>


            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbSD20ConnectionString %>" DeleteCommand="DELETE FROM [tbQuestion] WHERE [QuestionId] = @QuestionId" InsertCommand="INSERT INTO [tbQuestion] ([Question], [CorrectAnswer], [Marks], [QuizId]) VALUES (@Question, @CorrectAnswer, @Marks, @QuizId)" SelectCommand="SELECT [QuestionId], [Question], [CorrectAnswer], [Marks], [QuizId] FROM [tbQuestion]" UpdateCommand="UPDATE [tbQuestion] SET [Question] = @Question, [CorrectAnswer] = @CorrectAnswer, [Marks] = @Marks, [QuizId] = @QuizId WHERE [QuestionId] = @QuestionId">
                <DeleteParameters>
                    <asp:Parameter Name="QuestionId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Question" Type="String" />
                    <asp:Parameter Name="CorrectAnswer" Type="Int32" />
                    <asp:Parameter Name="Marks" Type="Int32" />
                    <asp:Parameter Name="QuizId" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Question" Type="String" />
                    <asp:Parameter Name="CorrectAnswer" Type="Int32" />
                    <asp:Parameter Name="Marks" Type="Int32" />
                    <asp:Parameter Name="QuizId" Type="Int32" />
                    <asp:Parameter Name="QuestionId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
              <div style="overflow-x: auto; width: 550px">
                  <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="update" />
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="QuestionId" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ValidationGroup="update" />
                    <asp:TemplateField HeaderText="QuestionId" InsertVisible="False" SortExpression="QuestionId">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("QuestionId") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("QuestionId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Question" SortExpression="Question">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Question") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="valQuestion" ValidationGroup="update" runat="server" EnableClientScript="true" ControlToValidate="TextBox1" ErrorMessage="Required Question"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Question") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="CorrectAnswer" SortExpression="CorrectAnswer">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("CorrectAnswer") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="valCorrectAnswer" ValidationGroup="update" runat="server" EnableClientScript="true" ControlToValidate="TextBox2" ErrorMessage="Required CorrectAnswer"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("CorrectAnswer") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Marks" SortExpression="Marks">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Marks") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="valMarks" ValidationGroup="update" runat="server" EnableClientScript="true" ControlToValidate="TextBox3" ErrorMessage="Required Marks"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Marks") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="QuizId" SortExpression="QuizId">
                        <EditItemTemplate>
                               <asp:DropDownList ID="DropDownList1" SelectedValue='<%# Bind("QuizId") %>' runat="server" DataValueField='QuizId' DataSourceID="SqlDataSource1" DataTextField="QuizTitle"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbSD20ConnectionString %>" SelectCommand="SELECT * FROM [tbQuiz]"></asp:SqlDataSource>
                     
                           <%-- <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="SqlDataSource7" DataTextField="QuizTitle" DataValueField="QuizTitle">
                            </asp:DropDownList>
                            <br />
                            <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:dbSD20ConnectionString %>" SelectCommand="SELECT [QuizTitle], [QuizId] FROM [tbQuiz]"></asp:SqlDataSource>--%>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("QuizId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
                  </div>

                <h3>Answers List</h3>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:dbSD20ConnectionString %>" SelectCommand="SELECT [AnswerId], [Answer], [QuestionId] FROM [tbQuestionsAnswer]"></asp:SqlDataSource>
            <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource4">
                <Columns>
                    <asp:BoundField DataField="AnswerId" HeaderText="AnswerId" SortExpression="AnswerId" />
                    <asp:BoundField DataField="Answer" HeaderText="Answer" SortExpression="Answer" />
                    <asp:BoundField DataField="QuestionId" HeaderText="QuestionId" SortExpression="QuestionId" />
                </Columns>
            </asp:GridView>



            </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
