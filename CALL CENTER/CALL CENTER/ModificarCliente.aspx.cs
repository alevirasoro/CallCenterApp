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
    public partial class _Default : Page
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
                    var argument = (String)Session["NroClienteModificar"];
                    int id = int.Parse(argument);
                    ClienteNegocio Clie = new ClienteNegocio();
                    Cliente client = new Cliente('5');
                    client = Clie.traerCliente(id);


                    txtNombre2.Text = client.Nombre;
                    txtApellido2.Text = client.Apellido;
                    txtDNI2.Text = client.DNI;
                    txtEmail2.Text = client.Email;
                    txtTelono2.Text = client.Telefono;


                }
            }
            catch (Exception ex)
            {
                Session.Add("Exception", ex.ToString());

                Response.Redirect("Error.aspx");
            }

        }

        public void btnGuardarCliente_Click(object sender, EventArgs e)
        {

            ClienteNegocio clienteNegocio = new ClienteNegocio();
            var argument = (String)Session["NroClienteModificar"];
            int id = int.Parse(argument);
            try
            {
                Cliente cli = new Cliente(id);
                cli.NroCliente = id;
                cli.Nombre = txtNombre2.Text;
                cli.Apellido = txtApellido2.Text;
                cli.Email = txtEmail2.Text;
                cli.Telefono = txtTelono2.Text;
                cli.DNI = txtDNI2.Text;
                
                clienteNegocio.modificarCliente(cli);
            }
            catch (Exception ex)
            {
                Session.Add("Exception", ex.ToString());

                Response.Redirect("Error.aspx");
            }
            Response.Redirect("Clientes.aspx");

        }

        public void btnCancelarModificar(object sender, EventArgs e)
        {
            Response.Redirect("Clientes.aspx");          
        }
    }
}
