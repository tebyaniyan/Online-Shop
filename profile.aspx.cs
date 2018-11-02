using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class profile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.Name == "")
            Response.Redirect("~/Default.aspx");
        username.Text = User.Identity.Name;

    }
    protected void DataList1_EditCommand(object source, DataListCommandEventArgs e)
    {
        DataList1.EditItemIndex = e.Item.ItemIndex;
        DataList1.DataBind();
    }
    protected void DataList1_CancelCommand(object source, DataListCommandEventArgs e)
    {
        DataList1.EditItemIndex = -1;
        DataList1.DataBind();
    }
    protected void DataList1_UpdateCommand(object source, DataListCommandEventArgs e)
    {
        string nameV, FamilyV, telV, adrV;
        nameV = ((TextBox)e.Item.FindControl("name")).Text;
        SqlDataSource1.UpdateParameters["Name_Person"].DefaultValue = nameV;
        FamilyV = ((TextBox)e.Item.FindControl("family")).Text;
        SqlDataSource1.UpdateParameters["Family_person"].DefaultValue = FamilyV;
        telV = ((TextBox)e.Item.FindControl("tel")).Text;
        SqlDataSource1.UpdateParameters["Tel_Person"].DefaultValue = telV;
        adrV = ((TextBox)e.Item.FindControl("adr")).Text;
        SqlDataSource1.UpdateParameters["Address_Person"].DefaultValue = adrV;
        SqlDataSource1.UpdateParameters["Username_Person"].DefaultValue = User.Identity.Name;
        SqlDataSource1.Update();
        DataList1.EditItemIndex = -1;
        DataList1.DataBind();
    }
}
