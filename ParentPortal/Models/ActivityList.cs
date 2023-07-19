using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ParentPortal.Models
{
    public class ActivityList
    {

        public virtual IEnumerable<ParentServiceReference.ActivitiesList> ActivityListInfo { get; set; }

        public ActivityList()
        {
            //Activities = new List<Activities>();
            ActivityListInfo = new List<ParentServiceReference.ActivitiesList>();
            
        }
    }
}