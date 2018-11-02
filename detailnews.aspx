<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="detailnews.aspx.cs" Inherits="detailnews" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div align="right" dir="rtl" style="font-family: tahoma">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:eshopConnectionString %>" 
            SelectCommand="SELECT News.Subject_News, News.Body_News, News.Day_Send, Month.Name_Month, Year.Name_Year FROM News INNER JOIN Month ON News.Month_Send = Month.Id_Month INNER JOIN Year ON News.Year_Send = Year.Id_Year WHERE (News.Id_News = @Id_News)">
            <SelectParameters>
                <asp:QueryStringParameter Name="Id_News" QueryStringField="id" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Label ID="Label6" runat="server" 
            Text="کاربر گرامی شما خبری را انتخاب نکردید." Visible="False"></asp:Label>
        <br />
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
            <SeparatorTemplate>
                ***********************************************************************************
            </SeparatorTemplate>
            <ItemTemplate>
                <div align="right" dir="rtl" style="font-family: tahoma">
                    &nbsp;&nbsp;---&nbsp;
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("Subject_News") %>'></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("Body_News") %>'></asp:Label>
                    <br />
                    <br />
                    درج در تاریخ
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Day_Send") %>'></asp:Label>
                    &nbsp;<asp:Label ID="Label2" runat="server" Text='<%# Eval("Name_Month") %>'></asp:Label>
                    &nbsp;<asp:Label ID="Label3" runat="server" Text='<%# Eval("Name_Year") %>'></asp:Label>
                    <br />
                    <br />
                </div>
                <br />
            </ItemTemplate>
        </asp:DataList>
</div>
</asp:Content>

