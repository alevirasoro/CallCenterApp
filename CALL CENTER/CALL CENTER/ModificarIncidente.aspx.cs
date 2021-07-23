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
                    var argument = (String)Session["IncidenteModificar"];
                    int id = int.Parse(argument);

                    EmpleadoNegocio empleado = new EmpleadoNegocio();
                    TipoNegocio tipo = new TipoNegocio();
                    PrioridadNegocio prioridad = new PrioridadNegocio();
                    IncidenteNegocio inegocio = new IncidenteNegocio();
                    Incidente incidente = new Incidente();
                    incidente = inegocio.buscarIncidente(id);

                    ddlPrioridades.DataSource = prioridad.listarPrioridades();
                    ddlPrioridades.DataTextField = "PrioridadIncidente";
                    ddlPrioridades.DataValueField = "ID";
                    ddlPrioridades.DataBind();

                    ddlTipos.DataSource = tipo.listarTipos();
                    ddlTipos.DataTextField = "TipoIncidente";
                    ddlTipos.DataValueField = "ID";
                    ddlTipos.DataBind();

                    ddlEmpleados.DataSource = empleado.listar();
                    ddlEmpleados.DataTextField = "Email";
                    ddlEmpleados.DataValueField = "ID";
                    ddlEmpleados.DataBind();

                    txtNumero.Text = incidente.Numero.ToString();
                    txtAsunto.Text = incidente.Asunto;
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
                incidente.Estado.ID = 5;
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

        public void btnGuardarIncRes(object sender, EventArgs e)
        {
            try {
                var argument = (String)Session["IncidenteModificar"];
                int id = int.Parse(argument);
                IncidenteNegocio negocio = new IncidenteNegocio();
                Incidente incidente = new Incidente();
                incidente = negocio.buscarIncidente(id);
                incidente.Estado.ID = 6;
                incidente.ComentarioCierre = txtComentarios.Text;
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

        public void btnGuardarIncCerrado(object sender, EventArgs e)
        {
            try
            {
                var argument = (String)Session["IncidenteModificar"];
                int id = int.Parse(argument);
                IncidenteNegocio negocio = new IncidenteNegocio();
                Incidente incidente = new Incidente();
                incidente = negocio.buscarIncidente(id);
                incidente.Estado.ID = 3;
                incidente.ComentarioCierre = txtComentarioCierre.Text;
                negocio.modificar(incidente);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                Session.Remove("IncidenteModificar");
                Response.Redirect("Incidentes.aspx");
            }
        }
        public void btnGuardarIncResClick(object sender, EventArgs e)
        {
            try { 
            var argument = (String)Session["IncidenteModificar"];
            int id = int.Parse(argument);
            IncidenteNegocio negocio = new IncidenteNegocio();
            Incidente incidente = new Incidente();
            incidente = negocio.buscarIncidente(id);
            incidente.Estado.ID = 2;
            incidente.Asunto = txtAsunto.Text;
            incidente.Tipo.ID = int.Parse(ddlTipos.SelectedItem.Value);
            incidente.Prioridad.ID = int.Parse(ddlPrioridades.SelectedItem.Value);
            negocio.modificar(incidente);
            }
            catch (Exception ex)
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