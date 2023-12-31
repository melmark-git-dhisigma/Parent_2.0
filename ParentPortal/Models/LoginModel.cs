﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ParentPortal.Models
{
    public class LoginModel
    {
        public virtual ParentServiceReference.LoginDetails LoginInfo { get; set; }
        public virtual int ParentID { get; set; }    
        public virtual string UserName { get; set; }    
        public virtual string Password { get; set; }       
        public virtual bool? IsValid { get; set; }      
        public virtual string Message { get; set; }       
        public virtual string NewPassword { get; set; }        
        public virtual string ConfirmPassword { get; set; }

        public LoginModel()
        {
            LoginInfo = new ParentServiceReference.LoginDetails();
         
        }
    }
}