using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Incidente
    {
        public string Cliente { get; set; }
        public long EmpleadoLegajo { get; set; }
        public string Tipo { get; set; }
        public string Prioridad { get; set; }
        public string Asunto { get; set; }
        public string Estado { get; set; }
        public string Email { get; set; }
        public long ID { get; set; }
        public string ComentarioCierre { get; set; }
    }   
}
