//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace LinkShorter.Models.Domain
{
    using System;
    using System.Collections.Generic;
    
    public partial class Tbl_News
    {
        public int ID { get; set; }
        public string Title { get; set; }
        public string LongLink { get; set; }
        public int ShortLink { get; set; }
    
        public virtual Tbl_Links Tbl_Links { get; set; }
    }
}
