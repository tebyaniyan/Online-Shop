<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="detailproduct.aspx.cs" Inherits="detailproduct" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div align="right" dir="rtl" style="font-family: tahoma">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:eshopConnectionString %>" 
            SelectCommand="SELECT Product.Name_product, Product.Description_Product, Product.Image_Path_Product, Product.Price_Product, Category.Name_Category FROM Category INNER JOIN Product ON Category.Id_Category = Product.Id_Category WHERE (Product.Id_product = @Id_product)">
            <SelectParameters>
                <asp:QueryStringParameter Name="Id_product" QueryStringField="id" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:eshopConnectionString %>" 
            SelectCommand="SELECT [Id_Image], [Id_Product], [Path_Image] FROM [Image] WHERE ([Id_Product] = @Id_Product)">
            <SelectParameters>
                <asp:QueryStringParameter Name="Id_Product" QueryStringField="id" 
                    Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="FormView1" runat="server" AllowPaging="True" 
            DataKeyNames="Id_Image" DataSourceID="SqlDataSource2" HorizontalAlign="Center">
            <EditItemTemplate>
                Id_Image:
                <asp:Label ID="Id_ImageLabel1" runat="server" Text='<%# Eval("Id_Image") %>' />
                <br />
                Id_Product:
                <asp:TextBox ID="Id_ProductTextBox" runat="server" 
                    Text='<%# Bind("Id_Product") %>' />
                <br />
                Path_Image:
                <asp:TextBox ID="Path_ImageTextBox" runat="server" 
                    Text='<%# Bind("Path_Image") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                Id_Product:
                <asp:TextBox ID="Id_ProductTextBox" runat="server" 
                    Text='<%# Bind("Id_Product") %>' />
                <br />
                Path_Image:
                <asp:TextBox ID="Path_ImageTextBox" runat="server" 
                    Text='<%# Bind("Path_Image") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:ImageButton ID="ImageButton1" runat="server" Height="200px" 
                    ImageUrl='<%# Eval("Path_Image") %>' 
                    PostBackUrl='<%# "~/viewimage.aspx?id="+Eval("Id_Image") %>' Width="200px" />
                <br />
            </ItemTemplate>
        </asp:FormView>
        <br />
        <br />
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" 
            Width="100%">
            <ItemTemplate>
                <table class="style1" 
                    style="border-bottom-style: dashed; border-bottom-width: thin; border-bottom-color: #9999FF">
                    <tr>
                        <td>
                            <asp:Image ID="Image1" runat="server" Height="100px" 
                                ImageUrl='<%# Eval("Image_Path_Product") %>' Width="100px" />
                        </td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Name_product") %>'></asp:Label>
                        </td>
                        <td>
                            قیمت :
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Price_Product") %>'></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Name_Category") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td width="100">
                            &nbsp;</td>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("Description_Product") %>'></asp:Label>
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:eshopConnectionString %>" 
            
            SelectCommand="SELECT Comment.Body_Comment, Comment.Id_Product, Comment.Send_Comment, Comment.Day_Send, Month.Name_Month, Year.Name_Year, Comment.Is_Submit FROM Comment INNER JOIN Month ON Comment.Month_Send = Month.Id_Month INNER JOIN Year ON Comment.Year_Send = Year.Id_Year WHERE (Comment.Id_Product = @Id_Product) AND (Comment.Is_Submit = 1)">
            <SelectParameters>
                <asp:QueryStringParameter Name="Id_Product" QueryStringField="id" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource3" ShowHeader="False" Width="100%">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <div dir="rtl" 
                            style="border-bottom-style: dashed; border-bottom-width: thin; border-bottom-color: #000000">
                            فرستاده شده توسط&nbsp;
                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("Send_Comment") %>'></asp:Label>
                            <br />
                            <br />
                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("Body_Comment") %>'></asp:Label>
                            <br />
                            <br />
                            ارسال شده در تاریخ :
                            <asp:Label ID="day" runat="server" Text='<%# Eval("Day_Send") %>'></asp:Label>
                            &nbsp;&nbsp;
                            <asp:Label ID="month" runat="server" Text='<%# Eval("Name_Month") %>'></asp:Label>
                            &nbsp;&nbsp;
                            <asp:Label ID="year" runat="server" Text='<%# Eval("Name_Year") %>'></asp:Label>
                            <br />
                            <br />
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
        <asp:Panel ID="Panel_Comment" runat="server" Visible="False">
            نظر خود را در مورد این محصول&nbsp; بیان کنید :<br />
            <br />
            <asp:TextBox ID="Body" runat="server" Height="109px" TextMode="MultiLine" 
                Width="680px"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                Text="درج نظر" />
        </asp:Panel>
        <br />
    </div>
</asp:Content>

