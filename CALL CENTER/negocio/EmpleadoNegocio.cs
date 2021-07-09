using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;


namespace negocio
{
    public class EmpleadoNegocio
    {
        public List<Perfil> listarPerfiles()
        {
            List<Perfil> lista = new List<Perfil>();
            Perfil aux;
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("select P.ID Id, P.TipoPerfil TipoPerfil from PERFILES P");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    aux = new Perfil();
                    aux.ID = (int)datos.Lector["ID"];
                    aux.TipoPerfil = datos.Lector["TipoPerfil"].ToString();

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
        public static void agregarUsuario(Empleado nuevo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                string valores = "values('" + nuevo.Nombre + "', '" + nuevo.Apellido + "', '" + nuevo.Email + "','" + nuevo.Telefono + "','" + nuevo.DNI + "', '" + nuevo.Perfil.ID +"')";
                datos.setearConsulta("INSERT INTO CLIENTES (Nombre, Apellido, Email, Telefono, DNI)" + valores);
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

