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
    public partial class ApplicantApplyJobs : System.Web.UI.Page
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
            hApplicantId.Value = Session["ApplicantId"].ToString();
        }

        protected void GridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ApplyJob")
            {
                string jobId = GridView.Rows[Convert.ToInt32(e.CommandArgument)].Cells[4].Text;
                saveApplication(jobId);

                ClientScriptManager cs = Page.ClientScript;
                cs.RegisterClientScriptBlock(this.GetType(), "ButtonClickScript", "<script type=\"text/javascript\"> alert('Job Applied Succesfully!')</script>", false);
                Response.Redirect(Request.RawUrl);
            }
        }

        protected void saveApplication(string jobId)
        {
            Guid Id = Guid.NewGuid();

            using (OleDbConnection conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["Job_Portal"].ConnectionString))
            using (OleDbCommand cmd = new OleDbCommand(@"Insert Into Applicant_Job_Applications (Id, Applicant, Job, Application_Date) Values (?, ?, ?, ?)"))
            {
                cmd.Connection = conn;
                cmd.Parameters.AddWithValue("@Id", Id.ToString());
                cmd.Parameters.AddWithValue("@Applicant", Session["ApplicantId"].ToString());
                cmd.Parameters.AddWithValue("@Job", jobId);
                cmd.Parameters.AddWithValue("@Application_Date", DateTime.Now.ToString());

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }

        protected void GridView_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}