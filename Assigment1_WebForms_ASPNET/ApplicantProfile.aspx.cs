using System;
using System.Configuration;
using System.Data.OleDb;
using System.Web.UI;

namespace Assigment1_WebForms_ASPNET
{
    public partial class ApplicantProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session.Count == 0)
                {
                    Response.Redirect("~/SignIn.aspx");
                }
                loadProfile();
            }
        }

        protected void loadProfile()
        {
            Guid applicantId = Guid.Empty;
            using (OleDbConnection conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["Job_Portal"].ConnectionString))
            using (OleDbCommand cmd = new OleDbCommand(@"Select Full_Name, Email_Address, Phone_Number, Current_Salary, Current_Rate, Currency, Country_Code,
                                                                State_Province_Code, Street_Address, City_Town, Zip_Postal_Code, ap.Id
                                                             From dbo.Security_Logins sl join dbo.Applicant_Profiles ap on sl.id = ap.Login
                                                             Where sl.Id = '" + Session["Id"].ToString() + "'"))
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
                    txtCurrentSalary.Text = reader.GetDecimal(3).ToString();
                    txtCurrentRate.Text = reader.GetDecimal(4).ToString();
                    ddlCurrency.SelectedValue = reader.GetString(5);
                    ddlCountryCode.SelectedValue = reader.GetString(6);
                    ddlStateProvince.SelectedValue = reader.GetString(7);
                    txtStreet.Text = reader.GetString(8);
                    txtCityTown.Text = reader.GetString(9);
                    txtZipPostalCode.Text = reader.GetString(10);
                    applicantId = reader.GetGuid(11);
                }
                conn.Close();
            }

            Session.Add("ApplicantId",applicantId.ToString());
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            using (OleDbConnection conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["Job_Portal"].ConnectionString))
            using (OleDbCommand cmd = new OleDbCommand(@"Update dbo.Security_Logins 
                                                        set Full_Name = ?, 
                                                        Email_Address = ?, 
                                                        Phone_Number = ?
                                                        Where Id = ?"))
            {
                cmd.Connection = conn;
                cmd.Parameters.AddWithValue("@Full_Name", txtFirstName.Text + " " + txtLastName.Text);
                cmd.Parameters.AddWithValue("@Email_Address", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Phone_Number", txtPhone.Text);
                cmd.Parameters.AddWithValue("@Id", Session["Id"].ToString());
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                cmd.Parameters.Clear();
                cmd.CommandText = @"Update dbo.Applicant_Profiles 
                                    set Current_Salary = ?, 
                                    Current_Rate = ?, 
                                    Currency = ?,
                                    Country_Code = ?,
                                    State_Province_Code = ?,
                                    Street_Address = ?,
                                    City_Town = ?,
                                    Zip_Postal_Code = ?
                                    Where Login = ?";
                cmd.Parameters.AddWithValue("@Current_Salary", txtCurrentSalary.Text);
                cmd.Parameters.AddWithValue("@Current_Rate", txtCurrentRate.Text);
                cmd.Parameters.AddWithValue("@Currency", ddlCurrency.SelectedValue);
                cmd.Parameters.AddWithValue("@Country_Code", ddlCountryCode.SelectedValue);
                cmd.Parameters.AddWithValue("@State_Province_Code", ddlStateProvince.SelectedValue);
                cmd.Parameters.AddWithValue("@Street_Address", txtStreet.Text);
                cmd.Parameters.AddWithValue("@City_Town", txtCityTown.Text);
                cmd.Parameters.AddWithValue("@Zip_Postal_Code", txtZipPostalCode.Text);
                cmd.Parameters.AddWithValue("@Login", Session["Id"].ToString());
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            ClientScriptManager cs = Page.ClientScript;
            cs.RegisterClientScriptBlock(this.GetType(), "ButtonClickScript", "<script type=\"text/javascript\"> alert('Changes saved succesfully!')</script>", false);
        }
    }
}