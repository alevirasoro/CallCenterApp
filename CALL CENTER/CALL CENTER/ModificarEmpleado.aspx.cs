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
    public partial class ModificarEmpleado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    var argument = (String)Session["NroEmpleadoModificar"];
                    int id = int.Parse(argument);
                    EmpleadoNegocio Emplead = new EmpleadoNegocio();
                    Empleado emple = new Empleado("5");
                    emple = Emplead.traerEmpleado(id);


                    txtNombre2.Text = emple.Nombre;
                    txtApellido2.Text = emple.Apellido;
                    txtDNI2.Text = emple.DNI;
                    txtEmail2.Text = emple.Email;
                    txtTelono2.Text = emple.Telefono;
                    txtIdperfil2.Text = emple.Perfil.TipoPerfil;


                }
            }
            catch (Exception ex)
            {
                Session.Add("Exception", ex.ToString());

                Response.Redirect("Error.aspx");
            }

        }

        public void btnGuardarModificarEmpleado_Click(object sender, EventArgs e)
        {

            EmpleadoNegocio empleadoNegocio = new EmpleadoNegocio();
            var argument = (String)Session["NroEmpleadoModificar"];
            int id = int.Parse(argument);
            try
            {
                Empleado emp = new Empleado("id");
                emp.ID = id;
                emp.Nombre = txtNombre2.Text;
                emp.Apellido = txtApellido2.Text;
                emp.Email = txtEmail2.Text;
                emp.Telefono = txtTelono2.Text;
                emp.DNI = txtDNI2.Text;
                //emp.Perfil.ID = txtIdperfil2.Text;

                empleadoNegocio.modificarEmpleado(emp);
            }
            catch (Exception ex)
            {
                Session.Add("Exception", ex.ToString());

                Response.Redirect("Error.aspx");
            }
            Response.Redirect("Usuarios.aspx");

        }

        public void btnCancelarModificarEmpleado(object sender, EventArgs e)
        {
            Response.Redirect("Usuarios.aspx");
        }
    }
}