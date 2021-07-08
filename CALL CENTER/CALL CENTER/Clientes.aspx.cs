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
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void guardarCliente(object sender, EventArgs e)
        {
            ClienteNegocio clienteNegocio = new ClienteNegocio();

            try
            {
                if (cli == null)
                    cli = new Cliente("55");
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

    }
}