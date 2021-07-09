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
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected Cliente cli = null;

        protected void guardarCliente(object sender, EventArgs e)
        {
            ClienteNegocio clienteNegocio = new ClienteNegocio();

            try
            {
                if (cli == null)
                    cli = new Cliente(5);
                cli.Nombre = clienteName.Text;
                cli.Apellido = clienteApe.Text;
                cli.Email = clienteMail.Text;
                cli.Telefono = clienteTel.Text;
                cli.DNI = clienteDni.Text;

                clienteNegocio.agregarCliente(cli);

                Response.Write("<script>alert('Agregado correctamente');</script>");
            }
            catch (Exception ex)
            {
                Session.Add("Exception", ex.ToString());

                Response.Redirect("Error.aspx");
            }
        }
        public List<Cliente> lista;
        protected void Page_Load(object sender, EventArgs e)
        {

            ClienteNegocio negocio = new ClienteNegocio();
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
        public void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                ClienteNegocio cliente = new ClienteNegocio();
                var argument = ((Button)sender).CommandArgument;
                int id = int.Parse(argument);
                cliente.eliminarCliente(3);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            //TODOS ESTOS RESPONSE SE TIENEN QUE CAMBIAR POR UPDATE PANEL
            Response.Redirect("Usuarios.aspx");

        }
    }
}