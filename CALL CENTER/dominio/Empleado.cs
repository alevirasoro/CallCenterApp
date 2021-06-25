using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Empleado : Persona
    {
        public int ID { get; set; }
        public Perfil Perfil { get; set; }
        public Empresa Empresa { get; set; }
    }
}
