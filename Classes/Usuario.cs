using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ProyectoTwitter.Classes
{
    public class Usuario
    {
        [Key]
        [Display(Name = "ID")]
        public int idUsuario { set; get; }

        [Display(Name = "Nombre")]
        [Required(ErrorMessage = "El Nombre es requerido.")]
        public string nombre { set; get; }

        [Display(Name = "Apellido")]
        [Required(ErrorMessage = "El Apellido es requerido.")]
        public string apellido { set; get; }

        [Display(Name = "Usuario")]
        public string nombreUser { set; get; }

        [Display(Name = "Cumpleaños")]
        public DateTime nacimiento { set; get; }

        [Display(Name = "Correo")]
        public string correo { set; get; }

        [Display(Name = "Género")]
        public string genero { set; get; }

        [Display(Name = "Contraseña")]
        public string contraseña { set; get; }
    }
}
