using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ParentPortal;
using ParentPortal.Classes;

using System.Data.Entity.Validation;
using ParentPortal.Models;
using System.Web.Mvc;
using System.Data.Objects.SqlClient;
using ParentPortal.ParentServiceReference;
using System.Xml;
using System.Security.Cryptography.X509Certificates;
using System.Security.Cryptography;
using System.Security.Cryptography.Xml;

//using Microsoft.Office.Core;
using System.IO.Packaging;
using DocumentFormat.OpenXml.Packaging;
using System.Web.UI.WebControls;

namespace ParentPortal.Classes
{

    public class DbFunctions
    {

       

        ParentServiceClient parentService = null;
       public ActivityModel GetActivitiesWithPaging(int StudentId, int page, int pageSize, string keyword, string filter)
        {
            parentService = new ParentServiceClient();
           
            var model = new ActivityModel()
            {

            };
            PagerModel paging = new PagerModel();
            paging.CurrentPageIndex = page;
            paging.PageSize = pageSize;

            model.ActivityInfo = parentService.GetActivities(StudentId, paging.CurrentPageIndex, paging.PageSize, keyword, Convert.ToInt32(filter));
            // Determine the total number of products being paged through (needed to compute PageCount) with filter
            paging.TotalRecordCount = parentService.GetTotalActivityCount(StudentId, keyword, Convert.ToInt32(filter));


            if (paging.PageSize > paging.TotalRecordCount) { paging.PageSize = paging.TotalRecordCount; }
            if (paging.TotalRecordCount == 0) { paging.CurrentPageIndex = 0; }
            model.Paging = paging;

            return model;
        }
        public IEnumerable<SelectListItem> GetAllStatusForDDL(string Status)
        {
            parentService = new ParentServiceClient();
            IEnumerable<ListItem> lists = parentService.GetAllStatusForDDL(Status);

            List<SelectListItem> selItems = new List<SelectListItem>();

            foreach (ListItem itm in lists)
            {
                SelectListItem selitm = new SelectListItem();
                selitm.Text = itm.Text;
                selitm.Value = itm.Value;
                if(selitm.Text!="IEP")
                   
                selItems.Add(selitm);
            }

            return selItems.ToList();
        }
        public IEPModel GetIEPLists(int StudentId, int SchoolID, int page, int pageSize, string keyword, string filter)
        {

           
            parentService = new ParentServiceClient();
            IEPModel model = new IEPModel();

            PagerModel paging = new PagerModel();
            paging.CurrentPageIndex = page;
            paging.PageSize = pageSize;
            if (filter == "") filter = "0";

            model.IEPInfo = parentService.GetIEPLists(StudentId, SchoolID, paging.CurrentPageIndex, paging.PageSize, keyword, Convert.ToInt32(filter));
            // Determine the total number of products being paged through (needed to compute PageCount) without filter
            paging.TotalRecordCount = parentService.GetTotalRecordIEP(Convert.ToInt32(filter), keyword, StudentId);


            if (paging.PageSize > paging.TotalRecordCount) { paging.PageSize = paging.TotalRecordCount; }
            if (paging.TotalRecordCount == 0) { paging.CurrentPageIndex = 0; }
            model.Paging = paging;

            return model;
        }
        public DocumentModel GetDocumentList(int StudentId, int SchoolId, int page, int pageSize, string keyword, string filter)
        {
           
            parentService = new ParentServiceClient();
            DocumentModel model = new DocumentModel();

            PagerModel paging = new PagerModel();
            paging.CurrentPageIndex = page;
            paging.PageSize = pageSize;


            model.DocumentInfo = parentService.GetDocuments(StudentId, SchoolId, paging.CurrentPageIndex, paging.PageSize, keyword, Convert.ToInt32(filter));
            // Determine the total number of products being paged through (needed to compute PageCount) without filter
            paging.TotalRecordCount = parentService.GetTotalDocumentCount(StudentId, keyword, Convert.ToInt32(filter));


            if (paging.PageSize > paging.TotalRecordCount) { paging.PageSize = paging.TotalRecordCount; }
            if (paging.TotalRecordCount == 0) { paging.CurrentPageIndex = 0; }
            model.Paging = paging;

            return model;
        }
        public int FileUpload(int SchoolId, int StudentId, string DocName, string ContentType, string DocType, DocumentModel model, string DocPath, int ParentId, byte[] data)
        {
            int rtrnval = 0;
            string other;
            parentService = new ParentServiceClient();
            if (model.Other == null)
            {
                other = "";
            }
            else
                other = model.Other.ToString();
            rtrnval = parentService.FileUpload(SchoolId, StudentId, DocName, ContentType, DocType, other, DocPath, ParentId, data);

            return rtrnval;
        }
        public ConcentModel GetConcentList(int StudentId, int SchoolId, int page, int pageSize, string keyword, string filter)
        {
  
            parentService = new ParentServiceClient();
            ConcentModel model = new ConcentModel();

            PagerModel paging = new PagerModel();
            paging.CurrentPageIndex = page;
            paging.PageSize = pageSize;

            model.ConcentInfo = parentService.GetConcents(StudentId, SchoolId, paging.CurrentPageIndex, paging.PageSize, keyword, "Consent");
            // Determine the total number of products being paged through (needed to compute PageCount) without filter
            paging.TotalRecordCount = parentService.GetTotalConcentForms(StudentId, keyword, Convert.ToInt32(filter));


            if (paging.PageSize > paging.TotalRecordCount) { paging.PageSize = paging.TotalRecordCount; }
            if (paging.TotalRecordCount == 0) { paging.CurrentPageIndex = 0; }
            model.Paging = paging;

            return model;
        }
        //public string DownloadDoc(int documentId, int StudentId, string type = "Document")
        //{
        //    ParentEntity = new BiWeeklyRCPNewEntities();
        //    Document ObjDoc = new Document();
        //    Visitation ObjVisit = new Visitation();
        //    string dirpath = (AppDomain.CurrentDomain.BaseDirectory + "Files/Documents".ToString()).Replace('\\', '/');


        //    // dirpath = System.Web.Configuration.WebConfigurationManager.AppSettings["filesLocation"].ToString();
        //    //string dirpath = System.Web.Configuration.WebConfigurationManager.AppSettings["FileLocation"].ToString();
        //    //var attachmenttable = dbobj.Appattachments.Single(x => x.Id == id && x.RefObjectid == userSessionObj.id);
        //    //var userdoc = dbobj.AppAttachedFiles.Single(x => x.AttachmentId == attachmenttable.Id);
        //    if (type == "Document")
        //    {
        //        ObjDoc = ParentEntity.Documents.Where(objDocument => objDocument.DocumentId == documentId && objDocument.StudentPersonalId == StudentId).SingleOrDefault();
        //        if (ObjDoc != null)
        //        {
        //            var documentPath = dirpath + ObjDoc.DocumentId + "-" + ObjDoc.DocumentPath;
        //            return documentPath.Replace('\\', '/');
        //        }
        //    }
        //    else if (type == "Visitation")
        //    {
        //        ObjVisit = ParentEntity.Visitations.Where(objDocument => objDocument.VisitationId == documentId && objDocument.StudentPersonalId == StudentId).SingleOrDefault();

        //    }
        //    else if (type == "IEP")
        //    {

        //    }
        //    return "Failed";
        //}
        public int Delete(int id)
        {
            parentService = new ParentServiceClient();

            return parentService.Delete(id);
        }


        /*********************************************************************************/
        /******************************| Digital Signature |******************************/
        /*********************************************************************************/


        static readonly string RT_OfficeDocument = "http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument";
        static readonly string OfficeObjectID = "idOfficeObject";
        static readonly string SignatureID = "idPackageSignature";
        static readonly string ManifestHashAlgorithm = "http://www.w3.org/2000/09/xmldsig#sha1";

       // private Microsoft.Office.Interop.Word.Application WordApp = new Microsoft.Office.Interop.Word.Application();
        public string SignDocument(int StudentId, int DocumentId)
        {
            string file = System.Web.Configuration.WebConfigurationManager.AppSettings["filesLocation"].ToString() + "trialdoc.docx";

            bool checkInd = false;
            XmlDocument xml = new XmlDocument();
            using (var document = WordprocessingDocument.Open(file, false))
            {
                xml.Load(HttpContext.Current.Server.MapPath("../Documents/XML/OfficeObject.xml"));
                var signature = document.MainDocumentPart.Document.Descendants<DocumentFormat.OpenXml.Vml.Office.SignatureLine>().ToList();
                foreach (var sign in signature)
                {
                    var suggestedSigner = sign.SuggestedSigner;
                    if (suggestedSigner == "Parent")
                    {
                        XmlNodeList setupId = xml.GetElementsByTagName("SetupID");
                        XmlNodeList signText = xml.GetElementsByTagName("SignatureText");
                        if (setupId != null)
                        {
                            if (setupId.Count > 0)
                            {
                                setupId[0].InnerText = sign.Id.ToString();
                            }
                        }
                        if (signText != null)
                        {
                            if (signText.Count > 0)
                            {
                                signText[0].InnerText = "Parent Name";
                            }
                        }
                        xml.Save(HttpContext.Current.Server.MapPath("../Documents/XML/OfficeObject.xml"));
                        checkInd = true;
                    }
                }
                document.Close();
            }
            if (!checkInd) return "Document does not contain Signature Line for Parent";
            else return DigiSign(file, xml);
        }

        public string DigiSign(string Filename, XmlDocument xdoc)
        {
            // Open the Package    
            using (Package package = Package.Open(Filename))
            {
                // Get the certificate
                X509Certificate2 certificate = GetCertificate();
                string rtrn = SignAllParts(package, certificate, xdoc);
                package.Close();
                return rtrn;
            }

        }

        public string SignAllParts(Package package, X509Certificate certificate, XmlDocument xdoc)
        {
            if (package == null) throw new ArgumentNullException("SignAllParts(package)");
            List<Uri> PartstobeSigned = new List<Uri>();
            List<PackageRelationshipSelector> SignableReleationships = new List<PackageRelationshipSelector>();

            foreach (PackageRelationship relationship in package.GetRelationshipsByType(RT_OfficeDocument))
            {
                // Pass the releationship of the root. This is decided based on the RT_OfficeDocument (http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument)
                CreateListOfSignableItems(relationship, PartstobeSigned, SignableReleationships);
            }
            // Create the DigitalSignature Manager
            PackageDigitalSignatureManager dsm = new PackageDigitalSignatureManager(package);
            dsm.CertificateOption = CertificateEmbeddingOption.InSignaturePart;


            string signatureID = SignatureID;
            string manifestHashAlgorithm = ManifestHashAlgorithm;
            System.Security.Cryptography.Xml.DataObject officeObject = CreateOfficeObject(signatureID, manifestHashAlgorithm, xdoc);
            Reference officeObjectReference = new Reference("#" + OfficeObjectID);

            try
            {
                dsm.Sign(PartstobeSigned, certificate, SignableReleationships, signatureID, new System.Security.Cryptography.Xml.DataObject[] { officeObject }, new Reference[] { officeObjectReference });
                return "Success";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }






        }// end:SignAllParts()

        /**************************SignDocument******************************/
        //  This function is a helper function. The main role of this function is to 
        //  create two lists, one with Package Parts that you want to sign, the other 
        //  containing PacakgeRelationshipSelector objects which indicate relationships to sign.
        /*******************************************************************/
        public void CreateListOfSignableItems(PackageRelationship relationship, List<Uri> PartstobeSigned, List<PackageRelationshipSelector> SignableReleationships)
        {
            // This function adds the releation to SignableReleationships. And then it gets the part based on the releationship. Parts URI gets added to the PartstobeSigned list.
            PackageRelationshipSelector selector = new PackageRelationshipSelector(relationship.SourceUri, PackageRelationshipSelectorType.Id, relationship.Id);
            SignableReleationships.Add(selector);
            if (relationship.TargetMode == TargetMode.Internal)
            {
                PackagePart part = relationship.Package.GetPart(PackUriHelper.ResolvePartUri(relationship.SourceUri, relationship.TargetUri));
                if (PartstobeSigned.Contains(part.Uri) == false)
                {
                    PartstobeSigned.Add(part.Uri);
                    // GetRelationships Function: Returns a Collection Of all the releationships that are owned by the part.
                    foreach (PackageRelationship childRelationship in part.GetRelationships())
                    {
                        CreateListOfSignableItems(childRelationship, PartstobeSigned, SignableReleationships);
                    }
                }
            }
        }
        /**************************SignDocument******************************/
        //  Once you create the list and try to sign it, Office will not validate the Signature.
        //  To allow Office to validate the signature, it requires a custom object which should be added to the 
        //  signature parts. This function loads the OfficeObject.xml resource.
        //  Please note that GUID being passed in document.Loadxml. 
        //  Background Information: Once you add a SignatureLine in Word, Word gives a unique GUID to it. Now while loading the
        //  OfficeObject.xml, we need to make sure that The this GUID should match to the ID of the signature line. 
        //  So if you are generating a SignatureLine programmtically, then mmake sure that you generate the GUID for the 
        //  SignatureLine and for this element. 
        /*******************************************************************/

        public System.Security.Cryptography.Xml.DataObject CreateOfficeObject(string signatureID, string manifestHashAlgorithm, XmlDocument document)
        {
            //XmlDocument document = new XmlDocument();
            //document.LoadXml(HttpContext.Current.Server.MapPath("../Documents/XML/OfficeObject.xml"));
            System.Security.Cryptography.Xml.DataObject officeObject = new System.Security.Cryptography.Xml.DataObject();
            // do not change the order of the following two lines
            officeObject.LoadXml(document.DocumentElement); // resets ID
            officeObject.Id = OfficeObjectID; // required ID, do not change
            return officeObject;
        }
        /********************************************************/

        public X509Certificate2 GetCertificate()
        {
            X509Store certStore = new X509Store(StoreLocation.CurrentUser);
            certStore.Open(OpenFlags.ReadOnly);
            //X509Certificate2Collection certs = X509Certificate2UI.SelectFromCollection(certStore.Certificates, "Select a certificate", "Please select a certificate",
            //        X509SelectionFlag.SingleSelection);
            X509Certificate2Collection certs = certStore.Certificates.Find(X509FindType.FindByIssuerName, "TrialSign", false);
            return certs.Count > 0 ? certs[0] : null;
        }

        /*********************************************************************************/
        /************************|  Digital Signature End  |******************************/
        /*********************************************************************************/


    }
}