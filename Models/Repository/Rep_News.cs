using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using LinkShorter.Models.Domain;

namespace LinkShorter.Models.Repository
{
    public class Rep_News
    {
        DataBaseLSH db = new DataBaseLSH();
        public IQueryable<Tbl_News> GetAllNews()
        {
            var q = (from a in db.Tbl_News
                     select a).OrderByDescending(a => a.ID);
            return q;
        }
        public Tbl_News Get1News(string Link)
        {
            var q = db.Tbl_News.Where(a => a.LongLink.Equals(Link)).SingleOrDefault();
            if (q != null)
                return q;
            return null;
        }
        public Tbl_News Get1NewsByAC(string Url)
        {
            var q = db.Tbl_News.Where(a => a.Tbl_Links.Link.Equals(Url)).SingleOrDefault();
            if (q != null)
                return q;
            return null;
        }
        public bool NewsDelete(string Url)
        {
            var q = db.Tbl_News.Where(a => a.Tbl_Links.Link == Url).SingleOrDefault();
            if (q != null)
            {
                var q2 = q.Tbl_Links;
                q.Tbl_Links.Status = false;
                q2.Status = false;
                db.Tbl_Links.Attach(q2);
                db.Entry(q2).State = System.Data.Entity.EntityState.Modified;
                db.Tbl_News.Remove(q);
                db.SaveChanges();
                return true;
            }
            return false;
        }
    }
}