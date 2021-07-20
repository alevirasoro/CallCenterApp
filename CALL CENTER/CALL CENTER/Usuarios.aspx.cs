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
    public partial class WebForm3 : System.Web.UI.Page
    {
        public Empleado emp = null;
        public List<Empleado> lista;
        public List<Empleado> listaempleados;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    EmpleadoNegocio empleado = new EmpleadoNegocio();
                    ddlPerfilUsuario.DataSource = empleado.listarPerfiles();
                    ddlPerfilUsuario.DataTextField = "TipoPerfil";
                    ddlPerfilUsuario.DataValueField = "ID";
                    ddlPerfilUsuario.DataBind();
                }
            }
            catch (Exception ex)
            {
                Session.Add("Exception", ex.ToString());

                Response.Redirect("Error.aspx");
            }
            
            EmpleadoNegocio negocio = new EmpleadoNegocio();
            try
            {
                if (!IsPostBack)
                {
                    lista = negocio.listar();
                    Session.Add("listadoEmpleados", lista);
                    listaempleados = (List<Empleado>)Session["listadoEmpleados"];
                    repetidor.DataSource = listaempleados;
                    repetidor.DataBind();
                }
            }
            catch (Exception ex)
            {
                Session.Add("Exception", ex.ToString());

                Response.Redirect("Error.aspx");
            }
        }
        public void guardarUsuario(object sender, EventArgs e)
        {
            EmpleadoNegocio negocio = new EmpleadoNegocio();
            try
            {
                if (emp == null)
                    emp = new Empleado("a");
                emp.Nombre = usuName.Text;
                emp.Apellido = usuApe.Text;
                emp.Email = usuMail.Text;
                emp.Telefono = usuTel.Text;
                emp.DNI = usuDni.Text;
                //emp.TipoUsusario = int.Parse(ddlPerfilUsuario.SelectedItem.Value);
                emp.Perfil = new Perfil(ddlPerfilUsuario.DataTextField);
                emp.Perfil.ID = int.Parse(ddlPerfilUsuario.SelectedItem.Value);
                emp.User = usuUser.Text;
                emp.Pass = usuPass.Text;

                EmpleadoNegocio.agregarUsuario(emp);

                Response.Write("<script>alert('Agregado correctamente');</script>");
                
            }
            catch (Exception ex)
            {
                Session.Add("Exception", ex.ToString());

                Response.Redirect("Error.aspx");
            }

            //TODOS ESTOS RESPONSE SE TIENEN QUE CAMBIAR POR UPDATE PANEL
            Response.Redirect("Usuarios.aspx");
        }
        public void btnEliminarUsuario_Click(object sender, EventArgs e)
        {
            try
            {
                EmpleadoNegocio empleado = new EmpleadoNegocio();
                string argument = ((Button)sender).CommandArgument;
                int id = int.Parse(argument);
                empleado.eliminarUsuario(id);
            }
            catch(Exception ex)
            {
                throw ex;
            }
            //TODOS ESTOS RESPONSE SE TIENEN QUE CAMBIAR POR UPDATE PANEL
            Response.Redirect("Usuarios.aspx");
        }
    }
}