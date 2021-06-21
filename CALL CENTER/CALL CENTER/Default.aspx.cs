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
            public List<Incidente> lista;
        protected void Page_Load(object sender, EventArgs e)
        {
            IncidenteNegocio negocio = new IncidenteNegocio();

            lista = negocio.listar();
            Session.Add("listadoProductos", lista);
        }
    }
}
