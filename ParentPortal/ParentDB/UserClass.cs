//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ParentPortal.ParentDB
{
    using System;
    using System.Collections.Generic;
    
    public partial class UserClass
    {
        public int UserClassId { get; set; }
        public int SchoolId { get; set; }
        public int UserId { get; set; }
        public int ClassId { get; set; }
        public string PrimaryInd { get; set; }
        public Nullable<System.DateTime> EffStartDate { get; set; }
        public Nullable<System.DateTime> EffEndDate { get; set; }
        public string ActiveInd { get; set; }
        public string CreatedBy { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public string ModifiedBy { get; set; }
        public string ModifiedOn { get; set; }
    }
}
