using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;

namespace negocio
{
    public class EstadoNegocio
    {
        public List<Estado> listarEstados()
        {
            List<Estado> lista = new List<Estado>();
            Estado aux;
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("select E.ID ID, E.EstadoIncidente EstadoIncidente from ESTADOS E");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    aux = new Estado(datos.Lector["EstadoIncidente"].ToString());
                    aux.ID = (int)datos.Lector["ID"];

                    lista.Add(aux);
                }
                return lista;
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
    }
}
