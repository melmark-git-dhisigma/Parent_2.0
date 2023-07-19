<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ParentPortal.Models.PagerModel>" %>

<%
   if ((bool)ViewData["Inactive"])
   {
      Response.Write(string.Format("<span class=\"{0}\">{1}</span>", "pagerButtonDisabled", ViewData["Text"]));
   }
   else
   {
       var routeData = new RouteValueDictionary { { "page", ViewData["PageIndex"].ToString() }, { "pageSize", Model.PageSize } };
      var htmlAttributes = new Dictionary<string, object>();
      if ((bool)ViewData["Selected"])
         htmlAttributes.Add("class", "pagerButtonCurrentPage");
      else
         htmlAttributes.Add("class", "pagerButton");

      htmlAttributes.Add("onclick", "setFilter(this);");
      Response.Write(
         Ajax.ActionLink(
               ViewData["Text"].ToString(),                                // Link Text
               Html.ViewContext.RouteData.Values["action"].ToString(),     // Action
               Html.ViewContext.RouteData.Values["controller"].ToString(), // Controller
               routeData, new AjaxOptions { UpdateTargetId = "displayArea" },                                                 // Route data
               htmlAttributes                                              // HTML attributes to apply to hyperlink
            ).ToHtmlString()
      );
   }
%>

