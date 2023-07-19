using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ParentPortal.Models
{
    public class HomeModel
    {
        public virtual ParentServiceReference.ParentDetails parentInfo { get; set; }
        public virtual ParentServiceReference.ParentDetailsPA parentInfoPA { get; set; }
        public virtual string Imageurl { get; set; }
        public HomeModel()
        {
            parentInfo = new ParentServiceReference.ParentDetails();
            parentInfoPA = new ParentServiceReference.ParentDetailsPA();
        }
    }
    
}