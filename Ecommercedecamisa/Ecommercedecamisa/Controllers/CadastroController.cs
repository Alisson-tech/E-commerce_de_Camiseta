using Ecommercedecamisa.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace EcommerCamiseta.Controllers
{
    public class CadastroController : Controller
    {
        // GET: Cadastro
        public ActionResult Produto()
        {
            return View();
        }
        public ActionResult Usuario()
        {
            return View();
        }
        [HttpPost]
        public ActionResult CadUsuario(UsuarioModel user)
        {
            if (ModelState.IsValid)
            {
                var Cadastro = CadDados.CadUser(user.CPF, user.Nome, user.Email, user.Senha);            
                return Json(new { success = true });                              
            }
            else
            {
                return Json(new { success = false });
            }
        }

    }
}