using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Perfil
    {
        public int ID { get; set; }
        public string TipoPerfil { get; set; }

        public Perfil(string tipoperfil) //sirve de constructor para el lector
        {
            TipoPerfil = tipoperfil;

        }
        public override string ToString()
        {
            return TipoPerfil;
        }

    }
}
