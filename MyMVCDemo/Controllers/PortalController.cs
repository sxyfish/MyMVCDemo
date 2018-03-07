using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MyMVCDemo.Models;

namespace MyMVCDemo.Controllers
{
    public class PortalController : Controller
    {

        public ActionResult Index()
        {
            
            return View();
        }
        
        public ActionResult TransactionDetail(int id=1)
        {
            List<TransactionHead> header;
            using (var db = new LINQExercisesEntities())
            {
                header = db.TransactionHead.Include("TransactionLine.Product")
                                         .Include("Customer")
                                         .Include("Staff")
                                         .Include("Store")
                                         .ToList();
            }
            return View(header);
        }
        public ActionResult CustomerList()
        {
            List<Customer> Customers;
            using (var db = new LINQExercisesEntities())
            {
                Customers = db.Customer.ToList();
            }
            return View(Customers);
        }
        public ActionResult StaffList()
        {
            List<Staff> Staffs;
            using (var db = new LINQExercisesEntities())
            {
                Staffs = db.Staff.ToList();
            }
            return View(Staffs);
        }

    }
}