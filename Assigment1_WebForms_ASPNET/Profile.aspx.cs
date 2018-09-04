using System;
using System.Web.UI;

namespace Assigment1_WebForms_ASPNET
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Control mainNav = Page.Master.FindControl("mainNav");
            mainNav.Visible = false;
            if (Session["username"].ToString() != null)
            {

                switch (Session["usertype"].ToString())
                {
                    case "E":
                        break;
                    case "S":
                        break;
                    default:
                        break;
                }
            } else
            {
                Response.Redirect("~/SignIn.aspx");
            }
        }
    }
}