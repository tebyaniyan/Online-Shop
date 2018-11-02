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

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void CreateUserWizard1_FinishButtonClick(object sender, WizardNavigationEventArgs e)
    {
        SqlConnection scon = new SqlConnection(ConfigurationManager.ConnectionStrings["eshopConnectionString"].ToString());
        SqlCommand scom = new SqlCommand("insert into Person (Username_Person,Name_Person,Family_person,Email_Person,Address_Person,Tel_Person,Id_Role) values (@username,@name,@family,@email,@adr,@tel,@role)", scon);
        scom.Parameters.Add("@username", SqlDbType.NVarChar).Value = Membership.GetUser(User.Identity.Name).UserName;
        scom.Parameters.Add("@name", SqlDbType.NVarChar).Value = name.Text;
        scom.Parameters.Add("@family", SqlDbType.NVarChar).Value = family.Text;
        scom.Parameters.Add("@email", SqlDbType.VarChar).Value = Membership.GetUser(User.Identity.Name).Email;
        scom.Parameters.Add("@adr", SqlDbType.NText).Value = address.Text;
        scom.Parameters.Add("@tel", SqlDbType.VarChar).Value = tel.Text;
        scom.Parameters.Add("@role", SqlDbType.Int).Value = 1;
        scon.Open();
        scom.CommandType = CommandType.Text;
        scom.ExecuteNonQuery();
        scon.Close();
    }

}
