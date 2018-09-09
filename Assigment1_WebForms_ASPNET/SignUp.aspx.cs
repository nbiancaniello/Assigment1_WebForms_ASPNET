using System;
using System.Configuration;
using System.Data.OleDb;

namespace Assigment1_WebForms_ASPNET
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            string role = string.Empty;
            if (rbSeeker.Checked)
            {
                role = "Applicants";
            } else if (rbRecruiter.Checked)
            {
                role = "Recruiters";
            }

            Guid RoleId = getRoleId(role);

            if (createLogin(RoleId))
            {
                switch (role)
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

        protected void btnCancel_Click(object sender, EventArgs e)
        {

        }

        protected Guid getRoleId(string role)
        {
            Guid Id = Guid.Empty;

            using (OleDbConnection conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["Job_Portal"].ConnectionString))
            using (OleDbCommand cmd = new OleDbCommand(@"Select Id From dbo.Security_roles
                                                        Where Role = '" + role + "'"))
            {
                conn.Open();
                cmd.Connection = conn;
                OleDbDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    Id = reader.GetGuid(0);
                }
                conn.Close();
            }

            return Id;
        }

        protected bool createLogin(Guid RoleId)
        {
            Guid Id = Guid.NewGuid();
            Guid ApplicantId = Guid.NewGuid();
            string username = txtFirstName.Text + txtLastName.Text;

            using (OleDbConnection conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["Job_Portal"].ConnectionString))
            using (OleDbCommand cmd = new OleDbCommand(@"Insert Into Security_Logins (Id, Login, Password, Created_Date, Is_Locked, Is_Inactive, Email_Address, Phone_Number, Full_Name)
                                                        Values (?, ?, ?, ?, ?, ?, ?, ?, ?)"))
            {
                cmd.Connection = conn;
                cmd.Parameters.AddWithValue("@Id", Id.ToString());
                cmd.Parameters.AddWithValue("@Login", username);
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
                cmd.Parameters.AddWithValue("@Created_Date", DateTime.Now.ToString());
                cmd.Parameters.AddWithValue("@Is_Locked", "0");
                cmd.Parameters.AddWithValue("@Is_Inactive", "0");
                cmd.Parameters.AddWithValue("@Email_Address", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Phone_Number", txtPhone.Text);
                cmd.Parameters.AddWithValue("@Full_Name", txtFirstName.Text + " " + txtLastName.Text);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                cmd.Parameters.Clear();
                cmd.CommandText = @"Insert Into Security_Logins_Roles (Id, Login, Role) Values (?,?,?)";
                cmd.Parameters.AddWithValue("@Id", Guid.NewGuid().ToString());
                cmd.Parameters.AddWithValue("@Login", Id.ToString());
                cmd.Parameters.AddWithValue("@Role", RoleId.ToString());

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                cmd.Parameters.Clear();
                cmd.CommandText = @"Insert Into Applicant_Profiles (Id, Login) Values (?,?)";
                cmd.Parameters.AddWithValue("@Id", ApplicantId.ToString());
                cmd.Parameters.AddWithValue("@Login", Id.ToString());

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }

            Session.Add("Id", Id.ToString());
            Session.Add("Username", username);
            Session.Add("Role", "Applicant");
            Session.Add("ApplicantId", ApplicantId);

            return true;
        }
    }
}