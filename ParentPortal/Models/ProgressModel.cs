using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using ParentPortal.Models;

using ParentPortal.Classes;
using ParentPortal.ParentServiceReference;
using System.Data.Objects.SqlClient;
using System.Collections;

namespace ParentPortal.Models
{
    public class ProgressModel
    {
         public virtual ParentServiceReference.ProgressDetails ProgressInfo { get; set; }


         public ProgressModel()
        {
            ProgressInfo = new ParentServiceReference.ProgressDetails();
         
        }
    }
    //    public string SclDistrictName { get; set; }
    //    public string SclDistrictAddress { get; set; }
    //    public string SclDistrictContact { get; set; }
    //    public string StudentName { get; set; }
    //    public DateTime IEPDtFrom { get; set; }
    //    public DateTime IEPDtTo { get; set; }
    //    public DateTime DOB { get; set; }
    //    public int ID { get; set; }
    //    public int stdtIEPId { get; set; }
    //    public List<Goal> GoalData { get; set; }

    //    //  public static BiWeeklyRCPNewEntities biweekly;     
    //    public static ProgressModel CLientsReport()
    //    {
    //        //ParentDB RPCobj = new ParentDB();
    //        //BiWeeklyRCPNewEntities RPCobj = new BiWeeklyRCPNewEntities();
    //        BiWeeklyRCPNewEntities RPCobj = new BiWeeklyRCPNewEntities();
    //        //  BiweeklyStatu RPCobj = new BiweeklyStatu();
    //        DbFunctions oDb = new DbFunctions();
    //        IList<ProgressModel> retunmodel = new List<ProgressModel>();
    //        ProgressModel objProgress = new ProgressModel();

    //        // sess = (clsSession)HttpContext.Current.Session["UserSession"];

    //        //     ParentDB.StdtIEP objIEP = new ParentDB.StdtIEP();



    //        //  int asmtYr = RPCobj.AsmntYears.Where(objasmtyrs => objasmtyrs.CurrentInd == "A").Select(objasmtyrs => objasmtyrs.AsmntYearId).SingleOrDefault();

    //        int statusID = RPCobj.LookUps.Where(objlookup => objlookup.LookupType == "IEP Status" && objlookup.LookupName == "Approved").Select(objlookup => objlookup.LookupId).SingleOrDefault();
    //        //var test = RPCobj.StdtIEPs.ToList();
    //        //int studentid = 1;
    //        int studentid = oDb.GetStudentId(Convert.ToInt32(HttpContext.Current.Session["ParentID"]));
    //        int schlid = oDb.GetSchoolId(Convert.ToInt32(HttpContext.Current.Session["ParentID"]));
    //        try
    //        {
    //            var IEPList = (from objIeps in RPCobj.StdtIEPs
    //                           where (objIeps.StatusId == statusID && objIeps.StudentId == studentid && objIeps.SchoolId == schlid)
    //                           select new
    //                           {
    //                               iepIds = objIeps.StdtIEPId,
    //                               startdt = objIeps.EffStartDate,
    //                               enddt = objIeps.EffEndDate

    //                           }).ToList().First();



    //            string id = IEPList.iepIds.ToString();

    //            int iepID = Convert.ToInt32(id);
    //            //  sess.IEPId = iepID;
    //            //var iepdate = (from objiep in RPCobj.StdtIEPs
    //            //               where (objiep.StdtIEPId == iepID)
    //            //               select new
    //            //               {
    //            //                   startdt = objiep.EffStartDate,
    //            //                   enddt = objiep.EffEndDate

    //            //               }).ToList().First();

    //            var tempresult = RPCobj.StdtGoals.Where(objgoal => objgoal.StdtIEPId == iepID).Select(objgoal => objgoal.GoalId).ToList();

    //            foreach (var item in tempresult)
    //            {

    //                int temp = int.Parse(item.ToString());

    //                var singleData = (from objlesson in RPCobj.StdtLessonPlans
    //                                  join objL in RPCobj.LessonPlans on objlesson.LessonPlanId equals objL.LessonPlanId
    //                                  where (objlesson.GoalId == temp && objlesson.StudentId == studentid && objlesson.SchoolId == schlid)
    //                                  select new GridListPlacement
    //                                  {
    //                                      objective1 = objlesson.Objective1,
    //                                      objective2 = objlesson.Objective2,
    //                                      objective3 = objlesson.Objective3,
    //                                      LessonPlanId = objL.LessonPlanId,
    //                                      LessonName = objL.LessonPlanName

    //                                  }).Distinct().ToList();

    //                var rptdata = RPCobj.Progress_Report.Where(objrpt => objrpt.GoalId == item && objrpt.StdtIEPId == iepID).ToList();

    //                // var rptdata=(from objrpt in RPCobj.Progress_Report

    //                var goalname = RPCobj.Goals.Where(obgoal => obgoal.GoalId == temp).Select(objgoal => objgoal.GoalName).First();
    //                //var lsnplanid = RPCobj.StdtLessonPlans.Where(objlsn => objlsn.StudentId == studentid && objlsn.GoalId == temp).Select(objlsn => objlsn.LessonPlanId).First();
    //                string lsnplanName = "";// = RPCobj.LessonPlans.Where(objlsn => objlsn.LessonPlanId == lsnplanid).Select(objlsn => objlsn.LessonPlanName).First();

    //                foreach (var Items in singleData)
    //                {
    //                    lsnplanName = Items.LessonName;
    //                }


    //                Goal obj = new Goal
    //                {
    //                    GoalID = temp,
    //                    GoalName = goalname,
    //                    LessonplanName = lsnplanName,
    //                    PlcacementList = singleData,
    //                    // RptList = rptdata,
    //                };
    //                obj.RptList = (from x in rptdata
    //                               select new ReportInfo
    //                               {
    //                                   rptid = x.Report_Id,
    //                                   rptdate = x.Report_Date,
    //                                   rptinfo = x.Report_Info,
    //                                   goalid = x.GoalId
    //                               }).ToList();
    //                objProgress.GoalData.Add(obj);

    //            }

    //            var student = (from studs in RPCobj.Students
    //                           join schools in RPCobj.Schools on studs.SchoolId equals schools.SchoolId
    //                           where (studs.StudentId == studentid)
    //                           select new
    //                           {
    //                               studid = studs.StudentId,
    //                               studfname = studs.StudentFname,
    //                               studlname = studs.StudentLname,
    //                               studdob = studs.DOB,
    //                               schooladdid = schools.AddressId,
    //                               schoolname = schools.SchoolName,
    //                               schoolcnt = schools.DistContact,
    //                               schoolph = schools.DistPhone,
    //                           }).ToList().First();

    //            objProgress.DOB = Convert.ToDateTime(student.studdob);
    //            objProgress.StudentName = student.studlname + "," + student.studfname;
    //            objProgress.ID = Convert.ToInt32(student.studid);
    //            objProgress.IEPDtFrom = Convert.ToDateTime(IEPList.startdt);
    //            objProgress.IEPDtTo = Convert.ToDateTime(IEPList.enddt);

    //            objProgress.stdtIEPId = iepID;

    //            var schooladdr = (from objaddr in RPCobj.Addresses
    //                              join schools in RPCobj.Schools on objaddr.AddressId equals schools.AddressId
    //                              where (objaddr.AddressId == schools.AddressId)
    //                              select new
    //                              {
    //                                  addln1 = objaddr.AddressLine1,
    //                                  addln2 = objaddr.AddressLine2,
    //                                  addcity = objaddr.City,
    //                                  addstate = objaddr.State,
    //                                  zip = objaddr.Zip,


    //                              }).ToList().First();

    //            objProgress.SclDistrictName = student.schoolname;
    //            objProgress.SclDistrictAddress = schooladdr.addln1 + "," + schooladdr.addln2 + "," + schooladdr.addcity + "," + schooladdr.addstate + "," + schooladdr.zip;
    //            objProgress.SclDistrictContact = student.schoolcnt + "/" + student.schoolph;
    //        }
    //        catch { }

    //        return objProgress;
    //    }

    //    public ProgressModel()
    //    {
    //        GoalData = new List<Goal>();
    //    }
    //    public string student { get; set; }
    //    public string schooladdr { get; set; }
    //}

    //public class Goal
    //{
    //    public string GoalName { get; set; }
    //    public string LessonplanName { get; set; }
    //    public int GoalID { get; set; }
    //    public virtual IList<GridListPlacement> PlcacementList { get; set; }
    //    public List<ReportInfo> RptList { get; set; }
    //    public Goal()
    //    {
    //        PlcacementList = new List<GridListPlacement>();
    //        RptList = new List<ReportInfo>();

    //    }
    //}

    //public class ReportInfo
    //{
    //    public int rptid { get; set; }
    //    public DateTime rptdate { get; set; }
    //    public string rptinfo { get; set; }
    //    public int goalid { get; set; }
    //    public int stdtIEPId { get; set; }
    //}

    //public class GridListPlacement
    //{
    //    public virtual string objective1 { get; set; }
    //    public virtual string objective2 { get; set; }
    //    public virtual string objective3 { get; set; }
    //    public virtual string LessonName { get; set; }
    //    public virtual int LessonPlanId { get; set; }

    //}


}
















