using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace CALL_CENTER
{
    public partial class ModificarPrioridades : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] == null)
            {
                Session.Add("error", "No estas Logueado");
                Response.Redirect("Login.aspx");
            }
            try
            {
                if (!IsPostBack)
                {
                    var argument = (String)Session["PrioridadesModificar"];
                    int id = int.Parse(argument);
                    PrioridadNegocio prioridadNegocio = new PrioridadNegocio();
                    Prioridad prio = new Prioridad("5");
                    prio = prioridadNegocio.traerPrioridad(id);

                    txtPrioridad2.Text = prio.PrioridadIncidente;
                }
            }
            catch (Exception ex)
            {
                Session.Add("Exception", ex.ToString());

                Response.Redirect("Error.aspx");
            }
        }
        public void btnGuardarModificarPrioridad_Click(object sender, EventArgs e)
        {

            PrioridadNegocio prioridadNegocio = new PrioridadNegocio();
            var argument = (String)Session["PrioridadesModificar"];
            int id = int.Parse(argument);
            try
            {
                Prioridad pri = new Prioridad("id");
                pri.ID = id;
                pri.PrioridadIncidente = txtPrioridad2.Text;


                prioridadNegocio.modificarPrioridad(pri);
            }
            catch (Exception ex)
            {
                Session.Add("Exception", ex.ToString());

                Response.Redirect("Error.aspx");
            }
            Response.Redirect("Configuraciones.aspx");
        }

        public void btnCancelarModificarPrioridad(object sender, EventArgs e)
        {
            Response.Redirect("Configuraciones.aspx");
        }
    }
}