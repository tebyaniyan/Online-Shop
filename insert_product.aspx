<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="insert_product.aspx.cs" Inherits="insert_product" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div align="right" dir="rtl">
        نام محصول :
        <asp:TextBox ID="Name" runat="server" Width="276px"></asp:TextBox>
        <br />
        <br />
        توضیحات :
        <br />
        <br />
        <asp:TextBox ID="Desc" runat="server" Height="165px" TextMode="MultiLine" 
            Width="357px"></asp:TextBox>
        <br />
        <br />
        عکس اصلی محصول خود را انتخاب کنید :
        <br />
        <br />
        <asp:FileUpload ID="FileUpload1" runat="server" Width="454px" />
        <br />
        <br />
        قیمت :
        <asp:TextBox ID="price" runat="server"></asp:TextBox>
        <br />
        <br />
        وزن :
        <asp:TextBox ID="weight" runat="server" Width="137px"></asp:TextBox>
        <br />
        <br />
        تعداد :
        <asp:TextBox ID="qty" runat="server" Width="134px"></asp:TextBox>
        <br />
        <br />
        دسته بندی محصول :
        <asp:DropDownList ID="cat" runat="server" DataSourceID="SqlDataSource1" 
            DataTextField="Name_Category" DataValueField="Id_Category">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:eshopConnectionString %>" 
            SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
            Text="درج محصول" />
    </div>
</asp:Content>

