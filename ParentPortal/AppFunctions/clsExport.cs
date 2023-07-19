using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;



namespace ParentPortal.AppFunctions
{
   
    public class clsExport
    {
        public virtual ParentServiceReference.ProgressDetails ProgressInfo { get; set; }

        public clsExport()
        {
            ProgressInfo = new ParentServiceReference.ProgressDetails();
         
        }
    }

   
}
