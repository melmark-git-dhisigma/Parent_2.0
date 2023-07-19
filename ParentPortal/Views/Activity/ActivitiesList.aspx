<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/ParentMaster.Master" Inherits="System.Web.Mvc.ViewPage<ParentPortal.Models.ActivityModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ActivitiesList
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        td {
            border: 1px solid lightgrey;
            border-collapse: collapse;
            border-spacing: 0;
            /*font-weight: 700;*/
            font-size: medium;
        }

        table {
            border-collapse: collapse;
            border-spacing: 0;
        }

        a:link {
            color: #434343;
            text-decoration: none;
        }

        a:visited {
            color: #434343;
        }

        a:hover {
            color: #0DD1D1;
            text-decoration: none;

        }

        a:active {
            color: #434343;
        }
        

        input[type='text'] {
            width: 100%;
        }

        
    </style>
    <script type="text/javascript">
        $(document).ready(function () {          
            SetColor($('#btnactivities'));
        });

    
        function downloadFn(id) {
            window.open('/Activity/DownloadDoc?id=' + id + '   ', '_blank');
        }
        function sign(id) {
            window.open('/Activity/SignDoc?id=' + id + '   ', '_self');
        }
       
           
    </script>
    <h4>&nbsp;&nbsp;&nbsp;&nbsp;Activities</h4>
    <div class="clear"></div>
    <%--<%using (@Ajax.BeginForm("ActivitiesList", "Activities", FormMethod.Post, new AjaxOptions { UpdateTargetId = "tblActivities" }, new { id = "divActivity", enctype = "multipart/form-data" }))
      { %>--%>
    <form>
        <table id="tblActivities" style="width: 95%; margin-left: 20px;" align="center">
            <tr>
                <td style="border: none; width: 20%;"><b><%=Html.TextBoxFor(search => search.Paging.SearchKeyword, new { style="width:90%;",id="btnSearch" })%></b></td>
                <td style="border: none; width: 10%;"><%using (Html.BeginForm("ActivitiesList", "Activity", FormMethod.Get))
                                                        { %>
                    
                    <input type="submit" value="Search" name="edit" />
                    <% } %></td>
                <td style="border: none; text-align: right; width: 10%;" colspan="2">Status </td>
                <td style="border: none; width: 10%;"><%=Html.DropDownListFor(model => model.Paging.FilterStatus, (IEnumerable<SelectListItem>)ViewBag.StatusLists, "--Select Status--",new { onchange="this.form.submit();",id="ddlFilter" }) %></td>
            </tr>
        </table>
    </form>
    <%--<table>
    <tr style="border-bottom: solid; border-bottom-color: lightgrey;">
            <td style="width: 40%;"><b>Activity Name</b></td>
            <td style="width: 20%;"><b>Date</b></td>
            <td style="width: 20%;"><b>Status</b></td>
            <td style="width: 10%;"><b>View</b></td>
            <td style="width: 10%;"><b>Sign</b></td>
        </tr>
        <%foreach (var Activity in Model.Activities)
          { %>
        <tr>
            <td><%=Activity.ActivityName %></td>
            <td><%if (Activity.Date != null)
                  { %><%=Activity.Date.Value.ToShortDateString() %><%} %></td>
            <td><%=Activity.Status %></td>
            <td></td>
            <td></td>
        </tr>
        <%} %>
        <tr>
            <td class="pager" colspan="3" style="border-top: medium solid lightgrey; text-align: center; border-right-color: white; background-color: #F2EEEE;">
                <% Html.RenderPartial("Pager", Model.Paging); %>
            </td>
            <td colspan="2" style="border-top: medium solid lightgrey; background-color: #F2EEEE;">
                <i style="float: right;">You are viewing page <%: Model.Paging.CurrentPageIndex %> of <%: Model.Paging.PageCount %>...</i>
            </td>
        </tr>
    </table>--%>
    <div id="displayArea">
        <% 
            Html.RenderPartial("ActivityPartial", Model); %>
    </div>

   

    </div>
    <%--<%} %>--%>
</asp:Content>
