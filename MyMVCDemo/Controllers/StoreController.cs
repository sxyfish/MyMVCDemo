using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MyMVCDemo.Models;


namespace MyMVCDemo.Controllers
{
    public class StoreController : Controller
    {
        // GET: Store
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult StoreList()
        {

            List<Store> stores;
            using (var db = new LINQExercisesEntities())
            {
                stores = db.Store.ToList();
            }
            return View(stores);

        }
        public ActionResult NewStore()
        {
            
            return View();
        }

        [HttpPost]
        public ActionResult CreateStore(Store store)
        {
            using (var db=new LINQExercisesEntities())
            {
                db.Store.Add(store);
                db.SaveChanges();
            }

            return RedirectToAction("StoreList");
        }
    }
}