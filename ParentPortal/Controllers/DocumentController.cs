using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ParentPortal.Models;
using ParentPortal.Classes;
using System.IO;
using System.Data.SqlClient;
using System.Web.Hosting;

using ParentPortal.ParentServiceReference;

namespace ParentPortal.Controllers
{
    public class DocumentController : Controller
    {
        //
        // GET: /Document/
        DbFunctions oDb = null;
        ParentServiceClient parentService = new ParentServiceClient();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult DocumentLists(DocumentModel model, int page = 1, int pageSize = 5, string keywrd = "", string filter = "0")
        {
            oDb = new DbFunctions();
            if ((model.Paging.SearchKeyword == null) || (model.Paging.SearchKeyword == "")) { model.Paging.SearchKeyword = keywrd; }
            if ((model.Paging.FilterStatus == null) || (model.Paging.FilterStatus == "")) { model.Paging.FilterStatus = filter; }

            ViewBag.TypeLists = oDb.GetAllStatusForDDL("Document Type");
            ViewBag.FilterLists = oDb.GetAllStatusForDDL("Document Type");
            model = oDb.GetDocumentList(parentService.GetStudentId(Convert.ToInt32(Session["ParentID"])), parentService.GetSchoolId(Convert.ToInt32(Session["ParentID"])), page, pageSize, model.Paging.SearchKeyword.Trim(), model.Paging.FilterStatus.Trim());
            if (Request.IsAjaxRequest())
            {
                return PartialView("DocumentPartial", model);
            }
            else
            {
                return View(model);
            }
        }
        [HttpPost]
        public ActionResult Upload(DocumentModel model, HttpPostedFileBase Upfile)
        {
            if (Upfile != null && Upfile.ContentLength > 0 && model.DocumentType != null)
            {
                oDb = new DbFunctions();
                string fileName = Path.GetFileName(Upfile.FileName);

                MemoryStream target = new MemoryStream();
                Upfile.InputStream.CopyTo(target);
                byte[] bytes = target.ToArray();

                int ParentId = Convert.ToInt32(Session["ParentID"]);
                int StudentId = parentService.GetStudentId(ParentId);
                int SchoolId = parentService.GetSchoolId(ParentId);

                int id = oDb.FileUpload(SchoolId, StudentId, model.DocumentName, Upfile.ContentType, model.DocumentType.ToString(),model, model.DocumentPath, ParentId, bytes);

                //Upfile.SaveAs(path + id + "-" + fileName);
            }
            return RedirectToAction("DocumentLists");
        }
        [OutputCache(Location = System.Web.UI.OutputCacheLocation.None)]
        public ActionResult DownloadDoc(int id)
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

            var DocLists = parentService.GetBinaryDoc(StudentId, SchoolId, id);



            var DocList = (from Doc in DocLists
                           select new
                           {
                               DocId = Doc.DocumentId,
                               DocName = Doc.DocumentName,
                               ContentType = Doc.ContentType.ToString(),
                               Data = Doc.Data,
                           }).SingleOrDefault();


            if (DocList != null) ShowDocument(DocList.DocName, DocList.Data, DocList.ContentType);

            return RedirectToAction("DocumentLists");


        }
        private void ShowDocument(string fileName, byte[] fileContent, string ContentType)
        {
            clsSignature objSign = new clsSignature();
            string Ext = objSign.getFileExtention(ContentType);
            fileName = fileName + Ext;

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
        public ActionResult DeleteDoc(int id)
        {
            oDb = new DbFunctions();
            int rtrn = oDb.Delete(id);
            return RedirectToAction("DocumentLists");
        }
    }
}
