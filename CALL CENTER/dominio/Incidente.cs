using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Incidente
    {
        public int Numero { get; set; }
        public Empleado EmpleadoLegajo { get; set; }
        public Cliente Cliente { get; set; }
        public Tipo Tipo { get; set; } 
        public Prioridad Prioridad { get; set; }
        public string Asunto { get; set; }
        public Estado Estado { get; set; }
        public string Email { get; set; }
        public string ComentarioCierre { get; set; }
        public DateTime Fecha { get; set; }

    }   
}
