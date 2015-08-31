<%@ Page Title="" Language="C#" MasterPageFile="~/Header_Footer.Master" AutoEventWireup="true" CodeBehind="ExamPage.aspx.cs" Inherits="Group_Project_Online_Exam.ExamPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="compiled/flipclock.css" rel="stylesheet" />
    <script src="compiled/flipclock.js"></script>
    <asp:HiddenField ID="hiddenSeconds" Value="" runat="server" />
    <div class="clock" style="margin: 2em;"></div>
   
                <asp:UpdatePanel ID="UpdatePanel1"   runat="server">
        <ContentTemplate>
                        <div style="font-size: x-large; width: 694px;">
                            <asp:Label ID="lblComplted" Font-Size="Medium" ForeColor="Red" runat="server" Text=""></asp:Label>

                <br />
            <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
            
            <asp:Label ID="lblQuestion" runat="server" Text=""></asp:Label>
                <br />
            <asp:RadioButtonList ID="RadioButtonList1" runat="server">
            </asp:RadioButtonList><br />
                <table>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                                    <td>
                                        <asp:Button ID="btnback" runat="server" Text="Back" OnClick="btnback_Click" Width="110px" /></td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                                    <td>
                                        <asp:Button ID="btnNext" runat="server" Text="Next" OnClick="btnNext_Click" Width="110px" /></td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                        <td> <asp:Button ID="btnfinish" runat="server" Text="Finish" OnClick="btnfinish_Click1" Width="110px" /></td>
                       
            </td>
                    </tr>
                </table>
                </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    

           
   
    
  
<script>

    var clock;

    $(document).ready(function () {

        seconds = $("#ContentPlaceHolder1_ContentPlaceHolder1_hiddenSeconds").val();

        clock = new FlipClock($('.clock'), seconds, {
            clockFace: 'MinuteCounter',
            countdown: true,
            autostart: true
        });
    });

    
</script>
    
   

</asp:Content>
