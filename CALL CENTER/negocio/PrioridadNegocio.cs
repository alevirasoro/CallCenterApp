using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;

namespace negocio
{
    public class PrioridadNegocio
    {
        public void agregar(Prioridad nuevo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                string valores = "values(2,'" + nuevo.PrioridadIncidente + "')";
                datos.setearConsulta("INSERT INTO PRIORIDADES (ID, PrioridadIncidente)" + valores);
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
    }
}
