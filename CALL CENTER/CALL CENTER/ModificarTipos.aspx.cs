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
    public partial class ModificarTipos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    var argument = (String)Session["TiposModificar"];
                    int id = int.Parse(argument);
                    TipoNegocio tipoNegocio = new TipoNegocio();
                    Tipo tip = new Tipo("5");
                    tip = tipoNegocio.traerTipo(id);

                    txtTipo2.Text = tip.TipoIncidente;                               
                }
            }
            catch (Exception ex)
            {
                Session.Add("Exception", ex.ToString());

                Response.Redirect("Error.aspx");
            }
        }
        public void btnGuardarModificarTipo_Click(object sender, EventArgs e)
        {

            TipoNegocio tipoNegocio = new TipoNegocio();
            var argument = (String)Session["TiposModificar"];
            int id = int.Parse(argument);
            try
            {
                Tipo tip = new Tipo("id");
                tip.ID = id;
                tip.TipoIncidente = txtTipo2.Text;
          

                tipoNegocio.modificarTipo(tip);
            }
            catch (Exception ex)
            {
                Session.Add("Exception", ex.ToString());

                Response.Redirect("Error.aspx");
            }
            Response.Redirect("Configuraciones.aspx");
        }

        public void btnCancelarModificarTipo(object sender, EventArgs e)
        {
            Response.Redirect("Configuraciones.aspx");
        }
    }
}