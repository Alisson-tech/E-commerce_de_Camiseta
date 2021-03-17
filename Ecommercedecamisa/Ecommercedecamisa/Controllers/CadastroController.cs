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
            var sucesso = CadDados.CadUser(user.CPF, user.Nome, user.Email, user.Senha);
            if (sucesso == true)
            {
                return Json(new {mensagem="Sucesso" } );
            }
            else {

                return Json(new { mensagem = "erro" });
            }
        }

    }
}