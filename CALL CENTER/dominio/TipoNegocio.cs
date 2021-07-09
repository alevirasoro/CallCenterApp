using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;

namespace negocio
{
    public class TipoNegocio
    {
        public void agregar(Tipo nuevo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                string valores = "values('" + nuevo.TipoIncidente + "')";
                datos.setearConsulta("INSERT INTO TIPOS (TipoIncidente)" + valores);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {

                throw ex;
            }

            finally
            {
                datos.cerrarConexion();
            }
        }
        public List<Tipo> listarTipos()
        {
            List<Tipo> lista = new List<Tipo>();
            Tipo aux;
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("select A.ID ID, A.TipoIncidente Tipo from TIPOS A");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    aux = new Tipo();
                    aux.ID = (int)datos.Lector["ID"];
                    aux.TipoIncidente = (string)datos.Lector["TipoIncidente"];
                    lista.Add(aux);
                }

                return lista;
            }
            catch (Exception ex)
            {
                Session.Add("Exception", ex.ToString());

                Response.Redirect("Error.aspx");
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
                datos = null;
            }
        }
    }
}
