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
    
    public partial class StdtIEP_PE
    {
        public int StdtIEP_PEId { get; set; }
        public int SchoolId { get; set; }
        public int StudentId { get; set; }
        public int AsmntYearId { get; set; }
        public Nullable<int> StatusId { get; set; }
        public Nullable<System.DateTime> EffStartDate { get; set; }
        public Nullable<System.DateTime> EffEndDate { get; set; }
        public Nullable<System.DateTime> IepTeamMeetingDate { get; set; }
        public Nullable<System.DateTime> IepImplementationDate { get; set; }
        public string AnticipatedDurationofServices { get; set; }
        public string AnticipatedYearOfGraduation { get; set; }
        public string LocalEducationAgency { get; set; }
        public string OtherInformation { get; set; }
        public string DocumentedBy { get; set; }
        public string CountyOfResidance { get; set; }
        public string Concerns { get; set; }
        public string Strength { get; set; }
        public string Vision { get; set; }
        public string ApprovalNotes { get; set; }
        public string Version { get; set; }
        public int CreatedBy { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public Nullable<int> ModifiedBy { get; set; }
        public Nullable<System.DateTime> ModifiedOn { get; set; }
    }
}