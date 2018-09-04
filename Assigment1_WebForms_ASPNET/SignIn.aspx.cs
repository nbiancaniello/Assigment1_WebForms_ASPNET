using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assigment1_WebForms_ASPNET
{
    public partial class SignIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            //validations
            Session.Add("username", txtUser.Text);
            Session.Add("usertype","E");
            Response.Redirect("~/Profile.aspx");
        }
    }
}