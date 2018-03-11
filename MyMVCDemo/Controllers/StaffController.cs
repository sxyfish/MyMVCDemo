using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MyMVCDemo.Models;


namespace MyMVCDemo.Controllers
{
    public class StaffController : Controller
    {
        // GET: Staff
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult StaffList()
        {
            List<Staff> staffs;
            using (var db=new LINQExercisesEntities())
            {
                staffs = db.Staff.ToList();
            }
            return View(staffs);
        }
        public ActionResult NewStaff()
        {
            return View();
        }
        public ActionResult CreateStaff(Staff s)
        {
            using (var db=new LINQExercisesEntities())
            {
                db.Staff.Add(s);
                db.SaveChanges();

            }
            return RedirectToAction("StaffList");
        }
    }
}