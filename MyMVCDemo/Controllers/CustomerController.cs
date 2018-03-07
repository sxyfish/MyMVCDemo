using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MyMVCDemo.Models;


namespace MyMVCDemo.Controllers
{
    public class CustomerController : Controller
    {
        // GET: Customer
        public ActionResult Index()
        {
            return View();
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
        public ActionResult NewCustomer()
        {
           
            return View();
        }

        [HttpPost]
        public ActionResult CreateCustomer(Customer c)
        {
            /*
            var new_cus = new Customer
            {
                Name = c.Name,
                Address = c.Address,
                Phone = c.Phone,
                TransactionHead = c.TransactionHead

            };
            */
            using (var db = new LINQExercisesEntities())
            {
                db.Customer.Add(c);
                db.SaveChanges();
            }
            
            return RedirectToAction("CustomerList");
        }
    }
}