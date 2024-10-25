using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LinkShorter.Models.Utility
{
    public class Utility
    {
        public string ConvertToChar(string Url)
        {
            string Link = "";
            foreach (var item in Url.Split(new char[] { '.' }))
            {
                if (item != "")
                {
                    char Converted = Convert.ToChar(int.Parse(item));
                    Link += Converted.ToString();
                }
            }
            return Link;
        }
        public string ConvertToAC(string Url)
        {
            string Link = "";
            for (int i = 0; i < Url.Length; i++)
            {
                int Converting = Char.ConvertToUtf32(Url.Substring(i, 1), 0);
                Link += Converting.ToString() + ".";
            }
            return Link;

        }
    }
}