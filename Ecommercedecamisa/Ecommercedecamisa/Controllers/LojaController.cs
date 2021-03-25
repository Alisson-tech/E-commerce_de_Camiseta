using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace EcommerCamiseta.Controllers
{
    public class LojaController : Controller
    {
        // GET: Loja
        [AllowAnonymous]
        public ActionResult Lojas()
        {
            return View();
        }
    }
}