using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Ecommercedecamisa.Models
{
    public class LoginModel
    {
        [Required(ErrorMessage = "Informe seu email")]
        [EmailAddress]
        public string Email { get; set; }

        [DataType(DataType.Password)]
        [Required(ErrorMessage = "Informe a Senha")]
        public string Senha { get; set; }


        [Display(Name = "Lembrar Me")]
        public bool LembrarMe { get; set; }
    }
}