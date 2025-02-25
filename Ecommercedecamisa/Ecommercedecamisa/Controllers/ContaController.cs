﻿using Ecommercedecamisa.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace EcommerCamiseta.Controllers
{
    public class ContaController : Controller
    {
        // GET: Conta
        public ActionResult Perfil()
        {
            return View();
        }
        [AllowAnonymous]
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        [AllowAnonymous]
        public ActionResult Login(LoginModel login)
        {
            if (!ModelState.IsValid)
            {
                return View(login);
            }

            var achou = LogDados.LogUser(login.Email, login.Senha);

            if (achou)
            {
                FormsAuthentication.SetAuthCookie(login.Email, login.LembrarMe);

                
                return RedirectToAction("Index", "Home");
            }
            else
            {
                ModelState.AddModelError("", "Login inválido.");
                return View(login);
            }
        }
        [HttpPost]
        [AllowAnonymous]
        public ActionResult LogOff()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Index", "Home");
        }
    }
}