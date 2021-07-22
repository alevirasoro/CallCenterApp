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
                datos.setearConsulta("select A.ID Id, A.TipoIncidente TipoIncidente from TIPOS A");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    aux = new Tipo(datos.Lector["TipoIncidente"].ToString());
                    aux.ID = (int)datos.Lector["ID"];
                    //aux.TipoIncidente = datos.Lector["TipoIncidente"].ToString();

                    lista.Add(aux);
                }
                return lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void eliminar(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("Delete From TIPOS Where ID = " + id);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
                datos = null;
            }
        }

        public void modificarTipo(Tipo modificar)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("update TIPOS set TipoIncidente = @tipo Where ID = @id");
                datos.setearParametro("@tipo", modificar.TipoIncidente);
                datos.setearParametro("@id", modificar.ID);
              
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
        public Tipo traerTipo(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                Tipo aux = new Tipo("5");
                datos.setearConsulta("select T.TipoIncidente from TIPOS T WHERE T.ID = " + id);
                datos.ejecutarLectura();
                if (datos.Lector.Read())
                {
                    aux.TipoIncidente = (string)datos.Lector["TipoIncidente"];              
                }
                return aux;
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