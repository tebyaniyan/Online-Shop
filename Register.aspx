<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div dir="rtl" style="font-family: tahoma" align="center">
        <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" 
            CreateUserButtonText="ثبت نام" Height="368px" Width="567px" 
            CancelButtonText="انصراف" CompleteSuccessText="حساب کاربری شما ساخته شد" 
            ContinueButtonText="پایان ثبت نام" ContinueDestinationPageUrl="~/Default.aspx" 
            onfinishbuttonclick="CreateUserWizard1_FinishButtonClick">
            <WizardSteps>
                <asp:WizardStep runat="server" Title="wellcom">
                    برای عضویت در فروشگاه ما روی دکمه Next کلیک کنید.</asp:WizardStep>
                <asp:CreateUserWizardStep runat="server">
                </asp:CreateUserWizardStep>
                <asp:WizardStep runat="server" Title="other data">
                    <div align="right" dir="rtl" style="font-family: tahoma">
                        نام :
                        <asp:TextBox ID="name" runat="server"></asp:TextBox>
                        <br />
                        <br />
                        نام خانوادگی :
                        <asp:TextBox ID="family" runat="server"></asp:TextBox>
                        <br />
                        <br />
                        آدرس :<br />
                        <br />
&nbsp;<asp:TextBox ID="address" runat="server" Height="72px" TextMode="MultiLine" Width="197px"></asp:TextBox><br />
                        <br />
                        تلفن تماس :
                        <asp:TextBox ID="tel" runat="server"></asp:TextBox>
                    </div>
                </asp:WizardStep>
                <asp:CompleteWizardStep runat="server" />
            </WizardSteps>
        </asp:CreateUserWizard>
    </div>
</asp:Content>

