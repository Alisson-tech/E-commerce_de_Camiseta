using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace EcommerCamiseta.Controllers
{
    public class ContaController : Controller
    {
        // GET: Conta
        public ActionResult Perfil()
        {
            return View();
        }
        public ActionResult Login()
        {
            return View();
        }
    }
}