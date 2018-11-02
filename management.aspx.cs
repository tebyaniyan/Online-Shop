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

public partial class management : System.Web.UI.Page
{
    int role;
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection scon = new SqlConnection(ConfigurationManager.ConnectionStrings["eshopConnectionString"].ToString());
        SqlCommand scom = new SqlCommand("select Id_Role from person where Username_Person=@Username_Person", scon);
        scom.Parameters.Add("@Username_Person", SqlDbType.NVarChar).Value = User.Identity.Name;
        scon.Open();
        SqlDataReader sdr = scom.ExecuteReader();
        while (sdr.Read())
            role = int.Parse(sdr.GetValue(0).ToString());
        scon.Close();
        if (role == 3)
            Session["role"] = "admin";
        if (role != 3)
            Response.Redirect("~/Default.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection scon = new SqlConnection(ConfigurationManager.ConnectionStrings["eshopConnectionString"].ToString());
        SqlCommand scom1 = new SqlCommand("insert into news (Subject_News,Body_News,Day_Send,Month_Send,Year_Send) values (@Sub,@body,@day,@month,@year)", scon);
        scom1.Parameters.Add("@sub", SqlDbType.NText).Value = Subject.Text;
        scom1.Parameters.Add("@body", SqlDbType.NText).Value = Body.Text;
        scom1.Parameters.Add("@day", SqlDbType.Int).Value =int.Parse(Day.SelectedValue);
        scom1.Parameters.Add("@month", SqlDbType.Int).Value = int.Parse(Month.SelectedValue);
        scom1.Parameters.Add("@year", SqlDbType.Int).Value = int.Parse(Year.SelectedValue);
        scon.Open();
        scom1.CommandType = CommandType.Text;
        scom1.ExecuteNonQuery();
        scon.Close();
        Subject.Text = "";
        Body.Text = "";
    }
}
