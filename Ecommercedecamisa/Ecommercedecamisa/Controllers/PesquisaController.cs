using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace EcommerCamiseta.Controllers
{
    public class PesquisaController : Controller
    {
        // GET: Pesquisa
        public ActionResult RetProdutos()
        {
            return View();
        }
    }
}