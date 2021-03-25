using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace EcommerCamiseta.Controllers
{
    public class HomeController : Controller
    {
        [AllowAnonymous]
        public ActionResult Index()
        {
            return View();
        }
        [AllowAnonymous]
        public ActionResult Sobre()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }
        [AllowAnonymous]
        public ActionResult Contato()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}