using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace EcommerCamiseta.Controllers
{
    public class CompraController : Controller
    {
        // GET: Compra
        public ActionResult Carrinho()
        {
            return View();
        }
        public ActionResult Pagamento()
        {
            return View();
        }
    }
}