using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Estado
    {
        public int ID { get; set; }
        public string EstadoIncidente { get; set; }
        public Estado(string est) {

            EstadoIncidente = est;

        }
        public override string ToString()
        {
            return EstadoIncidente;
        }
    }
}
