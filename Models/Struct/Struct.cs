using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace LinkShorter.Models.Struct
{
    public class Struct
    {
        [Required(AllowEmptyStrings =false)]
        [RegularExpression("[a-zA-Z0-9]{2,8}")]
        public string ID { get; set; }
    }
}