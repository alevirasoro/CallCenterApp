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
                    aux = new Perfil("5");
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
                datos.setearConsulta("INSERT INTO EMPLEADOS (Nombre, Apellido, Email, Telefono, DNI, IDPerfil)" + valores);
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
        public List<Empleado> listar()
        {
            List<Empleado> lista = new List<Empleado>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("select E.ID, E.Nombre Nombre, E.Apellido Apellido, E.Email Email, E.Telefono Telefono, E.DNI DNI, E.IDPerfil IDPerfil, P.TipoPerfil Perfil from EMPLEADOS E inner join PERFILES P on P.ID = E.IDPerfil");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Empleado aux = new Empleado();
                    aux.ID = (int)datos.Lector["ID"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Apellido = (string)datos.Lector["Apellido"];
                    aux.DNI = (string)datos.Lector["DNI"];
                    aux.Email = (string)datos.Lector["Email"];
                    aux.Telefono = (string)datos.Lector["Telefono"];
                    aux.Perfil = new Perfil((string)datos.Lector["Perfil"]);

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
        public void eliminarUsuario(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("Delete From EMPLEADOS Where ID = " + id);
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
    }
}

