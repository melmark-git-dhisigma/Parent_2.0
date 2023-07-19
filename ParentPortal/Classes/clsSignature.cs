﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml;
using System.Security.Cryptography.X509Certificates;
using System.Security.Cryptography;
using System.Security.Cryptography.Xml;
using ParentPortal.Classes;

using System.Data.Entity.Validation;
using ParentPortal.Models;
using ParentPortal.ParentServiceReference;
using Microsoft.Office.Core;
using System.IO.Packaging;
using DocumentFormat.OpenXml.Packaging;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.Mvc;
using System.Configuration;


namespace ParentPortal.Classes
{



    public class clsSignature
    {














        static readonly string RT_OfficeDocument = "http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument";
        static readonly string OfficeObjectID = "idOfficeObject";
        static readonly string SignatureID = "idPackageSignature";
        static readonly string ManifestHashAlgorithm = "http://www.w3.org/2000/09/xmldsig#sha1";

        private Microsoft.Office.Interop.Word.Application WordApp = new Microsoft.Office.Interop.Word.Application();




        public string getFileExtention(string ContentType)
        {
            string Ext = "";

            if (ContentType == "application/msword")
            {
                Ext = ".doc";
            }
            else if (ContentType == "text/plain")
            {
                Ext = ".txt";
            }
            else if (ContentType == "application/pdf")
            {
                Ext = ".pdf";
            }
            else if (ContentType == "application/vnd.ms-excel")
            {
                Ext = ".xls";
            }

            return Ext;
        }


        public string getSignedUsers(int StudentId, int DocumentId, int SchoolId)
        {
            string users = "";
            byte[] Doc = GetIEPBinary(StudentId, SchoolId, DocumentId);

            string FileName = ByteToWord(Doc);

            bool checkInd = false;
            XmlDocument xml = new XmlDocument();

            using (Package package = Package.Open(FileName))
            {
                //   xml.Load(HttpContext.Current.Server.MapPath("../Documents/XML/OfficeObject.xml"));
                PackageDigitalSignatureManager dsm = new PackageDigitalSignatureManager(package);
                var signature = dsm.Signatures;
                foreach (var sign in signature)
                {

                    users = users + sign.Signer.GetName() + "|";

                }
            }

            return users;
        }



        public byte[] GetIEPBinary(int StudentId, int SchoolId, int DocumentId)
        {
            byte[] ar = new byte[0001];

            ParentServiceClient parentService = new ParentServiceClient();

            var DocLists = parentService.GetBinaryDoc(StudentId, SchoolId, DocumentId);

            var DocList = (from Doc in DocLists
                           select new
                           {
                               DocId = Doc.DocumentId,
                               DocName = Doc.DocumentName,
                               ContentType = Doc.ContentType.ToString(),
                               Data = Doc.Data,
                           }).SingleOrDefault();


            if (DocList != null)
                return DocList.Data;
            else return ar;
        }



        public string SignDocument(int StudentId, int DocumentId, int SchoolId, int ParentId)
        {
            byte[] Doc = GetIEPBinary(StudentId, SchoolId, DocumentId);
            DbFunctions fun = new DbFunctions();
            string FileName = ByteToWord(Doc);
            ParentServiceClient parentService = new ParentServiceClient();
            bool checkInd = false;
            XmlDocument xml = new XmlDocument();

            using (var document = WordprocessingDocument.Open(FileName, true))
            {
                xml.Load(HttpContext.Current.Server.MapPath("../Documents/XML/OfficeObject.xml"));
                var signature = document.MainDocumentPart.Document.Descendants<DocumentFormat.OpenXml.Vml.Office.SignatureLine>().ToList();
                foreach (var sign in signature)
                {
                    var suggestedSigner = sign.SuggestedSigner2;
                    //if (suggestedSigner == "Parent")
                    //{
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
                            signText[0].InnerText = parentService.GetParentName(ParentId);
                        }
                    }
                    xml.Save(HttpContext.Current.Server.MapPath("../Documents/XML/OfficeObject.xml"));
                    checkInd = true;
                    //}
                }

                document.Close();
            }


            if (!checkInd) return "Document does not contain Signature Line for Parent";
            else return DigiSign(FileName, xml, DocumentId);

        }

        private string ByteToWord(byte[] bytes)
        {
            string FileName = Path.GetTempFileName() + ".docx";

            using (MemoryStream MS = new MemoryStream())
            {
                using (FileStream Fs = new FileStream(FileName, FileMode.Create, FileAccess.Write))
                {
                    MS.Read(bytes, 0, (int)MS.Length);
                    Fs.Write(bytes, 0, bytes.Length);
                    MS.Close();
                }
            }
            return FileName;
        }

        public string DigiSign(string Filename, XmlDocument xdoc, int DocumentId)
        {
            string rtrn = "";
            // Open the Package    
            using (Package package = Package.Open(Filename))
            {
                // Get the certificate
                X509Certificate2 certificate = GetCertificate();
                rtrn = SignAllParts(package, certificate, xdoc);
                package.Close();

            }

            ParentServiceClient parentService = new ParentServiceClient();
            byte[] bytes = System.IO.File.ReadAllBytes(Filename);

            parentService.SignUpdate(bytes, DocumentId);

            return rtrn;
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
            // System.Security.Cryptography.Xml.DataObject officeObject = CreateOfficeObject(signatureID, manifestHashAlgorithm, xdoc);
            //Reference officeObjectReference = new Reference("#" + OfficeObjectID);

            try
            {
                //dsm.Sign(PartstobeSigned, certificate, SignableReleationships, signatureID, new System.Security.Cryptography.Xml.DataObject[] { officeObject }, new Reference[] { officeObjectReference });
                dsm.Sign(PartstobeSigned, certificate, SignableReleationships);
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
            string storeLocation = ConfigurationManager.AppSettings["storelocation"].ToString();
            string school = ConfigurationManager.AppSettings["School"].ToString();
            string role = "Parent";
            // storeLocation = "StoreLocation." + storeLocation;
            X509Store certStore = null;
            if (storeLocation == "CurrentUser")
            {
                certStore = new X509Store(StoreLocation.CurrentUser);
            }
            else
            {
                certStore = new X509Store(StoreLocation.LocalMachine);
            }
            //for local build
            // X509Store certStore = new X509Store(StoreLocation.CurrentUser);     //for local build

            // X509Store certStore = new X509Store(StoreLocation.LocalMachine);    //for server IIS Build
            certStore.Open(OpenFlags.ReadOnly);
            //X509Certificate2Collection certs = X509Certificate2UI.SelectFromCollection(certStore.Certificates, "Select a certificate", "Please select a certificate",
            //        X509SelectionFlag.SingleSelection);

            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(HttpContext.Current.Server.MapPath("../Documents/XML/signXML.xml"));
            string[] userXML = null;
            XmlNodeList xmlList = null;
            xmlList = xmlDoc.GetElementsByTagName("Document");
            string certificate = "";
            foreach (XmlNode st in xmlList)
            {

                if (school == "NE")
                {
                    if (st.Attributes["Name"].Value == "NEIEP")
                    {
                        XmlNodeList xmlListColumns = null;
                        xmlListColumns = st.ChildNodes.Item(0).ChildNodes;
                        userXML = new string[xmlListColumns.Count];
                        foreach (XmlNode stMs in xmlListColumns)
                        {
                            if (stMs.Attributes["Role"].Value == role)
                            {
                                certificate = stMs.Attributes["signature"].Value;
                            }
                            // userXML[index] = stMs.Attributes["Role"].Value;
                        }
                    }
                }
                if (school == "PA")
                {
                    if (st.Attributes["Name"].Value == "PAIEP")
                    {
                        XmlNodeList xmlListColumns = null;
                        xmlListColumns = st.ChildNodes.Item(0).ChildNodes;
                        userXML = new string[xmlListColumns.Count];
                        foreach (XmlNode stMs in xmlListColumns)
                        {
                            if (stMs.Attributes["Role"].Value == role)
                            {
                                certificate = stMs.Attributes["signature"].Value;
                            }
                            // userXML[index] = stMs.Attributes["Role"].Value;
                        }
                    }
                }


            }

            X509Certificate2Collection certs = certStore.Certificates.Find(X509FindType.FindBySubjectName, certificate, false);
            return certs.Count > 0 ? certs[0] : null;
        }




    }


}