﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Models;
//
using PagedList;
using PagedList.Mvc;
using CrystalDecisions.CrystalReports.Engine;
using System.IO;

namespace WebApplication1.Controllers
{

    public class DailyLogTbsController : Controller
    {
        static string fa ;
        string fg = "";
        

        private ITDBEntities db = new ITDBEntities();
        
        // GET: DailyLogTbs
        public ActionResult Index(int Page=1)
        {
            var dailyLogTbs = db.DailyLogTbs.Include(d => d.DayofWeak);
            return View(db.DailyLogTbs.ToList().OrderByDescending(a => a.Id).ToPagedList(Page, 10));
        }

        // GET: DailyLogTbs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DailyLogTb dailyLogTb = db.DailyLogTbs.Find(id);
            if (dailyLogTb == null)
            {
                return HttpNotFound();
            }
            return View(dailyLogTb);
        }

        // GET: DailyLogTbs/Create
        public ActionResult Create()
        {
            ViewBag.Dayofweekid = new SelectList(db.DayofWeaks, "ID", "Day");
            return View();
        }

        // POST: DailyLogTbs/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Day,DateOfDay,Satement,Dayofweekid")] DailyLogTb dailyLogTb)
        {
            if (ModelState.IsValid)
            {
                db.DailyLogTbs.Add(dailyLogTb);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Dayofweekid = new SelectList(db.DayofWeaks, "ID", "Day", dailyLogTb.Dayofweekid);
            return View(dailyLogTb);
        }

        // GET: DailyLogTbs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DailyLogTb dailyLogTb = db.DailyLogTbs.Find(id);
            if (dailyLogTb == null)
            {
                return HttpNotFound();
            }
            ViewBag.Dayofweekid = new SelectList(db.DayofWeaks, "ID", "Day", dailyLogTb.Dayofweekid);
            return View(dailyLogTb);
        }

        // POST: DailyLogTbs/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Day,DateOfDay,Satement,Dayofweekid")] DailyLogTb dailyLogTb)
        {
            if (ModelState.IsValid)
            {
                db.Entry(dailyLogTb).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Dayofweekid = new SelectList(db.DayofWeaks, "ID", "Day", dailyLogTb.Dayofweekid);
            return View(dailyLogTb);
        }

        // GET: DailyLogTbs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DailyLogTb dailyLogTb = db.DailyLogTbs.Find(id);
            if (dailyLogTb == null)
            {
                return HttpNotFound();
            }
            return View(dailyLogTb);
        }

        // POST: DailyLogTbs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            DailyLogTb dailyLogTb = db.DailyLogTbs.Find(id);
            db.DailyLogTbs.Remove(dailyLogTb);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
        //public ActionResult fullsearch(string search)
        //{

        //    //return View("fullsearch", db.DailyLogTbs.Where(a => a.Day.Contains(search)));
        //}

        public ActionResult fullsearch1(string search1)
        {

          string x= search1;
            //string y = "";
            //y += x;
            fa = "";
            fa += x;

            return View("fullsearch1", db.DailyLogTbs.Where(a => a.DateOfDay.ToString().Contains(search1)));
        }
        
        


        #region Export
        public ActionResult Export()
        {
            
            #region list
            var result = (from p in db.DailyLogTbs
                          where p.DateOfDay.ToString() == fa
                          select new
                          {

                              p.DateOfDay,
                              p.Satement,
                              p.DayofWeak.Day
                              
                          }
                         
                          ).ToList();
            #endregion


            //var result2 = ().tolist();


            ReportDocument rd = new ReportDocument();
            rd.Load(Path.Combine(Server.MapPath("~/Reports/CrystalReport1.rpt")));
            rd.SetDataSource(result);
            Response.Buffer = false;
            Response.ClearContent();
            Response.ClearHeaders();
            Stream steam = rd.ExportToStream(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat);
            steam.Seek(0, SeekOrigin.Begin);

            return File(steam, "application/pdf", "IT-Task.pdf");

        }
        #endregion
    }
}
