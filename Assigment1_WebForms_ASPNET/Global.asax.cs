using System;

namespace Assigment1_WebForms_ASPNET
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            
        }

        protected void Session_End(object sender, EventArgs e)
        {
            Session.Clear();
        }
    }
}