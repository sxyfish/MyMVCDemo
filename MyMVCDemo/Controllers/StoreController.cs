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
        private List<TransactionHead> header;
        public StoreController()
        {
            using (var db=new LINQExercisesEntities())
            {
                header = db.TransactionHead.Include("TransactionLine.Product")
                                         .Include("Customer")
                                         .Include("Staff")
                                         .Include("Store")
                                         .ToList();
            }
        }

        public ActionResult Index()
        {
            
            return View(header);
        }
        public ActionResult StoreList()
        {
            
            var stores=header.Select(x=>x.Store).Distinct();

            return View(stores);

        }
        public ActionResult TransactionDetail(int id=1)
        {
          
            return View(header);
        }
        public ActionResult CustomerList()
        {
            var customers = header.Select(x=>x.Customer);
            return View(customers);
        }
        public ActionResult Action()
        {
            return View();
        }
    }
}