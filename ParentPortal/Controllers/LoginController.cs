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
    public class LoginController : Controller
    {
        //
        // GET: /Login/
        DbFunctions oDb = null;
        ParentServiceClient parentService = new ParentServiceClient();
        public ActionResult Index(LoginModel model = null)
        {
            return View("Login");
        }

        public ActionResult Login(ParentPortal.Models.LoginModel model)
        {
            string val = ConfigurationManager.AppSettings["School"];
            if (val == "NE")
            {
                ViewBag.title = "Melmark New England";
                Session["title"] = "Melmark New England";
            }
            else
            {
                ViewBag.title = "Melmark Pennsylvania";
                Session["title"] = "Melmark Pennsylvania";
            }

            if (model.UserName != null && model.Password != null)
            {
                
                oDb = new DbFunctions();
                model.LoginInfo.UserName = model.UserName;
                model.LoginInfo.Password = model.Password;
                Session["UserName"] = model.UserName;
                ViewBag.uname = model.UserName;
                int ParentId = parentService.Login(model.LoginInfo);
                if (ParentId == 0)
                {
                    model.IsValid = false; model.Message = "Invalid Username or Password";
                    return View(model);
                }
                else
                {
                    Session["ParentID"] = ParentId;
                    return RedirectToAction("HomePage", "Home");

                }
            }

            Session["UserSession"] = null;
            Session.RemoveAll();
            Session.Abandon();
            return View(model);


        }
        public ActionResult ChangePasswrd(ParentPortal.Models.LoginModel model)
        {
            if (model.NewPassword != null && model.Password != null && model.ConfirmPassword != null)
            {
                oDb = new DbFunctions();
                int parentId = Convert.ToInt32(Session["ParentID"]);
                model.LoginInfo.Password = model.Password;
                model.LoginInfo.NewPassword = model.NewPassword;
                int result = parentService.ChangePassword(model.LoginInfo, parentId);
                if (result == -1) { model.Message = "Incorrect Password"; }
                else if (result > 0) { model.Message = "Password successfully changed"; }
                else { model.Message = "Failed"; }
            }

            return View(model);
        }
        public ActionResult ForgetPassword(LoginModel model)
        {
            return View();
        }

    }
}
