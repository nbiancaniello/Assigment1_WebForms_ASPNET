﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assigment1_WebForms_ASPNET
{
    public partial class JobsApplied : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session.Count == 0)
                {
                    Response.Redirect("~/SignIn.aspx");
                }
                hApplicantId.Value = Session["ApplicantId"].ToString();
            }
        }
    }
}