using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ParentPortal.Models;

using ParentPortal.Classes;
using ParentPortal.ParentServiceReference;
using System.Text;
using System.IO;
using ParentPortal.AppFunctions;

namespace ParentPortal.Controllers
{
    public class ProgressController : Controller
    {
        //
        // GET: /Progress/

        clsSession sess = null;
        ProgressExprtApp objExprt = new ProgressExprtApp();
        ParentServiceClient parentService = new ParentServiceClient();
        public ActionResult Index()
        {
            return View();
        }

        [OutputCache(Location = System.Web.UI.OutputCacheLocation.None)]
        public ActionResult ProgressGrid(ParentPortal.Models.ProgressGrid mdl)
        {
            ProgressModel model = new ProgressModel();
            sess = (clsSession)Session["UserSession"];
            DbFunctions db = new DbFunctions();
            int SchoolID, StudentID, iepID;
            int parentId = Convert.ToInt32(Session["ParentID"]);
            SchoolID = parentService.GetSchoolId(parentId);
            StudentID = parentService.GetStudentId(parentId);

            mdl.ProgressReports = parentService.GetProgressReport(StudentID, SchoolID);
            return View("ProgressView", mdl);
        }

        [OutputCache(Location = System.Web.UI.OutputCacheLocation.None)]
        public ActionResult ReportData(string Vals)
        {


            ProgressModel model = new ProgressModel();


            DbFunctions db = new DbFunctions();
            int IEPId = 0;
            string Status = "";
            sess = (clsSession)Session["UserSession"];
            //close_x-undefined
            if (Vals != null && Vals.Length > 2)
            {
                string[] ar = Vals.Split('-');
                if (ar.Count() > 0)
                {
                    if (ar[0] != "close_x")
                    {
                        IEPId = Convert.ToInt16(ar[0]);
                        Status = Convert.ToString(ar[1]);
                    }
                }
            }
            int SchoolID, StudentID;
            SchoolID = parentService.GetSchoolId(Convert.ToInt32(Session["ParentID"]));
            StudentID = parentService.GetStudentId(Convert.ToInt32(Session["ParentID"]));
            model.ProgressInfo = parentService.CLientsReport(SchoolID, StudentID, IEPId);


            ParentPortal.Models.ProgressDetails objProgress = new ParentPortal.Models.ProgressDetails();

            IEPId = model.ProgressInfo.stdtIEPId;
            objProgress.SclDistrictName = model.ProgressInfo.SclDistrictName;
            objProgress.DOB = model.ProgressInfo.DOB;
            objProgress.IEPDtFrom = model.ProgressInfo.IEPDtFrom;
            objProgress.IEPDtTo = model.ProgressInfo.IEPDtTo;
            objProgress.StudentName = model.ProgressInfo.StudentName;
            objProgress.SclDistrictAddress = model.ProgressInfo.SclDistrictAddress;
            objProgress.SclDistrictContact = model.ProgressInfo.SclDistrictContact;
            objProgress.SclDistrictName = model.ProgressInfo.SclDistrictName;
            objProgress.ID = model.ProgressInfo.ID;
            objProgress.Status = Status;
            foreach (var GL in model.ProgressInfo.GoalDt)
            {
                ParentPortal.Models.GoalData Goal = new ParentPortal.Models.GoalData();
                ParentPortal.Models.GridListPlacement PlcacementList = new ParentPortal.Models.GridListPlacement();
                ParentPortal.Models.ReportInfo ReportInfoRptList = new ParentPortal.Models.ReportInfo();
                ParentPortal.Models.ReportDetails RDet = new ParentPortal.Models.ReportDetails();

                Goal.Goalid = GL.Goalid;
                Goal.GoalName = GL.GoalName;
                Goal.GoalNo = GL.GoalNo;
                Goal.LessonplanName = GL.LessonplanName;

                foreach (var PL in GL.PlcacementList)
                {
                    PlcacementList.objective1 = PL.objective1;
                    PlcacementList.objective2 = PL.objective2;
                    PlcacementList.objective3 = PL.objective3;


                }
                Goal.PlcacementList.Add(PlcacementList);
                foreach (var RP in GL.RptList)
                {
                    ReportInfoRptList = new ParentPortal.Models.ReportInfo();
                    ReportInfoRptList.rptid = RP.rptid;
                    ReportInfoRptList.rptdate = (DateTime)RP.rptdate;
                    ReportInfoRptList.rptinfo = RP.rptinfo;
                    ReportInfoRptList.goalid = RP.goalid;
                    ReportInfoRptList.stdtIEPId = RP.stdtIEPId;
                    ReportInfoRptList.VisibleToParent = RP.VisibleToParent;
                    Goal.RptList.Add(ReportInfoRptList);
                }
                foreach (var RP in GL.ProgressInfo)
                {
                    RDet.iepid = RP.iepid;
                    RDet.rptdate = RP.rptdate;
                    RDet.startdate = RP.startdate;
                    RDet.enddate = RP.enddate;
                    RDet.Status = RP.Status;
                    Goal.ReportDetails.Add(RDet);
                }


                objProgress.GoalDt.Add(Goal);

            }







            //modelPro.pr = objProgress;


            return View(objProgress);

        }

        public ActionResult ExportAllData(ProgressModel model)
        {
            sess = (clsSession)Session["UserSession"];
            string result = "";
            result = objExprt.ExportAll(sess);
            var byteArray = Encoding.UTF8.GetBytes(result);
            var stream = new MemoryStream(byteArray);
            //StringBuilder strBody = new StringBuilder();
            //strBody.Append(result);
            //HttpContext.Response.AppendHeader("Content-Type", "application/msword");
            //HttpContext.Response.AppendHeader("Content-disposition", "attachment; filename=IEPDocument.doc");
            //HttpContext.Response.Write(strBody);


            return File(stream, "application/msword", "ProgressReport.doc");

        }

    }
}
