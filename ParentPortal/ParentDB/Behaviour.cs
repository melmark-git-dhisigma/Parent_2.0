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
    
    public partial class Behaviour
    {
        public int BehaviourId { get; set; }
        public Nullable<int> MeasurementId { get; set; }
        public Nullable<int> StudentId { get; set; }
        public Nullable<int> ObserverId { get; set; }
        public string Comment { get; set; }
        public string StartTime { get; set; }
        public string EndTime { get; set; }
        public Nullable<int> FrequencyCount { get; set; }
        public string ActiveInd { get; set; }
        public string Duration { get; set; }
        public string CreatedBy { get; set; }
        public Nullable<System.DateTime> CreatedOn { get; set; }
        public string ModifiedBy { get; set; }
        public Nullable<System.DateTime> ModifiedOn { get; set; }
        public string IsModify { get; set; }
    }
}
