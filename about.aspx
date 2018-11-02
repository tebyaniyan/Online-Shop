<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="about.aspx.cs" Inherits="about" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>
درباره سایت
</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label1" runat="server" Font-Size="Larger" 
    Text="این سایت فعلا به صورت آزمایشی می باشد."></asp:Label>
<br />
<asp:Label ID="Label2" runat="server" Font-Size="Larger" 
    Text="لطفا دوباره مراجعه نمایید."></asp:Label>
</asp:Content>

