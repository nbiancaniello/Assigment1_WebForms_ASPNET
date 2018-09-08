using System;
using System.Configuration;
using System.Data.OleDb;

namespace Assigment1_WebForms_ASPNET
{
    public partial class ApplicantProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (OleDbConnection conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["Job_Portal"].ConnectionString))
                using (OleDbCommand cmd = new OleDbCommand(@"Select Full_Name, Email_Address, Phone_Number 
                                                             From dbo.Security_Logins 
                                                             Where Id = '" + Session["Id"].ToString() + "'"))
                {
                    conn.Open();
                    cmd.Connection = conn;
                    OleDbDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        string[] fullname = reader.GetString(0).Split(' ');
                        txtFirstName.Text = fullname[0].ToString();
                        txtLastName.Text = fullname[1].ToString();
                        txtEmail.Text = reader.GetString(1);
                        txtPhone.Text = reader.GetString(2);
                    }
                    conn.Close();
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            using (OleDbConnection conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["Job_Portal"].ConnectionString))
            using (OleDbCommand cmd = new OleDbCommand(@"Update 
                                                        Full_Name = @Full_Name, 
                                                        Email_Address = @Email_Address, 
                                                        Phone_Number = @Phone_Number 
                                                        From dbo.Security_Logins 
                                                        Where Id = @Id"))
            {
                cmd.Connection = conn;
                cmd.Parameters.AddWithValue("@Id", Session["Id"].ToString());
                cmd.Parameters.AddWithValue("@Full_Name", txtFirstName.Text + " " + txtLastName.Text);
                cmd.Parameters.AddWithValue("@Email_Address", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Phone_Number", txtPhone.Text);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }
    }
}