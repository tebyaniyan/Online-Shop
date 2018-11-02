<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="result.aspx.cs" Inherits="result" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:eshopConnectionString %>" 
        SelectCommand="SELECT Product.Description_Product, Product.Name_product, News.Body_News FROM Product CROSS JOIN News WHERE (Product.Description_Product LIKE '%' + @Description_Product + '%') OR (Product.Name_product LIKE N'%' + @Description_Product + N'%')">
        <SelectParameters>
            <asp:QueryStringParameter Name="Description_Product" QueryStringField="key" 
                Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
        <SeparatorTemplate>
            _________________________________________
        </SeparatorTemplate>
        <ItemTemplate>
            Description_Product:&nbsp;<asp:Label ID="Description_ProductLabel" runat="server" 
                Text='<%# Eval("Description_Product") %>' />
            <br />
            Name_product:
            <asp:Label ID="Name_productLabel" runat="server" 
                Text='<%# Eval("Name_product") %>' />
            <br />
            Body_News:
            <asp:Label ID="Body_NewsLabel" runat="server" Text='<%# Eval("Body_News") %>' />
            <br />
            <br />
        </ItemTemplate>
    </asp:DataList>
</asp:Content>

