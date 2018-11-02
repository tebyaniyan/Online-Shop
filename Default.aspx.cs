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
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    int role;
    protected void Page_Load(object sender, EventArgs e)
    {
        Label3.Text = Session["id"].ToString();
        SqlConnection scon = new SqlConnection(ConfigurationManager.ConnectionStrings["eshopConnectionString"].ToString());
        SqlCommand scom = new SqlCommand("select Id_Role from person where Username_Person=@Username_Person", scon);
        scom.Parameters.Add("@Username_Person", SqlDbType.NVarChar).Value = User.Identity.Name;
        scon.Open();
        SqlDataReader sdr = scom.ExecuteReader();
        while (sdr.Read())
            role = int.Parse(sdr.GetValue(0).ToString());
        scon.Close();
        if (role == 3)
            Linkmanagement.Visible = true;
    }
    public void SendMailError(object sender, SendMailErrorEventArgs e)
    {
        Response.Redirect("~/smtperror.htm");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/result.aspx?key="+keyword.Text);        
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Session["id"] = "1";
    }
}
