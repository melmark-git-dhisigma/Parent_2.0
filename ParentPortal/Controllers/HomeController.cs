using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ParentPortal.Models;
using System.Web.Configuration;
using ParentPortal.Classes;
using ParentPortal.ParentServiceReference;
using System.Configuration;
using Facesheet;
using FacesheetPA;
using System.Text;
using System.IO;


namespace ParentPortal.Controllers
{

    public class HomeController : Controller
    {
        //
        // GET: /Home/
        clsSession sess = null;

        FacesheetClass objFacesheet = null;
        FacesheetClassPA objFaceSheetPA = null;

        ParentServiceClient parentService = new ParentServiceClient();
        public ActionResult Index()
        {
            //Facesheet.FacesheetClass t = new Facesheet.FacesheetClass();
           
                    return View();
               
        }
        public ActionResult HomePage(HomeModel model)
        {
           
                    DbFunctions oDb = new DbFunctions();
                    string PageName = "";
                    int StudentId = parentService.GetStudentId(Convert.ToInt32(Session["ParentID"]));
                    int schoolId = parentService.GetSchoolId(Convert.ToInt32(Session["ParentID"]));
                    string imageUrl = parentService.GetImageUrl(StudentId);
                    Session["Studentid"] = StudentId;
                    Session["SchoolId"] = schoolId;
                    string schollType = "";
                    if (schoolId == 2)
                    {
                        schollType = "PA";
                    }
                    if (schoolId == 1)
                    {
                        schollType = "NE";
                    }
                    if (StudentId > 0)
                    {

                        model.Imageurl = imageUrl;

                        if (schollType == "NE")
                        {
                            model.parentInfo = parentService.GetParentDetails(StudentId);
                            PageName = "HomePage";
                        }
                        if (schollType == "PA")
                        {
                            model.parentInfoPA = parentService.GetParentDetailsPA(StudentId);
                            try
                            {
                                int id = (int)model.parentInfoPA.Country;
                                ViewBag.Country = parentService.getCountry(id);
                                id = (int)model.parentInfoPA.State;
                                ViewBag.State = parentService.getState(id);
                                id = (int)model.parentInfoPA.PrimaryCntct.State;
                                ViewBag.PrcontactState = parentService.getState(id);
                            }
                            catch (Exception ex)
                            {
                            }
                            PageName = "HomePageForPA";
                            //return RedirectToAction("PaPage", "Home");

                        }

                    }
                    if (Session["UserName"] != null)
                    {
                        return View(PageName, model);
                    }
                    else { return RedirectToAction("Login","Login"); }
               


        }
        //public ActionResult PaPage(HomeModel model)
        //{
        //    DbFunctions oDb = new DbFunctions();
        //    string PageName = "";
        //    int StudentId = oDb.GetStudentId(Convert.ToInt32(Session["ParentID"]));
        //    int schoolId = oDb.GetSchoolId(StudentId);
        //    model.parentInfoPA = parentService.GetParentDetailsPA(StudentId);

        //    return View();
        //}
        public ActionResult btnExport(HomeModel model)
        {
            ClsErrorLog error = new ClsErrorLog();
            byte[] byteArray = null;
            MemoryStream stream = null;

            // E:/Master Page_Design/Paarent Portal/ParentPortal/TemplateAndXml//Temp/IEPTemporyTemplate0038fcecb6d647be9c12735a9a1bdc5c.docx

            int parentId = Convert.ToInt32(Session["ParentID"]);

            int schoolId = Convert.ToInt32(Session["SchoolId"]);
            int studentId = Convert.ToInt32(Session["Studentid"]);

            string[] args = new string[6];

            string dirpath = "";
            if (schoolId == 2)
            {
                dirpath = (AppDomain.CurrentDomain.BaseDirectory + "TemplateAndXmlPA".ToString()).Replace('\\', '/');
            }
            if (schoolId == 1)
            {
                dirpath = (AppDomain.CurrentDomain.BaseDirectory + "TemplateAndXml".ToString()).Replace('\\', '/');
            }

            string connection = "";

            //if (schoolId == 1)
            //{
            //    connection = "Data Source=M2CWS001;Initial Catalog=MelmarkNE;User ID=sa;Password=sqladmin";
            //}
            //else if (schoolId == 2)
            //{
            //    connection = "Data Source=M2CWS001;Initial Catalog=MelmarkPA;User ID=sa;Password=sqladmin";
            //}


            //if (schoolId == 1)
            //{
            //    connection = "Data Source=sqltest;Initial Catalog=MelmarkNE;User ID=sa;Password=sqltest";
            //}
            //else if (schoolId == 2)
            //{
            //    connection = "Data Source=sqltest;Initial Catalog=MelmarkPA;User ID=sa;Password=sqltest";
            //}
            connection = WebConfigurationManager.AppSettings["connection"].ToString();

            error.WriteToLog("Connection : " + connection);


            string FileLocation = dirpath;
            string path = FileLocation + "/Temp";
            error.WriteToLog("FileLocation : " + FileLocation);
            error.WriteToLog("path : " + path);
            string HtmlData = "";
            string newPath = "";
            string strBody = string.Empty;

            if (schoolId == 2)
            {
                try
                {
                    args[0] = "PA";
                    args[1] = connection;
                    args[2] = FileLocation;
                    args[3] = studentId.ToString();
                    args[4] = schoolId.ToString();
                    args[5] = parentId.ToString();
                    
                    objFaceSheetPA = new FacesheetClassPA();
                    HtmlData = objFaceSheetPA.Main(args);
                    newPath = objFaceSheetPA.getNewFilePath();
                    error.WriteToLog("newPath : " + newPath);
                }
                catch
                {

                }
            }
            if (schoolId == 1)
            {
                try
                {
                    args[0] = "NE";
                    args[1] = connection;
                    args[2] = FileLocation;
                    args[3] = studentId.ToString();
                    args[4] = schoolId.ToString();
                    args[5] = parentId.ToString();
                  
                    objFacesheet = new FacesheetClass();
                    HtmlData = objFacesheet.Main(args);
                    newPath = objFacesheet.getNewFilePath();
                    error.WriteToLog("newPath : " + newPath);
                }
                catch
                {

                }
            }
            

            strBody = strBody + "<!--[if gte mso 9]>" +
            "<xml>" +
            "<w:WordDocument>" +
            "<w:View>Print</w:View>" +
            "<w:Zoom>100</w:Zoom>" +
            "</w:WordDocument>" +
            "</xml>" +
            "<![endif]-->";

            HtmlData = HtmlData.Replace("<head>", strBody);


            HtmlData = HtmlData.Replace("’", "'");
            HtmlData = HtmlData.Replace("…", "...");
            HtmlData = HtmlData.Replace("‘", "'");
            HtmlData = HtmlData.Replace("·", "- ");
            HtmlData = HtmlData.Replace("“", "'");
            HtmlData = HtmlData.Replace("”", "'");
            HtmlData = HtmlData.Replace("�", "-");
            byteArray = Encoding.UTF8.GetBytes(HtmlData);
            stream = new MemoryStream(byteArray);
            return File(stream, "application/msword", "Facesheet.doc");
        }


    }
}
