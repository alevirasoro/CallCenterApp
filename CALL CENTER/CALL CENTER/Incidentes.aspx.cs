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
        protected void Page_Load(object sender, EventArgs e)
        {
      
            IncidenteNegocio negocio = new IncidenteNegocio();

            try {
                lista = negocio.listar();
                if (!IsPostBack)
                {
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

                    ddlEstado.DataSource = estado.listarEstados();
                    ddlEstado.DataTextField = "EstadoIncidente";
                    ddlEstado.DataValueField = "ID";
                    ddlEstado.DataBind();
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

            incidente.Asunto = asunto.Text;
            incidente.Tipo = new Tipo(ddlTipo.DataTextField);
            incidente.Tipo.ID = int.Parse(ddlTipo.SelectedItem.Value);
            incidente.Prioridad = new Prioridad(ddlPrioridad.DataTextField);
            incidente.Prioridad.ID = int.Parse(ddlPrioridad.SelectedItem.Value);
            incidente.Estado = new Estado(ddlEstado.DataTextField);
            incidente.Estado.ID = int.Parse(ddlEstado.SelectedItem.Value);
            incidente.Fecha = DateTime.Today;
            incidente.Email = ddlUsuarios.DataTextField;


            negocio.agregar(incidente);


            //EmpleadoNegocio negocio = new EmpleadoNegocio();
            //try
            //{
            //    if (emp == null)
            //        emp = new Empleado();
            //    emp.Nombre = usuName.Text;
            //    emp.Apellido = usuApe.Text;
            //    emp.Email = usuMail.Text;
            //    emp.Telefono = usuTel.Text;
            //    emp.DNI = usuDni.Text;
            //    emp.Perfil = new Perfil(ddlPerfilUsuario.DataTextField);
            //    emp.Perfil.ID = int.Parse(ddlPerfilUsuario.SelectedItem.Value);

            //    EmpleadoNegocio.agregarUsuario(emp);

            //    Response.Write("<script>alert('Agregado correctamente');</script>");

            //}
            //catch (Exception ex)
            //{
            //    Session.Add("Exception", ex.ToString());

            //    Response.Redirect("Error.aspx");
            //}

            ////TODOS ESTOS RESPONSE SE TIENEN QUE CAMBIAR POR UPDATE PANEL
            //Response.Redirect("Usuarios.aspx");
        }
    }
}