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
    
    public partial class BehaviourDetail
    {
        public int MeasurementId { get; set; }
        public Nullable<int> SchoolId { get; set; }
        public Nullable<int> ClassId { get; set; }
        public Nullable<int> StudentId { get; set; }
        public string Behaviour { get; set; }
        public Nullable<bool> Frequency { get; set; }
        public Nullable<bool> Duration { get; set; }
        public Nullable<bool> PartialInterval { get; set; }
        public Nullable<System.TimeSpan> StartTime { get; set; }
        public Nullable<int> NumOfTimes { get; set; }
        public Nullable<int> Period { get; set; }
        public Nullable<System.DateTime> StartDate { get; set; }
        public Nullable<System.DateTime> EndDate { get; set; }
        public string Condition { get; set; }
        public Nullable<int> Interval { get; set; }
        public string ActiveInd { get; set; }
        public string CreatedBy { get; set; }
        public Nullable<System.DateTime> CreatedOn { get; set; }
        public string ModifiedBy { get; set; }
        public Nullable<System.DateTime> ModifiedOn { get; set; }
    }
}
