using System;
using System.Collections.Generic;
using dominio;

namespace negocio
{
    public class IncidenteNegocio
    {
        public List<Incidente> listar()
        {
            List<Incidente> lista = new List<Incidente>();
            AccesoDatos datos = new AccesoDatos();
            try
            {

                datos.setearConsulta("select A.Numero Numero, A.Asunto Asunto, A.Comentario Comentario, A.Fecha Fecha, c.Nombre ClienteNom, c.Apellido ClienteApe, e.Nombre EmpleadoNom, e.Apellido EmpleadoApe, p.PrioridadIncidente Prioridad, t.TipoIncidente Tipo, es.EstadoIncidente Estado from INCIDENTES A inner join CLIENTES C on c.ID = a.IDCliente inner join EMPLEADOS e on e.ID = a.IDEmpleado inner join PRIORIDADES p on p.ID = a.IDPrioridad inner join TIPOS t on t.ID = a.IDTipo inner join ESTADOS es on es.ID = a.IDEstado");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Incidente aux = new Incidente();
                    aux.Fecha = (DateTime)datos.Lector["Fecha"];
                    aux.Numero = (int)datos.Lector["Numero"];
                    aux.Cliente = new Cliente((string)datos.Lector["ClienteApe"]);
                    aux.Asunto = (string)datos.Lector["Asunto"];
                    aux.Tipo = new Tipo((string)datos.Lector["Tipo"]);
                    aux.Prioridad = new Prioridad((string)datos.Lector["Prioridad"]);
                    aux.EmpleadoLegajo = new Empleado((string)datos.Lector["EmpleadoApe"].ToString()); //asi funciona pero no es la idea
                    aux.Estado = new Estado((string)datos.Lector["Estado"]);
                    aux.ComentarioCierre = (string)datos.Lector["Comentario"];

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
        public void agregar(Incidente aux)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                string valores = "values ('" + aux.Asunto + "', '" + aux.Fecha + "', '" + aux.idCliente + "','" + aux.idEmpleado + "', '" + aux.Prioridad.ID + "', '" + aux.Tipo.ID + "', '" + aux.Estado.ID + "',  '" + aux.ComentarioCierre + "')";
                datos.setearConsulta("INSERT into INCIDENTES (Asunto, Fecha, IDCliente, IDEmpleado, IDPrioridad, IDTipo, IDEstado, Comentario)" + valores);
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
        public void modificar(Incidente modificar)
        {

            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("update INCIDENTES set Asunto = @asunto, Comentario = @comentario, Fecha = @fecha, IDCliente = @idcliente, IDEmpleado = @idempleado, IDPrioridad = @idprioridad, IDTipo = @idtipo, IDEstado = @idestado  Where Numero ="+ modificar.Numero);
                datos.setearParametro("@asunto", modificar.Asunto);
                datos.setearParametro("@comentario", modificar.ComentarioCierre);
                datos.setearParametro("@fecha", modificar.Fecha);
                datos.setearParametro("@idcliente", modificar.idCliente);
                datos.setearParametro("@idempleado", modificar.idEmpleado);
                datos.setearParametro("@idprioridad", modificar.Prioridad.ID);
                datos.setearParametro("@idtipo", modificar.Tipo.ID);
                datos.setearParametro("@idestado", modificar.Estado.ID);

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
        public int traerIDEmpleado(string mailempleado)
        {
            return 1;
        }
        public Cliente traerDatosCliente(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                Cliente aux = new Cliente('5');
                datos.setearConsulta("select c.Email email, c.Nombre, c.Apellido  from CLIENTES C WHERE C.ID = " + id);
                datos.ejecutarLectura();
                if (datos.Lector.Read())
                {
                    aux.Email = (string)datos.Lector["email"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Apellido = (string)datos.Lector["Apellido"];
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
        public int traerIDIncidente(int idcliente, int idempleado, int idprioridad, int idtipo, string asunto)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                Incidente aux = new Incidente();
                datos.setearConsulta("select I.Numero from INCIDENTES I WHERE I.IDCliente = " + idcliente + " AND IDEmpleado = " + idempleado + " AND IDPrioridad = " + idprioridad + " AND IDTipo = " + idtipo + " AND Asunto = '" + asunto + "' ");
                datos.ejecutarLectura();
                if (datos.Lector.Read())
                {
                    aux.Numero = (int)datos.Lector["Numero"];

                }
                return aux.Numero;
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
        public Incidente buscarIncidente(int idIncidente)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                Incidente aux = new Incidente();
                datos.setearConsulta("select A.Numero Numero, A.Asunto Asunto, A.Comentario Comentario, A.Fecha Fecha, a.IDCliente IDCliente, a.IDEmpleado IDEmpleado, a.IDTipo IDTipo, a.IDPrioridad IDPrioridad, c.Nombre ClienteNom, c.Apellido ClienteApe, e.Nombre EmpleadoNom, e.Apellido EmpleadoApe, p.PrioridadIncidente Prioridad, t.TipoIncidente Tipo, es.EstadoIncidente Estado from INCIDENTES A inner join CLIENTES C on c.ID = a.IDCliente inner join EMPLEADOS e on e.ID = a.IDEmpleado inner join PRIORIDADES p on p.ID = a.IDPrioridad inner join TIPOS t on t.ID = a.IDTipo inner join ESTADOS es on es.ID = a.IDEstado WHERE a.Numero =" + idIncidente);
                datos.ejecutarLectura();
                if (datos.Lector.Read())
                {
                    aux.Numero = (int)datos.Lector["Numero"];
                    aux.idCliente = (int)datos.Lector["IDCliente"];
                    aux.Asunto = (string)datos.Lector["Asunto"];
                    aux.ComentarioCierre = (string)datos.Lector["Comentario"];
                    aux.Fecha = (DateTime)datos.Lector["Fecha"];
                    aux.Tipo = new Tipo((string)datos.Lector["Tipo"]);
                    aux.Tipo.ID = (int)datos.Lector["IDTipo"];
                    aux.Prioridad = new Prioridad((string)datos.Lector["Prioridad"]);
                    aux.Prioridad.ID = (int)datos.Lector["IDPrioridad"];
                    aux.idEmpleado = (int)datos.Lector["IDEmpleado"];
                    aux.Estado = new Estado((string)datos.Lector["Estado"]);
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
