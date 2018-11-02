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

public partial class insert_product : System.Web.UI.Page
{
    string path_image;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["role"]!="admin")
            Response.Redirect("~/Default.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {        
        SqlConnection scon = new SqlConnection(ConfigurationManager.ConnectionStrings["eshopConnectionString"].ToString());
        SqlCommand scom1 = new SqlCommand("insert into product (Name_product,Description_Product,Image_Path_Product,Price_Product,Weight_Product,Qty_Product,Id_Category) values (@name,@desc,@path,@price,@weight,@qty,@cat)", scon);
        scom1.Parameters.Add("@name", SqlDbType.NVarChar).Value = Name.Text;
        scom1.Parameters.Add("@desc", SqlDbType.NText).Value =Desc.Text;
        scom1.Parameters.Add("@price", SqlDbType.Int).Value =int.Parse(price.Text);
        scom1.Parameters.Add("@weight", SqlDbType.Int).Value =int.Parse(weight.Text);
        scom1.Parameters.Add("@qty", SqlDbType.Int).Value =int.Parse(qty.Text);
        scom1.Parameters.Add("@cat", SqlDbType.Int).Value =int.Parse(cat.SelectedValue);
        path_image = Server.MapPath("Image_product/") + FileUpload1.FileName;
        FileUpload1.SaveAs(path_image);
        scom1.Parameters.Add("@path", SqlDbType.NText).Value = path_image;
        scon.Open();
        scom1.CommandType = CommandType.Text;
        scom1.ExecuteNonQuery();
        scon.Close();

    }
}
