using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ParentPortal.Models
{
    public class ConcentModel
    {
        public virtual IEnumerable<ParentServiceReference.Concents> ConcentInfo { get; set; }
        public virtual PagerModel Paging { get; set; }
        public ConcentModel()
        {
            ConcentInfo = new List<ParentServiceReference.Concents>();
            Paging = new PagerModel();
        }
    }
}