using System;

namespace Assigment1_WebForms_ASPNET
{
    public partial class SignOut : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/SignIn.aspx");
        }
    }
}