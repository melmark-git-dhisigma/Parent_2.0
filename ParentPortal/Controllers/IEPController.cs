using ParentPortal.Classes;
using ParentPortal.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using ParentPortal.ParentServiceReference;
using System.Xml;

namespace ParentPortal.Controllers
{
    public class IEPController : Controller
    {
        //
        // GET: /IEP/
        DbFunctions oDb = null;
        ParentServiceClient parentService = new ParentServiceClient();
        public ActionResult Index()
        {
            return View();
        }
          [OutputCache(Location = System.Web.UI.OutputCacheLocation.None)]
        public ActionResult IEPLists(IEPModel model, int page = 1, int pageSize = 5, string keywrd = "", string filter = "0")
        {

            oDb = new DbFunctions();
            if ((model.Paging.SearchKeyword == null) || (model.Paging.SearchKeyword == "")) { model.Paging.SearchKeyword = keywrd; }
            if ((model.Paging.FilterStatus == null) || (model.Paging.FilterStatus == "")) { model.Paging.FilterStatus = filter; }

            ViewBag.Filter = model.Paging.FilterStatus;
            ViewBag.StatusLists = oDb.GetAllStatusForDDL("IEP Status");
            if (Session["ParentID"] != null)
                model = oDb.GetIEPLists(parentService.GetStudentId(Convert.ToInt32(Session["ParentID"])), parentService.GetSchoolId(Convert.ToInt32(Session["ParentID"])), page, pageSize, model.Paging.SearchKeyword.Trim(), model.Paging.FilterStatus.Trim());

            if (Request.IsAjaxRequest())
            {
                return PartialView("IEPPartial", model);
            }
            else
            {
                return View(model);
            }
        }
          [OutputCache(Location = System.Web.UI.OutputCacheLocation.None)]
        public ActionResult SignDoc(int id)
        {
            int StudentId = 0, SchoolId = 0;
            oDb = new DbFunctions();
          

            ParentServiceClient parentService = new ParentServiceClient();

            if (Session["ParentID"] != null)
            {
                StudentId = parentService.GetStudentId(Convert.ToInt32(Session["ParentID"]));
                SchoolId = parentService.GetSchoolId(Convert.ToInt32(Session["ParentID"]));
            }
            clsSignature objSign = new clsSignature();

            objSign.SignDocument(StudentId, id, SchoolId, Convert.ToInt32(Session["ParentID"]));
            return RedirectToAction("IEPLists");
        }

          [OutputCache(Location = System.Web.UI.OutputCacheLocation.None)]
        public string GetSignedUsers(int IEPId)
        {
            int StudentId = 0, SchoolId = 0;
            if (Session["ParentID"] != null)
            {
                StudentId = parentService.GetStudentId(Convert.ToInt32(Session["ParentID"]));
                SchoolId = parentService.GetSchoolId(Convert.ToInt32(Session["ParentID"]));
            }
            clsSignature objSign = new clsSignature();
            string users = objSign.getSignedUsers(StudentId, IEPId, SchoolId);
            string[] temp = users.Split('|');
            string[] signeduser = new string[temp.Length - 1];
            int i = 0;

            foreach (var item in temp)
            {

                if (item != "")
                {
                    string[] username = item.Split('=');
                    signeduser[i] = username[1];
                }
                i++;
            }


            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(Server.MapPath("../Documents/XML/signXML.xml"));
            string[] userXML = null;
            string[] certificateXMl = null;
            XmlNodeList xmlList = null;
            xmlList = xmlDoc.GetElementsByTagName("Document");
            int index = 0;
            foreach (XmlNode st in xmlList)
            {
                if (st.Attributes["Name"].Value == "NEIEP")
                {
                    XmlNodeList xmlListColumns = null;
                    xmlListColumns = st.ChildNodes.Item(0).ChildNodes;
                    userXML = new string[xmlListColumns.Count];
                    certificateXMl = new string[xmlListColumns.Count];
                    foreach (XmlNode stMs in xmlListColumns)
                    {
                        userXML[index] = stMs.Attributes["Role"].Value;
                        certificateXMl[index] = stMs.Attributes["signature"].Value;
                        index++;
                    }
                }
            }

            bool[] signed = new bool[certificateXMl.Length];


            string table = "<table style='width:100%'><tr><th>User Roles</th><th>Sign Status</th></tr>";
            for (int indexi = 0; indexi < certificateXMl.Length; indexi++)
            {
                for (int indexj = 0; indexj < signeduser.Length; indexj++)
                {
                    if (certificateXMl[indexi].ToString() == signeduser[indexj].ToString())
                    {
                        signed[indexi] = true;

                        break;
                    }

                }

            }

            for (int isign = 0; isign < signed.Length; isign++)
            {
                if (signed[isign] == true)

                    table = table + "<tr><td style='text-align:center'>" + userXML[isign].ToString() + "</td><td style='text-align:center'>Signed</td></tr>";

                else
                    table = table + "<tr><td style='text-align:center'>" + userXML[isign].ToString() + "</td><td style='text-align:center'>Unsigned</td></tr>";
            }
            table = table + "</table>";
            return table;
           
        }
          [OutputCache(Location = System.Web.UI.OutputCacheLocation.None)]
        public ActionResult DownloadDoc(int Id)
        {
            int StudentId = 0, SchoolId = 0;
            oDb = new DbFunctions();
          
            ParentServiceClient parentService = new ParentServiceClient();

            //   if (Ids != "") DId = Convert.ToInt16(Ids);

            if (Session["ParentID"] != null)
            {
                StudentId = parentService.GetStudentId(Convert.ToInt32(Session["ParentID"]));
                SchoolId = parentService.GetSchoolId(Convert.ToInt32(Session["ParentID"]));
            }

            var DocLists = parentService.GetBinaryDoc(StudentId, SchoolId, Id);



            var DocList = (from Doc in DocLists
                           select new
                           {
                               DocId = Doc.DocumentId,
                               DocName = Doc.DocumentName,
                               ContentType = Doc.ContentType.ToString(),
                               Data = Doc.Data,
                           }).SingleOrDefault();


            if (DocList != null) ShowDocument(DocList.DocName, DocList.Data, DocList.ContentType);

            return RedirectToAction("IEPLists");

        }


        private void ShowDocument(string fileName, byte[] fileContent, string ContentType)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.Charset = "";
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = ContentType;
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
            Response.BinaryWrite(fileContent);
            Response.Flush();
            Response.End();
        }


    }
}
