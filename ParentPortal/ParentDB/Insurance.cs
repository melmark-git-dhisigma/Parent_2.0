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
    
    public partial class Insurance
    {
        public int InsuranceId { get; set; }
        public int StudentPersonalId { get; set; }
        public int SchoolId { get; set; }
        public Nullable<int> AddressId { get; set; }
        public string CompanyName { get; set; }
        public string PreferType { get; set; }
        public string InsuranceType { get; set; }
        public string PolicyNumber { get; set; }
        public string PolicyHolder { get; set; }
        public int CreatedBy { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public Nullable<int> ModifiedBy { get; set; }
        public Nullable<System.DateTime> ModifiedOn { get; set; }
    }
}
