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
    public partial class ApplicantResume : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session.Count == 0)
                {
                    Response.Redirect("~/SignIn.aspx");
                }
                if (Session["Resume"] == null)
                {
                    Session.Add("Resume", "0");
                }
                
                retrieveResume();
            }
        }

        protected void retrieveResume()
        {
            using (OleDbConnection conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["Job_Portal"].ConnectionString))
            using (OleDbCommand cmd = new OleDbCommand(@"Select Resume From dbo.Applicant_Resumes Where Applicant = '" + Session["ApplicantId"].ToString() + "'"))
            {
                conn.Open();
                cmd.Connection = conn;
                OleDbDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    txtResume.Text = reader.GetString(0);
                }
                conn.Close();
            }

            if (txtResume.Text.Count() > 0)
            {
                Session["Resume"] = "1";
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Session["Resume"].ToString() == "0")
            {
                using (OleDbConnection conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["Job_Portal"].ConnectionString))
                using (OleDbCommand cmd = new OleDbCommand(@"Insert into dbo.Applicant_Resumes (Id,Applicant,Resume) Values (?,?,?)"))
                {
                    cmd.Connection = conn;
                    cmd.Parameters.AddWithValue("@Id", Guid.NewGuid());
                    cmd.Parameters.AddWithValue("@Applicant", Session["ApplicantId"].ToString());
                    cmd.Parameters.AddWithValue("@Resume", txtResume.Text);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            } else
            {
                using (OleDbConnection conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["Job_Portal"].ConnectionString))
                using (OleDbCommand cmd = new OleDbCommand(@"Update dbo.Applicant_Resumes
                                                            Set Resume = ?
                                                            Where Applicant = '" + Session["ApplicantId"].ToString() + "'"))
                {
                    cmd.Connection = conn;
                    cmd.Parameters.AddWithValue("@Resume", txtResume.Text);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }

            ClientScriptManager cs = Page.ClientScript;
            cs.RegisterClientScriptBlock(this.GetType(), "ButtonClickScript", "<script type=\"text/javascript\"> alert('Changes saved succesfully!')</script>", false);
        }
    }
}