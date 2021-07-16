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
        public List<Cliente> lista;
        public List<Cliente> listaclientes;
        protected void Page_Load(object sender, EventArgs e)
        {

            ClienteNegocio negocio = new ClienteNegocio();
            try
            {
                if (!IsPostBack)
                {
                    lista = negocio.listar();
                    Session.Add("listadoClientes", lista);
                    listaclientes = (List<Cliente>)Session["listadoClientes"];
                    repetidor.DataSource = listaclientes;
                    repetidor.DataBind();
                }
            }
            catch (Exception ex)
            {
                Session.Add("Exception", ex.ToString());

                Response.Redirect("Error.aspx");
            }
        }
        protected void guardarCliente(object sender, EventArgs e)
        {
            Page.Validate();
            if (!Page.IsValid)
            {
                return;
            }
            ClienteNegocio clienteNegocio = new ClienteNegocio();

            try
            {
                if (cli == null)
                {
                    cli = new Cliente(5);
                    cli.Nombre = clienteName.Text;
                    cli.Apellido = clienteApe.Text;
                    cli.Email = clienteMail.Text;
                    cli.Telefono = clienteTel.Text;
                    cli.DNI = clienteDni.Text;
                    clienteNegocio.agregarCliente(cli);

                    Response.Write("<script>alert('Agregado correctamente');</script>");
                }

            }

            catch (Exception ex)
            {
                Session.Add("Exception", ex.ToString());

                Response.Redirect("Error.aspx");
            }
            //TODOS ESTOS RESPONSE SE TIENEN QUE CAMBIAR POR UPDATE PANEL
            Response.Redirect("Clientes.aspx");
        }
        public void btnEliminarCliente_Click(object sender, EventArgs e)
        {
            try
            {
                ClienteNegocio cliente = new ClienteNegocio();
                var argument = ((Button)sender).CommandArgument;
                int id = int.Parse(argument);
                cliente.eliminarCliente(id);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            //TODOS ESTOS RESPONSE SE TIENEN QUE CAMBIAR POR UPDATE PANEL
            Response.Redirect("Clientes.aspx");

        }
        public void btnModificarCliente_Click(object sender, EventArgs e)
        {
            //el boton de modal tiene que abrirlo y completar todos los campos. entonces aca al mandar la info la tiene, sino queda vacia

            ClienteNegocio clienteNegocio = new ClienteNegocio();
            var argument = (String)Session["NroClienteModificar"];
            int id = int.Parse(argument);
            try
            {
                cli = new Cliente(id);
                cli.NroCliente = id;
                cli.Nombre = clienteName2.Text;
                cli.Apellido = clienteApe2.Text;
                cli.Email = clienteMail2.Text;
                cli.Telefono = clienteTel2.Text;
                cli.DNI = clienteDni2.Text;

                clienteNegocio.modificarCliente(cli);
            }
            catch (Exception ex)
            {
                Session.Add("Exception", ex.ToString());

                Response.Redirect("Error.aspx");
            }
            Response.Redirect("Clientes.aspx");

        }
        public void AgregarNroClienteSession(object sender, EventArgs e)
        {
            var argument = ((Button)sender).CommandArgument;
            Session.Add("NroClienteModificar", argument);
        }
    }
}