using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;


namespace negocio
{
    public class ClienteNegocio
    {
        public void agregarCliente(Cliente nuevo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                string valores = "values('" + nuevo.Nombre + "', '" + nuevo.Apellido + "', '" + nuevo.Email + "','" + nuevo.Telefono + "','" + nuevo.DNI + "')";
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
        public void eliminar(int mail)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("Delete From PERSONAS Where Email = " + mail);
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
        public List<Cliente> listar()
        {
            List<Cliente> lista = new List<Cliente>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("select C.ID, C.Nombre Nombre, C.Apellido Apellido, C.Email Email, C.Telefono Telefono, C.DNI DNI from CLIENTES C");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Cliente aux = new Cliente('5');
                    aux.NroCliente = (int)datos.Lector["ID"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Apellido = (string)datos.Lector["Apellido"];
                    aux.DNI = (string)datos.Lector["DNI"];
                    aux.Email = (string)datos.Lector["Email"];
                    aux.Telefono = (string)datos.Lector["Telefono"];

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
        public void eliminarCliente(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("Delete From CLIENTES Where ID = " + id);
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
