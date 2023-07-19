using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ParentPortal.Models
{
    public class ActivityModel
    {
        //public virtual IEnumerable<Activities> Activities { get; set; }
        public virtual IEnumerable<ParentServiceReference.Activities> ActivityInfo { get; set; }
        public virtual PagerModel Paging { get; set; }
        public ActivityModel()
        {
            //Activities = new List<Activities>();
            ActivityInfo = new List<ParentServiceReference.Activities>();
            Paging = new PagerModel();
            //this.SearchKeyword = "";
        }


        //public virtual string SearchKeyword { get; set; }
        //public virtual string FilterStatus { get; set; }
    }
    //public class Activities
    //{
    //    public virtual string ActivityName { get; set; }
    //    public virtual DateTime? Date { get; set; }
    //    public virtual string Status { get; set; }
    //}
}