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
    public partial class Incidentes : System.Web.UI.Page
    {
        public List<Incidente>lista;
        public List<Incidente> listaincidentes;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["usuario"] == null)
            {
                Session.Add("error", "No estas Logueado");
                Response.Redirect("Login.aspx");
            }
      
            IncidenteNegocio negocio = new IncidenteNegocio();

            try {
                if (!IsPostBack)
                {
                    lista = negocio.listar();
                    Session.Add("listaIncidentes", lista);
                    listaincidentes = (List<Incidente>)Session["listaIncidentes"];
                    repetidor.DataSource = listaincidentes;
                    repetidor.DataBind();

                    PrioridadNegocio prioridad = new PrioridadNegocio();
                    TipoNegocio tipo = new TipoNegocio();
                    EmpleadoNegocio empleado = new EmpleadoNegocio();
                    EstadoNegocio estado = new EstadoNegocio();

                    ddlPrioridad.DataSource = prioridad.listarPrioridades();
                    ddlPrioridad.DataTextField = "PrioridadIncidente";
                    ddlPrioridad.DataValueField = "ID";
                    ddlPrioridad.DataBind();

                    ddlTipo.DataSource = tipo.listarTipos();
                    ddlTipo.DataTextField = "TipoIncidente";
                    ddlTipo.DataValueField = "ID";
                    ddlTipo.DataBind();

                    ddlUsuarios.DataSource = empleado.listar();
                    ddlUsuarios.DataTextField = "Email";
                    ddlUsuarios.DataValueField = "ID";
                    ddlUsuarios.DataBind();

                }
            }
            catch (Exception ex)
            {
                Session.Add("Exception", ex.ToString());

                Response.Redirect("Error.aspx");
            }
            
        }
        public void guardarIncidente(object sender, EventArgs e)
        {
            IncidenteNegocio negocio = new IncidenteNegocio();
            Incidente incidente = new Incidente();
            try{
                incidente.idCliente = int.Parse(idCliente.Text);
                incidente.Asunto = asunto.Text;
                incidente.Tipo = new Tipo(ddlTipo.DataTextField);
                incidente.Tipo.ID = int.Parse(ddlTipo.SelectedItem.Value);
                incidente.Prioridad = new Prioridad(ddlPrioridad.DataTextField);
                incidente.Prioridad.ID = int.Parse(ddlPrioridad.SelectedItem.Value);
                incidente.Estado = new Estado("Abierto");
                incidente.Estado.ID = 1;
                incidente.Fecha = DateTime.Today;
                incidente.idEmpleado = int.Parse(ddlUsuarios.SelectedItem.Value);
                string vacio = "sin comentario";
                incidente.ComentarioCierre = (string) vacio;

                negocio.agregar(incidente);

                btnEnviar_MailIncidenteNuevo(incidente.idEmpleado, incidente.Prioridad.ID, incidente.Tipo.ID);
            }
            catch (Exception ex)
            {
                Session.Add("Exception", ex.ToString());

                Response.Redirect("Error.aspx");
            }
            Response.Redirect("Incidentes.aspx");
        }
        public void btnEnviar_MailIncidenteNuevo(int idempleado, int idprioridad, int idtipo)
        {

            IncidenteNegocio Clie = new IncidenteNegocio();
            Cliente client = new Cliente('5');
            int idcliente = int.Parse(idCliente.Text);
            client = Clie.traerDatosCliente(idcliente);
      
            string Asunto = asunto.Text;
         
            int idincidente = Clie.traerIDIncidente(idcliente, idempleado, idprioridad, idtipo, Asunto);
            EmailService emailService = new EmailService();
            emailService.armarCorreoNuevoIncidente(client.Email, client.Apellido, client.Nombre, idcliente, Asunto, idincidente);




            try
            {
                emailService.enviarEmail();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
            }
        }
        public void reasignarUsuario(object sender, EventArgs e)
        {
            
            var argument = ((Button)sender).CommandArgument;
            var accion = "reasignar";
            Session.Add("IncidenteModificar", argument);
            Session.Add("AccionIncidente", accion);
            Response.Redirect("ModificarIncidente.aspx");
        }
        public void editarIncidente(object sender, EventArgs e)
        {
            var argument = ((Button)sender).CommandArgument;
            var accion = "editar";
            Session.Add("IncidenteModificar", argument);
            Session.Add("AccionIncidente", accion);
            Response.Redirect("ModificarIncidente.aspx");
        }
        public void resolverIncidente(object sender, EventArgs e)
        {
            var argument = ((Button)sender).CommandArgument;
            var accion = "resolver";
            Session.Add("IncidenteModificar", argument);
            Session.Add("AccionIncidente", accion);
            Response.Redirect("ModificarIncidente.aspx");
        }
        public void cerrarIncidente(object sender, EventArgs e)
        {
            var argument = ((Button)sender).CommandArgument;
            var accion = "cerrar";
            Session.Add("IncidenteModificar", argument);
            Session.Add("AccionIncidente", accion);
            Response.Redirect("ModificarIncidente.aspx");
        }
    }
}