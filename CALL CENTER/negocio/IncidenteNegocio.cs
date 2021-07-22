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
                    //aux.ComentarioCierre = (string)datos.Lector["Comentario"];

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
                string valores = "values ('"+ aux.Asunto +"', '"+ aux.Fecha +"', '"+ aux.idCliente +"', 2, '"+ aux.Prioridad.ID +"', '"+ aux.Tipo.ID +"', '"+ aux.Estado.ID +"')";
                datos.setearConsulta("INSERT into INCIDENTES (Asunto, Fecha, IDCliente, IDEmpleado, IDPrioridad, IDTipo, IDEstado)" + valores);
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
        public string traerMailCliente(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                Cliente aux = new Cliente('5');
                datos.setearConsulta("select c.Email email  from CLIENTES C WHERE C.ID = " + id);
                datos.ejecutarLectura();
                if (datos.Lector.Read())
                {
                    aux.Email = (string)datos.Lector["email"];
                }
                return aux.Email;
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
