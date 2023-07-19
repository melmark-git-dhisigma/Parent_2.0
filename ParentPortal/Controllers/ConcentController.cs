using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ParentPortal.Classes;
using ParentPortal.Models;

using ParentPortal.ParentServiceReference;

namespace ParentPortal.Controllers
{
    public class ConcentController : Controller
    {
        //
        // GET: /Concent/
        DbFunctions oDb = null;
        ParentServiceClient parentService = new ParentServiceClient();
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult ConcentList(ConcentModel model, int page = 1, int pageSize = 5, string keywrd = "", string filter = "0")
        {
            oDb = new DbFunctions();
            if ((model.Paging.SearchKeyword == null) || (model.Paging.SearchKeyword == "")) { model.Paging.SearchKeyword = keywrd; }
            if ((model.Paging.FilterStatus == null) || (model.Paging.FilterStatus == "")) 
            { 

                model.Paging.FilterStatus = filter; 
            }

            //ViewBag.StatusLists = oDb.GetAllStatusForDDL("Document Type");
            model = oDb.GetConcentList(parentService.GetStudentId(Convert.ToInt32(Session["ParentID"])), parentService.GetSchoolId(Convert.ToInt32(Session["ParentID"])), page, pageSize, model.Paging.SearchKeyword.Trim(), model.Paging.FilterStatus.Trim());
            if (Request.IsAjaxRequest())
            {
                return PartialView("ConcentPartial", model);
            }
            else
            {
                return View(model);
            }
        }
        public ActionResult SignDoc(int id)
        {
            oDb = new DbFunctions();
            oDb.SignDocument(1, id);
            return RedirectToAction("ConcentList");
        }
        [OutputCache(Location = System.Web.UI.OutputCacheLocation.None)]
        public ActionResult DownloadDoc(int id)
        {

            int StudentId = 0, SchoolId = 0;
            oDb = new DbFunctions();
          
            ParentServiceClient parentService = new ParentServiceClient();

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

            return RedirectToAction("ConcentList");


        }
        private void ShowDocument(string fileName, byte[] fileContent, string ContentType)
        {
            clsSignature objSign = new clsSignature();
            string Ext = objSign.getFileExtention(ContentType);
            fileName=fileName+Ext;

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
