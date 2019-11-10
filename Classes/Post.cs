using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProyectoTwitter.Classes
{
    public class Post
    {
        public int idPost { get; set; }
        public int idUsuario { get; set; }
        public String mensaje { get; set; }
        public int likes { get; set; }
        public List<String> comentarios { get; set; }
    }
}
