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
            if (Session["usuario"] == null)
            {
                Session.Add("error", "No estas Logueado");
                Response.Redirect("Login.aspx");
            }

            TipoNegocio tipoNegocio = new TipoNegocio();
            PrioridadNegocio prioridad = new PrioridadNegocio();
            try
            {
                if(!IsPostBack)
                {
                    ddlTipos.DataSource = tipoNegocio.listarTipos();
                    ddlTipos.DataTextField = "TipoIncidente";
                    ddlTipos.DataValueField = "ID";
                    ddlTipos.DataBind();
                    ddlPrioridades.DataSource = prioridad.listarPrioridades();
                    ddlPrioridades.DataTextField = "PrioridadIncidente";
                    ddlPrioridades.DataValueField = "ID";
                    ddlPrioridades.DataBind();
                }
            }
            catch(Exception ex)
            {
                Session.Add("Exception", ex.ToString());

                Response.Redirect("Error.aspx");

            }
        }
        //FUNCIONES DE GUARDADO
        protected void guardarTipo(object sender, EventArgs e)
        {
            TipoNegocio tipo = new TipoNegocio();

            try
            {
                if (tip == null)
                    tip = new Tipo(nombreTipo.Text);


                tipo.agregar(tip);

                Response.Write("<script>alert('Agregado correctamente');</script>");
               
            }
            catch (Exception ex)
            {
                Session.Add("Exception", ex.ToString());

                Response.Redirect("Error.aspx");
            }
            //TODOS ESTOS RESPONSE SE TIENEN QUE CAMBIAR POR UPDATE PANEL
            Response.Redirect("Configuraciones.aspx");
        }
        protected void guardarPrioridad(object sender, EventArgs e)
        {
            PrioridadNegocio prioridad = new PrioridadNegocio();

            try
            {
                if (pri == null)
                    pri = new Prioridad(nombrePrioridad.Text);

                prioridad.agregar(pri);

                Response.Write("<script>alert('Agregado correctamente');</script>");
          
            }
            catch (Exception ex)
            {
                Session.Add("Exception", ex.ToString());

                Response.Redirect("Error.aspx");
            }
            //TODOS ESTOS RESPONSE SE TIENEN QUE CAMBIAR POR UPDATE PANEL
            Response.Redirect("Configuraciones.aspx");
        }

        //FUNCION ELIMINAR PRIORIDAD
        public void btnEliminar2_Click(object sender, EventArgs e)
        {
            int id = int.Parse(ddlPrioridades.SelectedItem.Value);
            PrioridadNegocio prioridad = new PrioridadNegocio();
            try
            {
                prioridad.eliminar(id);
                Response.Redirect("Configuraciones.aspx");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void btnEliminar1_Click(object sender, EventArgs e)
        {
            int id = int.Parse(ddlTipos.SelectedItem.Value);
            TipoNegocio tipo = new TipoNegocio();
            try
            {
                tipo.eliminar(id);
                Response.Redirect("Configuraciones.aspx");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}