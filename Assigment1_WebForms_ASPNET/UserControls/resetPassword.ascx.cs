using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assigment1_WebForms_ASPNET
{
    public partial class resetPassword : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            int count;
            using (OleDbConnection conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["Job_Portal"].ConnectionString))
            using (OleDbCommand cmd = new OleDbCommand(@"select count(Login) from dbo.Security_Logins where Email_Address = '" + txtEmail.Text + "'"))
            {
                conn.Open();
                cmd.Connection = conn;
                count = (int) cmd.ExecuteScalar();
                conn.Close();
            }

            ClientScriptManager cs = Page.ClientScript;

            if (count > 0)
            {
                string newPasswd = new string(Enumerable.Repeat("ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789", 10).Select(s => s[new Random().Next(s.Length)]).ToArray());

                using (OleDbConnection conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["Job_Portal"].ConnectionString))
                using (OleDbCommand cmd = new OleDbCommand(@"Update dbo.Security_Logins Set Password = '" + newPasswd + "' where Email_Address = '" + txtEmail.Text + "'"))
                {
                    conn.Open();
                    cmd.Connection = conn;
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }

                cs.RegisterClientScriptBlock(this.GetType(), "ButtonClickScript", "<script type=\"text/javascript\"> alert('New Password Generated: " + newPasswd +"')</script>", false);
            } else
            {
                cs.RegisterClientScriptBlock(this.GetType(), "ButtonClickScript", "<script type=\"text/javascript\"> alert('Email is not registered, please retry.')</script>", false);
            }
        }
    }
}