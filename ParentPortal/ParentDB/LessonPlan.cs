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
    
    public partial class LessonPlan
    {
        public int LessonPlanId { get; set; }
        public int SchoolId { get; set; }
        public string LessonPlanName { get; set; }
        public string LessonPlanDesc { get; set; }
        public string PreReq { get; set; }
        public string TeacherSD { get; set; }
        public string TeacherInst { get; set; }
        public string Consequence { get; set; }
        public string BaselineProc { get; set; }
        public string PostCheckProc { get; set; }
        public string ImageURL { get; set; }
        public string Materials { get; set; }
        public string FrameandStrand { get; set; }
        public string SpecStandard { get; set; }
        public string SpecEntryPoint { get; set; }
        public string ActiveInd { get; set; }
        public Nullable<int> CreatedBy { get; set; }
        public Nullable<System.DateTime> CreatedOn { get; set; }
        public Nullable<int> ModifiedBy { get; set; }
        public Nullable<System.DateTime> ModifiedOn { get; set; }
    }
}
