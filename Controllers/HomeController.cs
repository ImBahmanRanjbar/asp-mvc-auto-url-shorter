using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LinkShorter.Models.Domain;
using LinkShorter.Models.Repository;
using LinkShorter.Models.Struct;
using LinkShorter.Models.Utility;

namespace LinkShorter.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        Rep_News Rep_News = new Rep_News();
        Utility U = new Utility();
        public ActionResult Index()
        {
            var a = Rep_News.GetAllNews();
            return View(a);
        }
        public ActionResult News(string id)
        {
            var a = Rep_News.Get1News(id);
            if (a != null)
                return View(a);
            return RedirectToAction("Eror", "Home");
             

        }
        public ActionResult N(Struct S)
        {
            if (!ModelState.IsValid)
            {
                return RedirectToAction("Eror", "Home");
            }
            var a = U.ConvertToAC(S.ID);
          var b=  Rep_News.Get1NewsByAC(a);
            if (b != null)
                return View("News", b);
            return RedirectToAction("Eror", "Home");
        }
        [HttpGet]
        public ActionResult AddNews()
        {
            return View();
        }
        [HttpPost]
        public ActionResult AddNews(Tbl_News t)
        {
            DataBaseLSH db = new DataBaseLSH();
            var Get1Link = db.Tbl_Links.Where(a => a.Status == false).FirstOrDefault();
            Get1Link.Status = true;
            db.Tbl_Links.Attach(Get1Link);
            db.Entry(Get1Link).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            Tbl_News tn = new Tbl_News();
            tn.Title = t.Title;
            tn.LongLink = t.Title.Replace(" ", "-");
            tn.ShortLink = Get1Link.ID;
            db.Tbl_News.Add(tn);
            db.SaveChanges();
            return RedirectToAction("Index", "Home");
        }
        public ActionResult NewsDelete(Struct S)
        {
            if (!ModelState.IsValid)
            {
                return RedirectToAction("Eror", "Home");
            }
            var a = U.ConvertToAC(S.ID);
            var b = Rep_News.NewsDelete(a);
            if (b==true)
            {
                return RedirectToAction("Index", "Home");
            }
            return RedirectToAction("Eror", "Home");
        }
            public ActionResult Eror()
        {
            return View();
        }
        public ActionResult AddLinks()
        {
            Random Rnd = new Random();
            for (int i = 0; i < 62; i++)
            {
                string Link = "";
                for (int ii = 0; ii < 1; ii++)
                {
                 int RandNumber=   Rnd.Next(65, 127);
                    switch (RandNumber)
                    {
                        case 91:
                            {
                                Link += 48 + ".";
                                break;
                            }
                        case 92:
                            {
                                Link += 49 + ".";
                                break;
                            }
                        case 93:
                            {
                                Link += 50 + ".";
                                break;
                            }
                        case 94:
                            {
                                Link += 51 + ".";
                                break;
                            }
                        case 95:
                            {
                                Link += 52 + ".";
                                break;
                            }
                        case 96:
                            {
                                Link += 53 + ".";
                                break;
                            }
                        case 123:
                            {
                                Link += 54 + ".";
                                break;
                            }
                        case 124:
                            {
                                Link += 55 + ".";
                                break;
                            }
                        case 125:
                            {
                                Link += 56 + ".";
                                break;
                            }
                        case 126:
                            {
                                Link += 57 + ".";
                                break;
                            }
                        default:
                            {
                                Link += RandNumber + ".";
                                break;
                            }

                    }
                }
                DataBaseLSH db = new DataBaseLSH();
                var q = db.Tbl_Links.Where(a => a.Link == Link).SingleOrDefault();
                if (q == null)
                {
                    Tbl_Links tl = new Tbl_Links();
                    tl.Link = Link;
                    tl.Status = false;
                    db.Tbl_Links.Add(tl);
                    db.SaveChanges();

                }
                else
                {
                    i--;
                }
            }
            return RedirectToAction("Index", "Home");
        }
    }
}