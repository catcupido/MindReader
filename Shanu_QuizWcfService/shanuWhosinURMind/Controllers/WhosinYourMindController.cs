using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace shanuWhosinURMind.Controllers
{
    public class WhosinYourMindController : Controller
    {
        // GET: WhosinYourMind
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult CharacterTypeView()
        {
            return View();
        }

        public ActionResult quizView()
        {
           
            return View();
        }
    }
}