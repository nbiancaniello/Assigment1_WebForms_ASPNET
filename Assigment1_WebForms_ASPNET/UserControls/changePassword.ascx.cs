using System;
using System.Configuration;
using System.Data.OleDb;
using System.Web.UI;

namespace Assigment1_WebForms_ASPNET.UserControls
{
    public partial class changePassword : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session.Count == 0)
                {
                    Response.Redirect("~/SignIn.aspx");
                }
            }
        }

        protected void btnChange_Click(object sender, EventArgs e)
        {
            if (!checkPassword())
            {
                return;
            }

            updatePassword();
        }

        protected bool checkPassword()
        {
            string oldPassword = String.Empty;
            using (OleDbConnection conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["Job_Portal"].ConnectionString))
            using (OleDbCommand cmd = new OleDbCommand(@"select Password from dbo.Security_Logins where Id = '" + Session["Id"].ToString() +"'"))
            {
                conn.Open();
                cmd.Connection = conn;
                OleDbDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    oldPassword = reader.GetString(0);
                }
                conn.Close();
            }

            if (txtOldPassword.Text != oldPassword)
            {
                ClientScriptManager cs = Page.ClientScript;
                cs.RegisterClientScriptBlock(this.GetType(), "ButtonClickScript", "<script type=\"text/javascript\"> alert('The current Password does not match, please retry.')</script>", false);
                return false;
            }

            return true;            
        }

        protected void updatePassword()
        {
            using (OleDbConnection conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["Job_Portal"].ConnectionString))
            using (OleDbCommand cmd = new OleDbCommand(@"Update dbo.Security_Logins set Password = '" + txtNewPassword.Text + "' Where Id = '"+ Session["Id"].ToString() + "'"))
            {
                cmd.Connection = conn;
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            ClientScriptManager cs = Page.ClientScript;
            cs.RegisterClientScriptBlock(this.GetType(), "ButtonClickScript", "<script type=\"text/javascript\"> alert('Changes saved succesfully!')</script>", false);
        }
    }
}