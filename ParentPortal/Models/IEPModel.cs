using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ParentPortal.Models
{
    public class IEPModel
    {
        //public virtual IEnumerable<IEPs> IEPs { get; set; }
        public virtual PagerModel Paging { get; set; }
        public virtual IEnumerable<ParentServiceReference.IEPDetails> IEPInfo { get; set; }
        public virtual IEnumerable<SignatureDetail> SignInfo { get;set;}
        
        public IEPModel()
        {
            //IEPs = new List<IEPs>();
            Paging = new PagerModel();
            IEPInfo = new List<ParentServiceReference.IEPDetails>();
            SignInfo = new List<SignatureDetail>();
            //this.SearchKeyword = "";
        }

        //public virtual string SearchKeyword { get; set; }
        //public virtual string FilterStatus { get; set; }
    }
    public class IEPs
    {
        public virtual string IEPYear { get; set; }
        public virtual DateTime? StartDate { get; set; }
        public virtual DateTime? EndDate { get; set; }
        public virtual string Status { get; set; }
    }

    public class SignatureDetail
    {
        public virtual string UserName { get; set; }
        public virtual DateTime? SignedOn { get; set; }
    }
}