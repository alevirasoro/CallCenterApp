using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Cliente : Persona
    {
        public string NroCliente { get; set; }
    
        public Cliente (string nrocliente)
        {
            NroCliente = nrocliente;    
        }
        public override string ToString()
        {
            return NroCliente;
        }
    }
}
