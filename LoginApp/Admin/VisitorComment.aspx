<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VisitorComment.aspx.cs" Inherits="LoginApp.Admin._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 35%;
        }
        .auto-style2 {
            height: 25px;
        }
        .auto-style3 {
            height: 25px;
            width: 213px;
        }
        .auto-style4 {
            width: 213px;
        }
        .auto-style5 {
            width: 213px;
            height: 29px;
        }
        .auto-style6 {
            height: 29px;
        }
        .auto-style7 {
            width: 213px;
            height: 111px;
        }
        .auto-style8 {
            height: 111px;
        }
        .auto-style9 {
            font-weight: bold;
        }
        .auto-style10 {
            text-align: center;
            font-size: large;
        }
        .auto-style11 {
            color: #0033CC;
        }
        .auto-style12 {
            color: #000000;
        }
        .auto-style13 {
            color: #FF0000;
            text-decoration: underline;
        }
        .auto-style14 {
            text-align: center;
        }
        .auto-style15 {
            color: #FF0000;
            text-align: center;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style10">
            <span class="auto-style12">Welcome</span><span class="auto-style11"> </span> <asp:LoginName ID="LoginName1" runat="server" CssClass="auto-style11" />
        </div>
        <br />
        
        <br />
        <div class="auto-style15">Comments</div>
        <div align="center">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="Id" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" Visible="False" />
                <asp:BoundField DataField="VistorName" HeaderText="VistorName" SortExpression="VistorName" />
                <asp:BoundField DataField="VisitorComment" HeaderText="VisitorComment" SortExpression="VisitorComment" />
                <asp:BoundField DataField="VisitorEmail" HeaderText="VisitorEmail" SortExpression="VisitorEmail" />
                <asp:BoundField DataField="CommentDate" HeaderText="CommentDate" SortExpression="CommentDate" />
                <asp:CheckBoxField DataField="IsEnabled" HeaderText="IsEnabled" SortExpression="IsEnabled" />
            </Columns>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
        </asp:GridView>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cs %>" SelectCommand="SELECT [Id], [VistorName], [VisitorComment], [VisitorEmail], [IsEnabled], [CommentDate] FROM [Visitor] WHERE ([IsEnabled] = @IsEnabled) ORDER BY [CommentDate] DESC">
            <SelectParameters>
                <asp:Parameter DefaultValue="true" Name="IsEnabled" Type="Boolean" />
            </SelectParameters>
        </asp:SqlDataSource>
        <div class="auto-style14">
                    for Admin view click
        <strong>
        <asp:LinkButton ID="redirectToAdminView" runat="server" OnClick="redirectToAdminPage" CssClass="auto-style13" CausesValidation="false">here</asp:LinkButton>
        </strong>
        </div>
        <br />
        <br />
        <div class="auto-style14"><strong>Add Comments</strong></div>
        <table class="auto-style1" align="center">
            <tr>
                <td class="auto-style3">Name</td>
                <td class="auto-style2">
                    <asp:TextBox ID="TextBox1" runat="server" Width="265px" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Email</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" Width="265px" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">Comment</td>
                <td class="auto-style8">
                    <asp:TextBox ID="TextBox3" runat="server" Height="101px" TextMode="MultiLine" Width="267px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox3" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                    
                </td>
            </tr>
            <tr>
                <td class="auto-style5"></td>
                <td class="auto-style6"><strong>
                    <asp:Button ID="AddComment" runat="server" CssClass="auto-style9" OnClick="Button1_Click" Text="Send" />
                    </strong>
                    <asp:Label ID="msg" runat="server" Text=""></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <br />
        <br />
           <div class="auto-style14">
               To Signout Click Here <asp:LoginStatus ID="LoginStatus1" runat="server" />
           </div>

    </form>
</body>
</html>
