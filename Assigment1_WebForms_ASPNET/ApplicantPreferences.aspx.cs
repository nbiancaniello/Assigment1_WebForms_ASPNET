using System;

namespace Assigment1_WebForms_ASPNET
{
    public partial class ApplicantPreferences : System.Web.UI.Page
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
    }
}