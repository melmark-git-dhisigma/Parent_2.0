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
    
    public partial class StdtClinicalCoverSheet
    {
        public int ClinicalCvId { get; set; }
        public Nullable<int> SchoolId { get; set; }
        public Nullable<int> ClassId { get; set; }
        public Nullable<int> StudentId { get; set; }
        public Nullable<System.DateTime> StartDate { get; set; }
        public Nullable<System.DateTime> EndDate { get; set; }
        public string FollowUp { get; set; }
        public string Proposals { get; set; }
        public string PgmCord { get; set; }
        public Nullable<System.DateTime> PgmCordDate { get; set; }
        public string EduCord { get; set; }
        public Nullable<System.DateTime> EduCordDate { get; set; }
        public string BCBA { get; set; }
        public Nullable<System.DateTime> BCBADate { get; set; }
        public string Location { get; set; }
        public string Program { get; set; }
        public string IepYear { get; set; }
        public string PeriodOfAssmt { get; set; }
    }
}