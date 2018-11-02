<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="product.aspx.cs" Inherits="product" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>
محصولات
</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:eshopConnectionString %>" 
    SelectCommand="SELECT Product.Id_product, Product.Name_product, Product.Image_Path_Product, Product.Price_Product, Category.Name_Category FROM Category INNER JOIN Product ON Category.Id_Category = Product.Id_Category">
</asp:SqlDataSource>
<br />
<div align="right" dir="rtl" style="font-family: tahoma">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Id_product" DataSourceID="SqlDataSource1" Width="100%" 
        AllowPaging="True" BorderStyle="None" ShowHeader="False">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <table class="style1" 
                        style="border-bottom-style: dashed; border-bottom-width: thin; border-bottom-color: #9999FF">
                        <tr>
                            <td>
                                <asp:ImageButton ID="ImageButton1" runat="server" Height="100px" 
                                    ImageUrl='<%# Eval("Image_Path_Product") %>' Width="100px" 
                                    PostBackUrl='<%# "~/detailproduct.aspx?id="+Eval("Id_product") %>' />
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
                            <td>
                                <asp:ImageButton ID="ImageButton2" runat="server" 
                                    ImageUrl="~/image/detail.bmp" 
                                    PostBackUrl='<%# "~/detailproduct.aspx?id="+Eval("Id_product") %>' />
                                <br />
                                <br />
                                <asp:LinkButton ID="LinkButton14" runat="server" 
                                    CommandArgument='<%# Eval("Name_product") %>' 
                                    CommandName='<%# Eval("Id_product") %>' onclick="LinkButton14_Click" 
                                    onclientclick='<%# Eval("Image_Path_Product") %>' 
                                    ValidationGroup='<%# Eval("Price_Product") %>'>basket</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <ControlStyle BorderStyle="None" />
                <ItemStyle BorderStyle="None" />
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</div>
</asp:Content>

