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
    
    public partial class AddressList
    {
        public int AddressId { get; set; }
        public int AddressType { get; set; }
        public string AddressLine1 { get; set; }
        public string AddressLine2 { get; set; }
        public string AddressLine3 { get; set; }
        public string Complex { get; set; }
        public string StreetNumber { get; set; }
        public string StreetPrefix { get; set; }
        public string StreetName { get; set; }
        public string StreetType { get; set; }
        public string StreetSuffix { get; set; }
        public string ApartmentType { get; set; }
        public string ApartmentNumberPrefix { get; set; }
        public Nullable<int> ApartmentNumber { get; set; }
        public string Phone { get; set; }
        public string Mobile { get; set; }
        public string OtherPhone { get; set; }
        public string PrimaryEmail { get; set; }
        public string SecondryEmail { get; set; }
        public string ApartmentNumberSuffix { get; set; }
        public string City { get; set; }
        public string County { get; set; }
        public Nullable<int> StateProvince { get; set; }
        public Nullable<int> CountryId { get; set; }
        public string PostalCode { get; set; }
        public string Fax { get; set; }
        public string GridLocation { get; set; }
        public string BusinessAddress { get; set; }
        public int CreatedBy { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public Nullable<int> ModifiedBy { get; set; }
        public Nullable<System.DateTime> ModifiedOn { get; set; }
    }
}
