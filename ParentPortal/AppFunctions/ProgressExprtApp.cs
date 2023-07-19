using DocumentFormat.OpenXml;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Wordprocessing;
using Microsoft.Office.Interop.Word;
using System;
using System.Collections;
using System.Collections.Generic;
using System.IO.Packaging;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Xml;
using System.Web.Mvc;
using System.Net;
using System.Web.ClientServices;
using System.Text.RegularExpressions;
using ParentPortal.Models;
using ParentPortal.ParentServiceReference;
using ParentPortal.Classes;
namespace ParentPortal.AppFunctions
{
    public class ProgressExprtApp : System.Web.UI.Page
    {

        clsSession sess = null;
        static string[] columns;
        static string[] columnsCheck;
        static int checkCount = 0;
        static string[] placeHolders;

        public static string URLTOHTML(string Url)
        {
            string result = "";
            try
            {
                using (StreamReader reader = new StreamReader(Url))
                {
                    string line = "";
                    while ((line = reader.ReadLine()) != null)
                    {
                        result += line;
                    }
                }
            }
            catch (IOException ex)
            {
                throw ex;
            }
            return result;
        }

        public string ExportAll(clsSession sess)
        {

            sess = (clsSession)Session["UserSession"];
            string[] plcT, TextT;
            string Path = Server.MapPath("~\\Administration\\Temp\\IEP1.docx");
            string NewPath = CopyTemplate(Path, "0");
            Guid g = Guid.NewGuid();
            string ids = g.ToString();

            Thread thread = new Thread(new ThreadStart(WorkThreadFunction));
            string hPath = Server.MapPath("~\\Administration") + "\\IEPTemp2\\HTML" + ids + ".html";
            PageConvert(NewPath, hPath, WdSaveFormat.wdFormatHTML);
            System.Threading.Thread.Sleep(5000);
            thread.Abort();
            string Temp = Server.MapPath("~\\Administration") + "\\XMLProgressReport\\";
            string HtmlData = URLTOHTML(hPath);

            string[] filePaths = Directory.GetFiles(Temp);
            CreateQuery1("NE", "~\\Administration\\XMLProgressReport\\ProgressReport.xml", out plcT, out TextT, true, sess);
            HtmlData = replaceWithTexts(HtmlData, plcT, TextT);

            string htmlProgress = getHtmlStringProgress(sess);
            HtmlData = HtmlData.Replace("plcPRI", htmlProgress);


            HtmlData = HtmlData.Replace("’", "'");
            HtmlData = HtmlData.Replace("…", "...");
            HtmlData = HtmlData.Replace("‘", "'");
            HtmlData = HtmlData.Replace("·", "- ");
            HtmlData = HtmlData.Replace("“", "'");
            HtmlData = HtmlData.Replace("”", "'");
            HtmlData = HtmlData.Replace("�", "");
            HtmlData = HtmlData.Replace("<table>", "<table style='width:100%'>");
            HtmlData = HtmlData.Replace("<th>", "<th style='text-align:left;'>");
            HtmlData = HtmlData.Replace("MsoListParagraphCxSpFirst", "-");
            HtmlData = HtmlData.Replace("mso-list", "-");

            // ExportToWord(HtmlData, NewPath);

            //FileInfo f1 = new FileInfo(NewPath);
            //if (f1.Exists)
            //{
            //    f1.Delete();
            //}

            //f1 = new FileInfo(hPath);
            //if (f1.Exists)
            //{
            //    f1.Delete();
            //}
            //string path = Server.MapPath("~\\Administration") + "\\IEPTemp";
            //System.IO.DirectoryInfo downloadedMessageInfo = new DirectoryInfo(path);
            //foreach (FileInfo file in downloadedMessageInfo.GetFiles())
            //{
            //    file.Delete();
            //}
            //foreach (DirectoryInfo dir in downloadedMessageInfo.GetDirectories())
            //{
            //    dir.Delete(true);
            //}

            return HtmlData;
        }
        public void WorkThreadFunction()
        {
            try
            {

                Thread.Sleep(5000);
            }
            catch (Exception ex)
            {
                // log errors
            }
        }

        private string replaceWithTexts(string HtmlData, string[] plcT, string[] TextT)
        {
            int count = plcT.Count();

            for (int i = 0; i < count; i++)
            {
                if (TextT[i] != null)
                {
                    HtmlData = HtmlData.Replace(plcT[i], TextT[i]);
                }
                else
                {
                    HtmlData = HtmlData.Replace(plcT[i], "");
                }
            }
            return HtmlData;
        }

        private void ExportToWord(string htmlData, string NewPath)
        {
            try
            {
                // StringBuilder strBody = new StringBuilder();
                // strBody.Append(htmlData);
                // Context.Response.AppendHeader("Content-Type", "application/msword");
                // Context.Response.AppendHeader("Content-disposition", "attachment; filename=IEPDocument.doc");
                //Context.Response.Write(strBody);

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void PageConvert(string input, string output, WdSaveFormat format)
        {
            try
            {
                // Create an instance of Word.exe
                Microsoft.Office.Interop.Word._Application oWord = new Microsoft.Office.Interop.Word.Application();

                // Make this instance of word invisible (Can still see it in the taskmgr).
                oWord.Visible = false;

                // Interop requires objects.
                object oMissing = System.Reflection.Missing.Value;
                object isVisible = true;
                object readOnly = false;
                object oInput = input;
                object oOutput = output;
                object oFormat = format;
                object oFileShare = true;

                // Load a document into our instance of word.exe
                Microsoft.Office.Interop.Word._Document oDoc = oWord.Documents.Open(ref oInput, ref oMissing, ref readOnly, ref oMissing, ref oMissing, ref oMissing, ref oMissing, ref oMissing, ref oMissing, ref oMissing, ref oMissing, ref isVisible, ref oMissing, ref oMissing, ref oMissing, ref oMissing);

                // Make this document the active document.
                oDoc.Activate();

                // Save this document in Word 2003 format.
                oDoc.SaveAs(ref oOutput, ref oFormat, ref oMissing, ref oMissing, ref oMissing, ref oMissing, ref oMissing, ref oMissing, ref oMissing, ref oMissing, ref oMissing, ref oMissing, ref oMissing, ref oMissing, ref oMissing, ref oMissing);

                // Always close Word.exe.
                oWord.Quit(ref oMissing, ref oMissing, ref oMissing);

                //using (var fs = new FileStream(output, FileMode.Open, FileAccess.Read, FileShare.ReadWrite))
                //{
                //    fs.Close();
                //}
            }
            catch (IOException ex)
            {
                throw ex;
            }
        }

        private void CreateQuery1(string StateName, string Path, out string[] plcT, out string[] TextT, bool check, clsSession sess)
        {

            TextT = new string[0];
            plcT = new string[0];
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(Server.MapPath(Path));

            XmlNodeList xmlList = null;
            xmlList = xmlDoc.GetElementsByTagName("State");
            foreach (XmlNode st in xmlList)
            {
                if (st.Attributes["Name"].Value == StateName)
                {
                    XmlNodeList xmlListColumns = null;
                    xmlListColumns = st.ChildNodes.Item(0).ChildNodes;

                    int textCount = 0, chkCount = 0;

                    foreach (XmlNode stMs in xmlListColumns)
                    {
                        if (stMs.Attributes["PlaceHolder"].Value == "abcdefgh")
                        {
                            chkCount++;
                        }
                        else
                        {
                            textCount++;
                        }
                    }

                    TextT = new string[textCount];
                    plcT = new string[textCount];
                    columns = getColumns(textCount, sess);
                    int j = 0, k = 0, l = 0;

                    if (check == true)
                    {
                        foreach (XmlNode stMs in xmlListColumns)
                        {
                            TextT[k] = columns[l];
                            plcT[k] = stMs.Attributes["PlaceHolder"].Value.ToString().Trim();
                            k++;
                            l++;
                        }
                    }
                    columns = null;
                }

            }

        }
        private string CopyTemplate(string oldPath, string PageNo)
        {
            try
            {
                string Time = DateTime.Now.TimeOfDay.ToString();
                string[] ar = Time.Split('.');
                Time = ar[0];
                Time = Time.Replace(":", "-");
                string Datet = DateTime.Today.Day.ToString() + "-" + DateTime.Today.Month + "-" + DateTime.Today.Year.ToString() + "-" + Time;

                string path = Server.MapPath("~\\Administration") + "\\IEPTemp2";
                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                }

                Guid g;

                g = Guid.NewGuid();

                sess = (clsSession)Session["UserSession"];
                string newpath = path + "\\";
                string ids = g.ToString();
                ids = ids.Replace("-", "");

                string newFileName = "IEPTemporyTemplate" + ids.ToString();
                FileInfo f1 = new FileInfo(oldPath);


                if (f1.Exists)
                {
                    if (!Directory.Exists(newpath))
                    {
                        Directory.CreateDirectory(newpath);
                    }

                    f1.CopyTo(string.Format("{0}{1}{2}", newpath, newFileName, f1.Extension));
                }
                return newpath + newFileName + f1.Extension;
            }
            catch (Exception Ex)
            {
                return "";

            }


        }



        private string[] getColumns(int Count, clsSession sess)
        {
            string[] colum = new string[5];
            DbFunctions db = new DbFunctions();
            sess = (clsSession)Session["UserSession"];
            clsExport objExport = new clsExport();
            ProgressModel tempz = new ProgressModel();
            //clsExport tempz = objExport.CLientsReport1(sess);
            ParentServiceClient parentService = new ParentServiceClient();
            int SchoolID = parentService.GetSchoolId(Convert.ToInt32(Session["ParentID"]));
           int StudentID = parentService.GetStudentId(Convert.ToInt32(Session["ParentID"]));
          // clsExport tempz = new clsExport();
            tempz.ProgressInfo = parentService.CLientsReport(SchoolID, StudentID,0);


            ParentPortal.Models.ProgressDetails objProgress = new ParentPortal.Models.ProgressDetails();

           int  IEPId = tempz.ProgressInfo.stdtIEPId;
            objProgress.SclDistrictName = tempz.ProgressInfo.SclDistrictName;
            objProgress.DOB = tempz.ProgressInfo.DOB;
            objProgress.IEPDtFrom = tempz.ProgressInfo.IEPDtFrom;
            objProgress.IEPDtTo = tempz.ProgressInfo.IEPDtTo;
            objProgress.StudentName = tempz.ProgressInfo.StudentName;
            objProgress.SclDistrictAddress = tempz.ProgressInfo.SclDistrictAddress;
            objProgress.SclDistrictContact = tempz.ProgressInfo.SclDistrictContact;
            objProgress.SclDistrictName = tempz.ProgressInfo.SclDistrictName;
            objProgress.ID = tempz.ProgressInfo.ID;

            foreach (var GL in tempz.ProgressInfo.GoalDt)
            {
                ParentPortal.Models.GoalData Goal = new ParentPortal.Models.GoalData();
                ParentPortal.Models.GridListPlacement PlcacementList = new ParentPortal.Models.GridListPlacement();
                ParentPortal.Models.ReportInfo ReportInfoRptList = new ParentPortal.Models.ReportInfo();
                ParentPortal.Models.ReportDetails RDet = new ParentPortal.Models.ReportDetails();

                Goal.Goalid = GL.Goalid;
                Goal.GoalName = GL.GoalName;
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
                    if (RP.VisibleToParent == true)
                    {
                        ReportInfoRptList.rptid = RP.rptid;
                        ReportInfoRptList.rptdate = (DateTime)RP.rptdate;
                        ReportInfoRptList.rptinfo = RP.rptinfo;
                        ReportInfoRptList.goalid = RP.goalid;
                        ReportInfoRptList.stdtIEPId = RP.stdtIEPId;
                        Goal.RptList.Add(ReportInfoRptList);
                    }
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







           colum[0] = tempz.ProgressInfo.SclDistrictName;
            colum[1] = tempz.ProgressInfo.SclDistrictAddress;
            colum[2] = tempz.ProgressInfo.SclDistrictContact;
            colum[3] = tempz.ProgressInfo.IEPDtFrom.ToString("MM/dd/yyyy").Replace('-', '/');
            colum[4] = tempz.ProgressInfo.IEPDtTo.ToString("MM/dd/yyyy").Replace('-', '/');
            // colum[5] = tempz.StudentName.ToString();
            //  colum[6] = tempz.DOB.ToString();
            // colum[7] = tempz.ID.ToString();


            return colum;

        }

        public string getHtmlStringProgress(clsSession sess)
        {
            sess = (clsSession)Session["UserSession"];
            DbFunctions db = new DbFunctions();
            clsExport objExport = new clsExport();
            ProgressModel tempz = new ProgressModel();
            //clsExport tempz = objExport.CLientsReport1(sess);
            ParentServiceClient parentService = new ParentServiceClient();
            int SchoolID = parentService.GetSchoolId(Convert.ToInt32(Session["ParentID"]));
            int StudentID = parentService.GetStudentId(Convert.ToInt32(Session["ParentID"]));
           // clsExport tempz = new clsExport();
            tempz.ProgressInfo = parentService.CLientsReport(SchoolID, StudentID, 0);
            string HTML3 = "";
            int count = 0;
            foreach (var item in tempz.ProgressInfo.GoalDt)
            {
                int tmp = count;
                // count = 1;
                HTML3 += "<div id='divgrid' style='float: left; width: 100%'> <hr style='width: 100%; border: 15px solid;'/><br />" +
                    "<table id='tblDatedetails' style='width: 100%'><tr><td><h1 style='color: black'>Progress Report</h1></td>" +
                "<td>on IEP Dated: from " + tempz.ProgressInfo.IEPDtFrom.ToString("MM/dd/yyyy").Replace('-', '/') + "</td><td>to " + tempz.ProgressInfo.IEPDtTo.ToString("MM/dd/yyyy").Replace('-', '/') + "</td></tr></table><hr style='width:100%' border:'solid'/>" +
                 "<table id='tblStudentDetails' style='width: 100%'><tr><td class='tdLabel'>Student Name:" + tempz.ProgressInfo.StudentName + "</td>" +
                "<td class='tdLabel'>DOB:" + tempz.ProgressInfo.DOB.ToString("MM/dd/yyyy").Replace('-', '/') + "</td><td class='tdLabel'>ID #:" + tempz.ProgressInfo.ID + "</table>" +
                    "<div id='divInfo' style='width: 100%; height: 10%; background-color: black; color: white; font-size: 18px; text-align: center'>INFORMATION FROM CURRENT IEP</div>" +
                        "<table id='tblCurrentIEP' style='width: 100%; border: thick'><tr><td>Goal #:" + item.Goalid + "</td><td>Specific Goal Focus:" + item.LessonplanName + "</td></tr></table><hr  style='width:100%' border:'solid' />";
                foreach (var itemsub in item.PlcacementList)
                {
                    HTML3 += "<br />Current Performance Level:&nbsp; What can the student currently do?<br /><hr  style='width:100%' border:'solid' /><ul><li><b>" + itemsub.objective1 + "</b></li></ul><br /><hr  style='width:100%' border:'solid' />" +
                             "Measurable Annual Goal:What challenging, yet attainable, goal can we expect the student to meet by the end of this IEP period?<br />How will we know that the student has reached this goal?<br /><hr  style='width:100%' border:'solid' />" +
                             "<ul><li><b>" + itemsub.objective2 + "</b></li></ul><br /><hr  style='width:100%' border:'solid' />Benchmark/Objectives: What will the student need to do to complete this goal?<br /><hr  style='width:100%' border:'solid' />" +
                             "<ul><li><b>" + itemsub.objective3 + "</b></li></ul><br /><br />";
                }

                HTML3 += "<div id='PrgRptInfo' style='width: 100%; height: 10%; background-color: black; color: white; font-size: 18px; text-align: center'>PROGRESS REPORT INFORMATION</div><hr  style='width:100%' border:'solid' /></br>";
                int index = 0;
                int qu = 1;
                // if (item.RptList.Count > 0)
                //{


                foreach (var itemsub1 in item.RptList)
                {

                    HTML3 += "<table class='Ctable' id='tblinfo' style='width: 100%; border: thick'><tr><td>Progress Report Date:" + itemsub1.rptdate + "</td>" +
                "<td></td><td>Progress Report #" + qu + "of  4</td></tr><tr>" +
                "<td colspan='3'><hr  style='width:100%' border:'solid' />Progress Reports are required to be sent to parents at least as often as parents are informed of their non-disabled children’s progress. Each progress report must describe the student’s progress toward meeting each annual goal.<hr  style='width:100%' border:'solid' /></td>" +
            "</tr><tr><td colspan='3'>" + itemsub1.rptinfo + "</tr><hr  style='width:100%' border:'solid' /></table>";
                    index++; qu++;
                }



                //}
                // else
                //    {
                //        HTML3 +="<table class='Ctable' id='Table1' style='width: 100%; border: thick'><tr><td>Progress Report Date:"+item.+""+
                //    "</td><td></td><td>Progress Report # 1 of  4</td></tr><tr>"+
                //    "<td colspan='3'>Progress Reports are required to be sent to parents at least as often as parents are informed of their non-disabled children’s progress. Each progress report must describe the student’s progress toward meeting each annual goal.</td>"+
                //"</tr><tr><td colspan='3'>";
                //    }
            }

            HTML3 += "</td></tr></div></table>";
            return HTML3;
        }

    }
}

