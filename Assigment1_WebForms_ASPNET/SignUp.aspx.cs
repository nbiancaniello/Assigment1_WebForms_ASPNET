using System;

namespace Assigment1_WebForms_ASPNET
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            if (txtPassword.Text != txtRePassword.Text)
            {
                // Passwords don't match.
                return;
            }
            Response.Redirect("~/SignIn.aspx");
        }
    }
}