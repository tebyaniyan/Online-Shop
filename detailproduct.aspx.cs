using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;

public partial class detailproduct : System.Web.UI.Page
{
    string title;
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection scon = new SqlConnection(ConfigurationManager.ConnectionStrings["eshopConnectionString"].ToString());
        SqlCommand scom = new SqlCommand("select Name_product from product where Id_product=@Id_product", scon);
        scom.Parameters.Add("@Id_product", SqlDbType.Int).Value = int.Parse(Request.QueryString["id"].ToString());
        scon.Open();
        SqlDataReader sdr = scom.ExecuteReader();
        while (sdr.Read())
            title = sdr.GetValue(0).ToString();
        Page.Title = title;
        if (User.Identity.Name != "")
            Panel_Comment.Visible = true;
            
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection scon = new SqlConnection(ConfigurationManager.ConnectionStrings["eshopConnectionString"].ToString());
        SqlCommand scom1 = new SqlCommand("insert into Comment (Body_Comment,Id_Product,Send_Comment,Is_Submit) values (@body,@product,@user,@submit)", scon);
        scom1.Parameters.Add("@body", SqlDbType.NText).Value = Body.Text;
        scom1.Parameters.Add("@product", SqlDbType.Int).Value = int.Parse(Request.QueryString["id"].ToString());
        scom1.Parameters.Add("@user", SqlDbType.NVarChar).Value = User.Identity.Name;
        scom1.Parameters.Add("@submit", SqlDbType.Bit).Value = false;
        scon.Open();
        scom1.CommandType = CommandType.Text;
        scom1.ExecuteNonQuery();
        scon.Close();
        Body.Text = "";
    }
}
