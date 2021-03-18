using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Ecommercedecamisa.Models
{
    public class UsuarioModel
    {
        [Required(ErrorMessage = "Informe o CPF", AllowEmptyStrings = false)]
        public string CPF { get; set; }

        [Required(ErrorMessage = "Informe o Nome", AllowEmptyStrings = false)]
        public string Nome { get; set; }
        [Required(ErrorMessage = "Informe o Email", AllowEmptyStrings = false)]
        public string Email { get; set; }
        [Required(ErrorMessage = "Informe a Senha", AllowEmptyStrings = false)]
        [DataType(DataType.Password)]
        public string Senha { get; set; }
        public string IdLoja { get; set; }

    }
}