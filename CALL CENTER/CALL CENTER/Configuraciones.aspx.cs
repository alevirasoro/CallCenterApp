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
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected Tipo tip = null;
        protected Prioridad pri = null;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void guardarTipo(object sender, EventArgs e)
        {
            TipoNegocio tipo = new TipoNegocio();

            try
            {
                if (tip == null)
                    tip = new Tipo();

                tip.TipoIncidente = nombreTipo.Text;
                tipo.agregar(tip);

                Response.Write("<script>alert('Agregado correctamente');</script>");
            }
            catch (Exception ex)
            {
                Session.Add("Exception", ex.ToString());

                Response.Redirect("Error.aspx");
            }
        }
        protected void guardarPrioridad(object sender, EventArgs e)
        {
            PrioridadNegocio prioridad = new PrioridadNegocio();

            try
            {
                if (pri == null)
                    pri = new Prioridad();

                pri.PrioridadIncidente = nombrePrioridad.Text;
                prioridad.agregar(pri);

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