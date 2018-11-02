<%@ Page Language="C#" AutoEventWireup="true" CodeFile="viewimage.aspx.cs" Inherits="viewimage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:eshopConnectionString %>" 
            SelectCommand="SELECT [Path_Image], [Description_Image], [Name_Image], [Id_Image] FROM [Image] WHERE ([Id_Image] = @Id_Image)">
            <SelectParameters>
                <asp:QueryStringParameter Name="Id_Image" QueryStringField="id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="Id_Image" 
            DataSourceID="SqlDataSource1">
            <EditItemTemplate>
                Path_Image:
                <asp:TextBox ID="Path_ImageTextBox" runat="server" 
                    Text='<%# Bind("Path_Image") %>' />
                <br />
                Description_Image:
                <asp:TextBox ID="Description_ImageTextBox" runat="server" 
                    Text='<%# Bind("Description_Image") %>' />
                <br />
                Name_Image:
                <asp:TextBox ID="Name_ImageTextBox" runat="server" 
                    Text='<%# Bind("Name_Image") %>' />
                <br />
                Id_Image:
                <asp:Label ID="Id_ImageLabel1" runat="server" Text='<%# Eval("Id_Image") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                Path_Image:
                <asp:TextBox ID="Path_ImageTextBox" runat="server" 
                    Text='<%# Bind("Path_Image") %>' />
                <br />
                Description_Image:
                <asp:TextBox ID="Description_ImageTextBox" runat="server" 
                    Text='<%# Bind("Description_Image") %>' />
                <br />
                Name_Image:
                <asp:TextBox ID="Name_ImageTextBox" runat="server" 
                    Text='<%# Bind("Name_Image") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Path_Image") %>' />
                <br />
                <br />
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Name_Image") %>'></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Description_Image") %>'></asp:Label>
            </ItemTemplate>
        </asp:FormView>
    
    </div>
    </form>
</body>
</html>
