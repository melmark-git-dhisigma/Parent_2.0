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
    
    public partial class IEPExportStatu
    {
        public int Id { get; set; }
        public Nullable<int> SchoolId { get; set; }
        public Nullable<int> StudentId { get; set; }
        public Nullable<int> BinaryId { get; set; }
        public Nullable<int> DocumentIds { get; set; }
        public string Type { get; set; }
        public string ModuleName { get; set; }
        public string VersionNo { get; set; }
        public int CreatedBy { get; set; }
        public System.DateTime CreatedOn { get; set; }
    }
}