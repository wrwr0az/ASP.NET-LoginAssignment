<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="commentControl.aspx.cs" Inherits="LoginApp.Admin.commentControl" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div align="center">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" CssClass="auto-style1">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="VistorName" HeaderText="VistorName" SortExpression="VistorName" />
                    <asp:BoundField DataField="VisitorComment" HeaderText="VisitorComment" SortExpression="VisitorComment" />
                    <asp:BoundField DataField="VisitorEmail" HeaderText="VisitorEmail" SortExpression="VisitorEmail" />
                    <asp:BoundField DataField="CommentDate" HeaderText="CommentDate" SortExpression="CommentDate" />
                    <asp:CheckBoxField DataField="IsEnabled" HeaderText="IsEnabled" SortExpression="IsEnabled" />
                </Columns>
                <FooterStyle BackColor="#CCCC99" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#F7F7DE" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                <SortedAscendingHeaderStyle BackColor="#848384" />
                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                <SortedDescendingHeaderStyle BackColor="#575357" />
                </asp:GridView>
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cs %>" DeleteCommand="DELETE FROM [Visitor] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Visitor] ([VistorName], [VisitorComment], [VisitorEmail], [CommentDate], [IsEnabled]) VALUES (@VistorName, @VisitorComment, @VisitorEmail, @CommentDate, @IsEnabled)" SelectCommand="SELECT [Id], [VistorName], [VisitorComment], [VisitorEmail], [CommentDate], [IsEnabled] FROM [Visitor] ORDER BY [CommentDate] DESC" UpdateCommand="UPDATE [Visitor] SET [VistorName] = @VistorName, [VisitorComment] = @VisitorComment, [VisitorEmail] = @VisitorEmail, [CommentDate] = @CommentDate, [IsEnabled] = @IsEnabled WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="VistorName" Type="String" />
                    <asp:Parameter Name="VisitorComment" Type="String" />
                    <asp:Parameter Name="VisitorEmail" Type="String" />
                    <asp:Parameter DbType="DateTime2" Name="CommentDate" />
                    <asp:Parameter Name="IsEnabled" Type="Boolean" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="VistorName" Type="String" />
                    <asp:Parameter Name="VisitorComment" Type="String" />
                    <asp:Parameter Name="VisitorEmail" Type="String" />
                    <asp:Parameter DbType="DateTime2" Name="CommentDate" />
                    <asp:Parameter Name="IsEnabled" Type="Boolean" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
