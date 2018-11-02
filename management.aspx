<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="management.aspx.cs" Inherits="management" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel_News" runat="server">
        <div align="right" dir="rtl">
            موضوع خبر :
            <asp:TextBox ID="Subject" runat="server" Width="300px"></asp:TextBox>
            <br />
            <br />
            متن خبر :
            <br />
            <br />
            <asp:TextBox ID="Body" runat="server" Height="285px" TextMode="MultiLine" 
                Width="477px"></asp:TextBox>
            <br />
            <br />
            تاریخ درج خبر :<br />
            <br />
            روز :
            <asp:DropDownList ID="Day" runat="server">
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
                <asp:ListItem>5</asp:ListItem>
                <asp:ListItem>6</asp:ListItem>
                <asp:ListItem>7</asp:ListItem>
                <asp:ListItem>8</asp:ListItem>
                <asp:ListItem>9</asp:ListItem>
                <asp:ListItem>10</asp:ListItem>
                <asp:ListItem>11</asp:ListItem>
                <asp:ListItem>12</asp:ListItem>
                <asp:ListItem>13</asp:ListItem>
                <asp:ListItem>14</asp:ListItem>
                <asp:ListItem>15</asp:ListItem>
                <asp:ListItem>16</asp:ListItem>
                <asp:ListItem>17</asp:ListItem>
                <asp:ListItem>18</asp:ListItem>
                <asp:ListItem>19</asp:ListItem>
                <asp:ListItem>20</asp:ListItem>
                <asp:ListItem>21</asp:ListItem>
                <asp:ListItem>22</asp:ListItem>
                <asp:ListItem>23</asp:ListItem>
                <asp:ListItem>24</asp:ListItem>
                <asp:ListItem>25</asp:ListItem>
                <asp:ListItem>26</asp:ListItem>
                <asp:ListItem>27</asp:ListItem>
                <asp:ListItem>28</asp:ListItem>
                <asp:ListItem>29</asp:ListItem>
                <asp:ListItem>30</asp:ListItem>
                <asp:ListItem>31</asp:ListItem>
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ماه :
            <asp:DropDownList ID="Month" runat="server" DataSourceID="SqlDataSource1" 
                DataTextField="Name_Month" DataValueField="Id_Month">
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; سال :
            <asp:DropDownList ID="Year" runat="server" DataSourceID="SqlDataSource2" 
                DataTextField="Name_Year" DataValueField="Id_Year">
            </asp:DropDownList>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                Text="درج خبر" />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:eshopConnectionString %>" 
                SelectCommand="SELECT * FROM [Month]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:eshopConnectionString %>" 
                SelectCommand="SELECT * FROM [Year]"></asp:SqlDataSource>
            <br />
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                ConnectionString="<%$ ConnectionStrings:eshopConnectionString %>" 
                DeleteCommand="DELETE FROM News WHERE (Id_News = @Id_News)" 
                SelectCommand="SELECT News.* FROM News">
                <DeleteParameters>
                    <asp:Parameter Name="Id_News" />
                </DeleteParameters>
            </asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                AutoGenerateColumns="False" DataKeyNames="Id_News" 
                DataSourceID="SqlDataSource3" ShowHeader="False">
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
                    <asp:BoundField DataField="Subject_News" HeaderText="Subject_News" 
                        SortExpression="Subject_News" />
                    <asp:BoundField DataField="Day_Send" HeaderText="Day_Send" 
                        SortExpression="Day_Send" />
                    <asp:BoundField DataField="Month_Send" HeaderText="Month_Send" 
                        SortExpression="Month_Send" />
                    <asp:BoundField DataField="Year_Send" HeaderText="Year_Send" 
                        SortExpression="Year_Send" />
                </Columns>
            </asp:GridView>
        </div>
    </asp:Panel>
</asp:Content>

