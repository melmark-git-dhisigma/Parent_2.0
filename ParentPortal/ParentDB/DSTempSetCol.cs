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
    
    public partial class DSTempSetCol
    {
        public int DSTempSetColId { get; set; }
        public int SchoolId { get; set; }
        public int DSTempHdrId { get; set; }
        public string ColName { get; set; }
        public string ColTypeCd { get; set; }
        public string CorrRespType { get; set; }
        public string CorrResp { get; set; }
        public string CorrRespDesc { get; set; }
        public string InCorrRespDesc { get; set; }
        public string CorrStdtResp { get; set; }
        public string InCorrStdResp { get; set; }
        public Nullable<bool> IncPromptCriteria { get; set; }
        public Nullable<bool> IncMisTrialInd { get; set; }
        public string MisTrialDesc { get; set; }
        public string ActiveInd { get; set; }
        public string CreatedBy { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public string ModifiedBy { get; set; }
        public Nullable<System.DateTime> ModifiedOn { get; set; }
    }
}
