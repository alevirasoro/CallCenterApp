using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;
using dominio;

namespace CALL_CENTER
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLoginClick(object sender, EventArgs e)
        {
            Empleado usu = new Empleado("user");
            EmpleadoNegocio negocio = new EmpleadoNegocio();

            try
            {
                usu.User = txtUsu.Text;
                usu.Pass = txtPass.Text;

                if (negocio.Loguear(usu))
                {
                    Session.Add("usuario", usu);
                    Response.Redirect("Incidentes.aspx");
                }

                
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}