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

public partial class product : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void LinkButton14_Click(object sender, EventArgs e)
    {
        int price = int.Parse(((LinkButton)sender).ValidationGroup);
        string name = ((LinkButton)sender).CommandArgument;
        string pic = ((LinkButton)sender).OnClientClick;
        int pid = int.Parse(((LinkButton)sender).CommandName);
        ((OnlineShopping.shoppingCart)Session["cart"]).insert(pid, name, price, 1, pic);
        Response.Redirect("~/product.aspx");
    }
}
