﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
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
                //HAY QUE DEFINIR LA DB CON SUS TABLAS Y EMPEZAR A ARMARLA PARA HACER LA CONSULTA.
                //select A.Id, A.Codigo CodigoArticulo, A.Nombre , A.Descripcion Descripcion, A.ImagenUrl UrlImagen, M.Descripcion Marca, A.IdMarca, A.Precio, A.IdCategoria from ARTICULOS A, MARCAS M WHERE A.IdMarca = M.Id "
                datos.setearConsulta("select A.Numero, A.Empleado EmpleadoLegajo, A.Cliente, A.Fecha from INCIDENTES A");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Incidente aux = new Incidente();
                    aux.Numero = (long)datos.Lector["Numero"];
                    aux.Cliente = new Cliente((string)datos.Lector["Cliente"]);
                    aux.Fecha = (DateTime)datos.Lector["Fecha"];
                    //aux.Asunto = (string)datos.Lector["EmpleadoLegajo"].ToString(); asi funciona pero no es la idea
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
