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
    
    public partial class StdtGoal
    {
        public int StdtGoalId { get; set; }
        public int SchoolId { get; set; }
        public int StudentId { get; set; }
        public int GoalId { get; set; }
        public int AsmntYearId { get; set; }
        public Nullable<int> StdtIEPId { get; set; }
        public Nullable<int> IEPGoalNo { get; set; }
        public Nullable<bool> IncludeIEP { get; set; }
        public Nullable<int> StatusId { get; set; }
        public string CurPerfLevel { get; set; }
        public string ActiveInd { get; set; }
        public string AnnualGoalDesc { get; set; }
        public string Objective1 { get; set; }
        public string Objective2 { get; set; }
        public string Objective3 { get; set; }
        public Nullable<int> CreatedBy { get; set; }
        public Nullable<System.DateTime> CreatedOn { get; set; }
        public Nullable<int> ModifiedBy { get; set; }
        public Nullable<System.DateTime> ModifiedOn { get; set; }
    }
}
