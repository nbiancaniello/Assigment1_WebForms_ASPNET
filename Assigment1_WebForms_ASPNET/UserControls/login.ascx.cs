using System;
using System.Configuration;
using System.Data.OleDb;
using System.Web.UI;

namespace Assigment1_WebForms_ASPNET.UserControls
{
    public partial class login : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            if (saveUserLogin())
            {

                switch (Session["Role"].ToString())
                {
                    case "Applicants":
                        Response.Redirect("~/ApplicantProfile.aspx");
                        break;
                    case "Recruiters":
                    case "Administrators":
                    case "Clients":
                        break;
                }

            }
        }

        protected bool saveUserLogin()
        {
            ClientScriptManager cs = Page.ClientScript;
            string username = txtUser.Text;
            Guid Id = Guid.Empty;
            string pass = null;
            string role = null;
            string applicantId = null;

            using (OleDbConnection conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["Job_Portal"].ConnectionString))
            using (OleDbCommand cmd = new OleDbCommand(@"Select sl.Id, sl.Password, sr.Role, ap.Id
                                                        From dbo.Security_Logins sl join dbo.Security_Logins_Roles slr
                                                        on sl.id = slr.login
                                                        join dbo.Security_roles sr on slr.Role = sr.Id
                                                        join dbo.Applicant_Profiles ap on sl.Id = ap.Login
                                                        Where sl.login = '" + username + "'"))
            {
                conn.Open();
                cmd.Connection = conn;
                OleDbDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    Id = reader.GetGuid(0);
                    pass = reader.GetString(1);
                    role = reader.GetString(2);
                    applicantId = reader.GetGuid(3).ToString();
                }
                conn.Close();
            }

            if (pass == null)
            {
                cs.RegisterClientScriptBlock(this.GetType(), "ButtonClickScript", "<script type=\"text/javascript\"> alert('User does not exist')</script>", false);
                return false;
            }

            if (txtPassword.Text != pass)
            {
                cs.RegisterClientScriptBlock(this.GetType(), "ButtonClickScript", "<script type=\"text/javascript\"> alert('User and Password are incorrec')</script>", false);
                return false;
            }

            Session.Add("Id", Id.ToString());
            Session.Add("Username", username);
            Session.Add("Role", role);
            Session.Add("ApplicantId", applicantId);

            return true;
        }
    }
}