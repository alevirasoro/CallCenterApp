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
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                EmpleadoNegocio empleado = new EmpleadoNegocio();
                ddlPerfilUsuario.DataSource = empleado.listarPerfiles();
                ddlPerfilUsuario.DataTextField = "TipoPerfil";
                ddlPerfilUsuario.DataValueField = "ID";
                ddlPerfilUsuario.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("Exception", ex.ToString());

                Response.Redirect("Error.aspx");

            }
            EmpleadoNegocio negocio = new EmpleadoNegocio();
            try
            {
                lista = negocio.listar();
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
                    emp = new Empleado();
                emp.Nombre = usuName.Text;
                emp.Apellido = usuApe.Text;
                emp.Email = usuMail.Text;
                emp.Telefono = usuTel.Text;
                emp.DNI = usuDni.Text;
                emp.Perfil = new Perfil(ddlPerfilUsuario.DataTextField);
                emp.Perfil.ID = int.Parse(ddlPerfilUsuario.SelectedItem.Value);

                EmpleadoNegocio.agregarUsuario(emp);

                Response.Write("<script>alert('Agregado correctamente');</script>");
                Response.Redirect("Usuarios.aspx")
            }
            catch (Exception ex)
            {
                Session.Add("Exception", ex.ToString());

                Response.Redirect("Error.aspx");
            }
        }       
    }
}