<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="profile.aspx.cs" Inherits="profile" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div align="right" dir="rtl" style="font-family: tahoma">
    <asp:Label ID="username" runat="server" Visible="False"></asp:Label>
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:eshopConnectionString %>" 
        
            SelectCommand="SELECT Person.Id_Person, Person.Name_Person, Person.Family_person, Person.Email_Person, Person.Address_Person, Person.Tel_Person, Person.Id_Role, Person.Username_Person, Role.Name_Role FROM Person INNER JOIN Role ON Person.Id_Role = Role.Id_Role WHERE (Person.Username_Person = @Username_Person)" 
            
            UpdateCommand="UPDATE Person SET Name_Person = @Name_Person, Family_person = @Family_person, Address_Person = @Address_Person, Tel_Person = @Tel_Person WHERE (Username_Person = @Username_Person)">
        <SelectParameters>
            <asp:ControlParameter ControlID="username" Name="Username_Person" 
                PropertyName="Text" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name_Person" />
            <asp:Parameter Name="Family_person" />
            <asp:Parameter Name="Address_Person" />
            <asp:Parameter Name="Tel_Person" />
            <asp:Parameter Name="Username_Person" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <asp:DataList ID="DataList1" runat="server" DataKeyField="Id_Person" 
        DataSourceID="SqlDataSource1" oncancelcommand="DataList1_CancelCommand" 
            oneditcommand="DataList1_EditCommand" onupdatecommand="DataList1_UpdateCommand">
        <EditItemTemplate>
            <div dir="rtl">
                نام :
                <asp:TextBox ID="name" runat="server" Text='<%# Eval("Name_Person") %>'></asp:TextBox>
                <br />
                <br />
                نام خانوادگی :
                <asp:TextBox ID="family" runat="server" Text='<%# Eval("Family_person") %>'></asp:TextBox>
                <br />
                <br />
                تلفن :
                <asp:TextBox ID="tel" runat="server" Text='<%# Eval("Tel_Person") %>'></asp:TextBox>
                <br />
                <br />
                آدرس :<br />
                <br />
&nbsp;<asp:TextBox ID="adr" runat="server" Height="82px" Text='<%# Eval("Address_Person") %>' 
                    TextMode="MultiLine"></asp:TextBox><br />
                <br />
                <asp:Button ID="Button2" runat="server" CommandName="cancel" Text="cancel" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button3" runat="server" CommandName="update" Text="update" />
            </div>
        </EditItemTemplate>
        <ItemTemplate>
            <div dir="rtl">
                شما به عنوان
                <asp:Label ID="Label6" runat="server" Text='<%# Eval("Name_Role") %>' 
                    Font-Bold="True"></asp:Label>
                &nbsp;در سایت عضو هستید .<br />
                <br />
                نام :
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Name_Person") %>'></asp:Label>
                <br />
                <br />
                نام خانوادگی :
                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Family_person") %>'></asp:Label>
                <br />
                <br />
                ایمیل :
                <asp:Label ID="Label3" runat="server" Text='<%# Eval("Email_Person") %>'></asp:Label>
                <br />
                <br />
                تلفن :
                <asp:Label ID="Label4" runat="server" Text='<%# Eval("Tel_Person") %>'></asp:Label>
                <br />
                <br />
                آدرس :
                <asp:Label ID="Label5" runat="server" Text='<%# Eval("Address_Person") %>'></asp:Label>
            </div>
            <br />
            <asp:Button ID="Button1" runat="server" CommandName="edit" Text="Edit" />
            <br />
        </ItemTemplate>
    </asp:DataList>
    <br />
</div>
</asp:Content>

