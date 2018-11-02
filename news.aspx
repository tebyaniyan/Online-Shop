<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="news.aspx.cs" Inherits="news" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>
اخبار
</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:eshopConnectionString %>" 
    SelectCommand="SELECT News.Id_News, News.Subject_News, News.Day_Send, Month.Name_Month, Year.Name_Year FROM News INNER JOIN Year ON News.Year_Send = Year.Id_Year INNER JOIN Month ON News.Month_Send = Month.Id_Month">
</asp:SqlDataSource>
<div __designer:mapid="20" align="right" dir="rtl" style="font-family: tahoma">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Id_News" DataSourceID="SqlDataSource1" Height="179px" 
        ShowHeader="False" Width="100%" AllowPaging="True" CellPadding="4" 
        ForeColor="#333333" GridLines="None">
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <div align="right" dir="rtl" style="font-family: tahoma">
                        &nbsp;&nbsp;---&nbsp;
                        <asp:LinkButton ID="LinkButton13" runat="server" Font-Underline="False" 
                            Text='<%# Eval("Subject_News") %>' 
                            PostBackUrl='<%# "~/detailnews.aspx?id=" + Eval("Id_News") %>'></asp:LinkButton>
                        <br />
                        <br />
                        درج در تاریخ
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Day_Send") %>'></asp:Label>
                        &nbsp;<asp:Label ID="Label2" runat="server" Text='<%# Eval("Name_Month") %>'></asp:Label>
                        &nbsp;<asp:Label ID="Label3" runat="server" Text='<%# Eval("Name_Year") %>'></asp:Label>
                        <br />
                        <br />
                        _____________________________________________________________________________________</div>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
</div>
<br />
</asp:Content>

