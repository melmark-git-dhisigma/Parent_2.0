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
    
    public partial class AdaptiveEquipment
    {
        public int AdaptiveEquipmentId { get; set; }
        public int StudentPersonalId { get; set; }
        public int SchoolId { get; set; }
        public string Item { get; set; }
        public string ScheduleForUse { get; set; }
        public string StorageLocation { get; set; }
        public string CleaningInstruction { get; set; }
        public int CreatedBy { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public Nullable<int> ModifiedBy { get; set; }
        public Nullable<System.DateTime> ModifiedOn { get; set; }
    }
}
