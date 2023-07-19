using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ParentPortal.Models;
using ParentPortal.Classes;
using ParentPortal.ParentServiceReference;
using System.Configuration;
namespace ParentPortal.Controllers
{
    public class ActivityController : Controller
    {
        //
        // GET: /Activity/
        DbFunctions oDb = null;
        clsSession sess = null;
        ParentServiceClient parentService = new ParentServiceClient();
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult ActivitiesList(ActivityModel model, int page = 1, int pageSize = 5, string keywrd = "", string filter = "0")
        {
            oDb = new DbFunctions();
            if ((model.Paging.SearchKeyword == null) || (model.Paging.SearchKeyword == "")) { model.Paging.SearchKeyword = keywrd; }
            if ((model.Paging.FilterStatus == null) || (model.Paging.FilterStatus == "")) { model.Paging.FilterStatus = filter; }
            ViewBag.StatusLists = oDb.GetAllStatusForDDL("Visitation Status");
            model = oDb.GetActivitiesWithPaging(parentService.GetStudentId(Convert.ToInt32(Session["ParentID"])), page, pageSize, model.Paging.SearchKeyword.Trim(), model.Paging.FilterStatus.Trim());
            if (Session["Message"] == null)
                ViewBag.Message = "";
            else { ViewBag.Message = Session["Message"].ToString(); Session["Message"] = null; }
            if (Request.IsAjaxRequest())
            {
                return PartialView("ActivityPartial", model);
            }
            else
            {
                return View(model);
            }
        }
         [OutputCache(Location = System.Web.UI.OutputCacheLocation.None)]
        public ActionResult ActivityDetails(int Id = 0,string AType="")
        {


            ActivityList model = new ActivityList();
            sess = (clsSession)Session["UserSession"];
            string val = ConfigurationManager.AppSettings["School"];
            ViewBag.school = val;
            DbFunctions db = new DbFunctions();


            model.ActivityListInfo = parentService.GetActivitiesList(Id, AType);


            ParentPortal.Models.ActivityList objactivity = new ParentPortal.Models.ActivityList();


            objactivity.ActivityListInfo = model.ActivityListInfo;
            ViewBag.AType = AType;
            return View("ActivitiesView", objactivity);

        }
        public ActionResult SignDoc(int id)
        {
            int StudentId = 0, SchoolId = 0;
            //oDb = new DbFunctions();
            //Session["Message"] = oDb.SignDocument(1,id);
            ParentServiceClient parentService = new ParentServiceClient();

            if (Session["ParentID"] != null)
            {
                StudentId = parentService.GetStudentId(Convert.ToInt32(Session["ParentID"]));
                SchoolId = parentService.GetSchoolId(Convert.ToInt32(Session["ParentID"]));
            }
            clsSignature objSign = new clsSignature();

            objSign.SignDocument(StudentId, id, SchoolId, Convert.ToInt32(Session["ParentID"]));
            return RedirectToAction("ActivitiesList");
        }
        [OutputCache(Location = System.Web.UI.OutputCacheLocation.None)]
        public ActionResult DownloadDoc(int id)
        {
            string filePath = "";
            string result = "";
            oDb = new DbFunctions();
            int studentId=parentService.GetStudentId(Convert.ToInt32(Session["ParentID"]));
            result = parentService.DownloadDoc(id, studentId, "Visitation");

            string[] Filename = result.Split('/');
            filePath = Filename[Filename.Length - 1];
            if (result.Contains(".jpg") || result.Contains(".jpeg") || result.Contains(".png"))
                return File(result, System.Net.Mime.MediaTypeNames.Image.Jpeg);
            else if (result.Contains(".gif"))
            {
                return File(result, System.Net.Mime.MediaTypeNames.Image.Gif);
            }
            else if (result.Contains(".tiff"))
            {
                return File(result, System.Net.Mime.MediaTypeNames.Image.Tiff);
            }
            else if (result.Contains(".pdf"))
            {
                return File(result, System.Net.Mime.MediaTypeNames.Application.Pdf);
            }
            else if (result.Contains(".doc"))
            {
                return File(result, System.Net.Mime.MediaTypeNames.Application.Rtf, "Document.doc");

            }

            return File(result, Server.UrlEncode(result));


        }
    }
}
