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
    
    public partial class LetterEngine
    {
        public int LetterEngineId { get; set; }
        public int SchoolId { get; set; }
        public Nullable<int> QueueId { get; set; }
        public Nullable<bool> ApproveStatus { get; set; }
        public string LetterEngineName { get; set; }
        public string LetterType { get; set; }
        public int CreatedBy { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public Nullable<int> ModifiedBy { get; set; }
        public Nullable<System.DateTime> ModifiedOn { get; set; }
    }
}