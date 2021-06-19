using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using dominio;

namespace negocio
{
    class IncidenteNegocio
    {
        public List<Incidente> listar()
        {
            List<Incidente> lista = new List<Incidente>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                //HAY QUE DEFINIR LA DB CON SUS TABLAS Y EMPEZAR A ARMARLA PARA HACER LA CONSULTA.

                //datos.setearConsulta
                //datos.ejecutarLectura

                while (datos.Lector.Read())
                {
                    Incidente aux = new Incidente();

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
