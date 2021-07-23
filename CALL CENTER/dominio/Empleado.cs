using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public enum TipoUsuario
    {
        ADMIN = 1,
        SUPERVISOR = 2,
        TELEFONISTA = 3
    }
    public class Empleado : Persona
    {
        public long ID { get; set; }
        public Perfil Perfil { get; set; }
        public string User { get; set; }
        public string Pass { get; set; }
        public TipoUsuario TipoUsusario { get; set; }

        // public Empresa Empresa { get; set; }
        public Empleado(string nombre)
        {
            Nombre = nombre;
        }
        public override string ToString()
        {
            return Nombre;
        }

    }
}
