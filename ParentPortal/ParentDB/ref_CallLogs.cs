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
    
    public partial class ref_CallLogs
    {
        public int CallLogId { get; set; }
        public Nullable<int> QueueStatusId { get; set; }
        public int AcReviewId { get; set; }
        public int StudentId { get; set; }
        public int SchoolId { get; set; }
        public string StaffName { get; set; }
        public Nullable<System.DateTime> CallTime { get; set; }
        public string Nameofcontact { get; set; }
        public Nullable<System.DateTime> AppointmentTime { get; set; }
        public string Conversation { get; set; }
        public string Draft { get; set; }
        public string Type { get; set; }
        public int CreatedBy { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public Nullable<int> ModifiedBy { get; set; }
        public Nullable<System.DateTime> ModifiedOn { get; set; }
    }
}
