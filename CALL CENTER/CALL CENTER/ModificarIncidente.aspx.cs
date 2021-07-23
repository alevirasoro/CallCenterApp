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
    public partial class ModificarIncidente : System.Web.UI.Page
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
                    //var argument = (String)Session["IncidenteModificar"];
                    //int id = int.Parse(argument);
                    //IncidenteNegocio negocio = new IncidenteNegocio();
                    //Incidente incidente = new Incidente();
                    //incidente = negocio.buscarIncidente(id);


                    EmpleadoNegocio empleado = new EmpleadoNegocio();
                    ddlEmpleados.DataSource = empleado.listar();
                    ddlEmpleados.DataTextField = "Email";
                    ddlEmpleados.DataValueField = "ID";
                    ddlEmpleados.DataBind();
                }
            }
            catch(Exception ex)
            {
                throw ex;
            }

        }
        public void btnGuardarIncMod(object sender, EventArgs e)
        {
            try
            {
                var argument = (String)Session["IncidenteModificar"];
                int id = int.Parse(argument);
                IncidenteNegocio negocio = new IncidenteNegocio();
                Incidente incidente = new Incidente();
                incidente = negocio.buscarIncidente(id);
                incidente.idEmpleado = int.Parse(ddlEmpleados.SelectedItem.Value);
                negocio.modificar(incidente);
            }
            catch(Exception ex)
            {
                throw ex;
            }
            finally
            {
                Session.Remove("IncidenteModificar");
                Response.Redirect("Incidentes.aspx");
            }
        }
        public void btnCancelarModificarInc(object sender, EventArgs e)
        {
            Response.Redirect("Incidentes.aspx");
        }
    }
}