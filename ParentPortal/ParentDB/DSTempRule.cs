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
    
    public partial class DSTempRule
    {
        public int DSTempRuleId { get; set; }
        public int SchoolId { get; set; }
        public Nullable<int> DSTempHdrId { get; set; }
        public Nullable<int> DSTempSetColId { get; set; }
        public int DSTempSetColCalcId { get; set; }
        public string RuleType { get; set; }
        public string CriteriaType { get; set; }
        public Nullable<int> ScoreReq { get; set; }
        public Nullable<int> TotalInstance { get; set; }
        public Nullable<int> TotCorrInstance { get; set; }
        public Nullable<bool> ConsequetiveInd { get; set; }
        public Nullable<bool> MultiTeacherReqInd { get; set; }
        public Nullable<bool> IOAReqInd { get; set; }
        public string LogicalCombType { get; set; }
        public string CriteriaDetails { get; set; }
        public string ActiveInd { get; set; }
        public Nullable<bool> IsComment { get; set; }
        public string ModificationComment { get; set; }
        public Nullable<int> ModificationRule { get; set; }
        public string CreatedBy { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public string ModifiedBy { get; set; }
        public Nullable<System.DateTime> ModifiedOn { get; set; }
    }
}
