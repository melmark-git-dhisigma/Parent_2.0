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
    
    public partial class RoleGroupPerm
    {
        public int PermissionId { get; set; }
        public int SchoolId { get; set; }
        public int RoleGroupId { get; set; }
        public int ObjectId { get; set; }
        public Nullable<bool> AccessInd { get; set; }
        public Nullable<bool> ReadInd { get; set; }
        public Nullable<bool> WriteInd { get; set; }
        public Nullable<bool> ApproveInd { get; set; }
        public int CreatedBy { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public Nullable<int> ModifiedBy { get; set; }
        public Nullable<System.DateTime> ModifiedOn { get; set; }
    }
}
