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
    
    public partial class AsmntLPRel
    {
        public int AsmntLPRelId { get; set; }
        public int GoalId { get; set; }
        public string AsmntName { get; set; }
        public string AsmntCat { get; set; }
        public string AsmntSubCat { get; set; }
        public string AsmntQId { get; set; }
        public Nullable<int> LessonPlanId { get; set; }
        public string LessonPlanName { get; set; }
        public Nullable<int> SortOrder { get; set; }
        public string ActiveInd { get; set; }
        public string CreatedBy { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public string ModifiedBy { get; set; }
        public string ModifiedOn { get; set; }
    }
}
