using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Prioridad
    {
        public int ID { get; set; }
        public string PrioridadIncidente { get; set; }
        public Prioridad (string prio)
        {
            PrioridadIncidente = prio;
        }
        public override string ToString()
        {
            return PrioridadIncidente;
        }
    }

}
