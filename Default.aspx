<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>
فروشگاه الکترونیکی
</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    &nbsp;<asp:Label ID="Label2" runat="server" Font-Size="50pt" 
    BorderStyle="Solid" ForeColor="#339933">ASP.NET</asp:Label><br />
<br />
<br />
<asp:Label ID="Label3" runat="server"></asp:Label>
<br />
<br />
<asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Button" />
<br />
<br />
<br />
<asp:LinkButton ID="Linkmanagement" runat="server" Font-Underline="False" 
    PostBackUrl="~/management.aspx" Visible="False">ورود به صفحه مدیریت</asp:LinkButton>
    <br />
<br />
    <br />
    <br />
<br />
    <asp:TextBox ID="keyword" runat="server" Width="240px"></asp:TextBox>
    <br />
    <br />
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="search" />
<br />
</asp:Content>

