using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CALL_CENTER
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] == null)
                Response.Redirect("Login.aspx", false);
        }
        public void BtnLogout(object sender, EventArgs e)
        {
            Session.Remove("usuario");
            Response.Redirect("Login.aspx", false);
        }
    }
}