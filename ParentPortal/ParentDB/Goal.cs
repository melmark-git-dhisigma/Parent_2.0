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
    
    public partial class Goal
    {
        public int GoalId { get; set; }
        public int SchoolId { get; set; }
        public int GoalTypeId { get; set; }
        public int GoalLevelId { get; set; }
        public string GoalName { get; set; }
        public string GoalDesc { get; set; }
        public string GoalPic { get; set; }
        public Nullable<int> ParntGoalId { get; set; }
        public Nullable<System.DateTime> EffStartDate { get; set; }
        public Nullable<System.DateTime> EffEndDate { get; set; }
        public string ActiveInd { get; set; }
        public string CreatedBy { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public string ModifiedBy { get; set; }
        public string ModifiedOn { get; set; }
    }
}
