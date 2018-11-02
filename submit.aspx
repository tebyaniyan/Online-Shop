<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="submit.aspx.cs" Inherits="submit" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:eshopConnectionString %>" 
    DeleteCommand="DELETE FROM Comment WHERE (Id_Comment = @Id_Comment)" 
    SelectCommand="SELECT Comment.Id_Comment, Comment.Body_Comment, Product.Name_product, Comment.Send_Comment, Comment.Is_Submit FROM Comment INNER JOIN Product ON Comment.Id_Product = Product.Id_product WHERE (Comment.Is_Submit = 0)" 
    UpdateCommand="UPDATE Comment SET Is_Submit = 1 WHERE (Id_Comment = @Id_Comment)">
    <DeleteParameters>
        <asp:Parameter Name="Id_Comment" />
    </DeleteParameters>
    <UpdateParameters>
        <asp:Parameter Name="Id_Comment" />
    </UpdateParameters>
</asp:SqlDataSource>
<br />
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    DataKeyNames="Id_Comment" DataSourceID="SqlDataSource1">
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        <asp:BoundField DataField="Body_Comment" HeaderText="Body_Comment" 
            SortExpression="Body_Comment" />
        <asp:BoundField DataField="Name_product" HeaderText="Name_product" 
            SortExpression="Name_product" />
        <asp:BoundField DataField="Send_Comment" HeaderText="Send_Comment" 
            SortExpression="Send_Comment" />
        <asp:CheckBoxField DataField="Is_Submit" HeaderText="Is_Submit" 
            SortExpression="Is_Submit" />
    </Columns>
</asp:GridView>
</asp:Content>

