using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ParentPortal.Models
{
    public class DocumentModel
    {
        public virtual IEnumerable<ParentServiceReference.Documents> DocumentInfo { get; set; }
        public virtual PagerModel Paging { get; set; }
        
        public DocumentModel()
        {
            DocumentInfo = new List<ParentServiceReference.Documents>();
            Paging = new PagerModel();
        }

        public virtual string DocumentName { get; set; }
        public virtual string DocumentType { get; set; }
        public virtual string DocumentPath { get; set; }
        public virtual string Other { get; set; }
    }
}