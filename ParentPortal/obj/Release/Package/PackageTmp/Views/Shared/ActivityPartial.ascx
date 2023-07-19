<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ParentPortal.Models.ActivityModel>" %>

<script type="text/javascript">

    function showActivitiesList(ActivityId,Type) {

        $('#dvActivities').load('../Activity/ActivityDetails?Id=' + ActivityId + '&AType=' + Type + '');

        $('#divActivity').show();

      
    }

    
    function hideActivitiesList() {
        $('#divActivity').hide();
    }
</script>
<style>

     
     .styleA {
            float:right;
            background: none repeat scroll 0 0 #0D668E;
            border: medium none;
            border-radius: 3px;
            color: #FFFFFF;
            cursor: pointer;
            font-size: 10px;
            font-weight: normal;
            margin: 5px 15px 0 0!important;
            padding: 3px 6px;
            text-align: center;
            text-decoration: none;
            width: 50px;
            height:15px;
        }

     .popUpStyle {
        background: url("../Images/smlmelmark.JPG") no-repeat scroll 10px 5px #F8F7FC;
        border: 5px solid #B2CCCA;
        display: none;
        font-family: Arial;
        font-size: 12px;
        height: 350px;
        left: 32%;
        padding: 5px;
        position: absolute;
        top: 35%;
        width: 450px;
        z-index: 200;
    }
</style>
<table id="tblActivities" style="width: 100%; margin-left: 20px;" align="center">

    <tr style="border-bottom: solid; border-bottom-color: lightgrey;">
        <td style="width: 30%;"><b>Activity Name</b></td>
        <td style="width: 30%;"><b>Activity Type</b></td>
        <td style="width: 20%;"><b>Date</b></td>
        <td style="width: 20%;"><b>Status</b></td>
        <td style="width: 15%;"><b>View</b></td>
      
    </tr>
    <%foreach (var Activity in Model.ActivityInfo)
      { %>
    <tr>
        <td><%=Activity.ActivityName %></td>
         <td><%=Activity.ActivityType%></td>
        <td><%if (Activity.Date != null)
              { %><%=Activity.Date.Value.ToShortDateString() %><%} %></td>
        <td><%if (Activity.ActivityType !="Placement")
              { %><%=Activity.Status %><%} %></td>
        <td align="center">
            <img id="<%=Activity.ActivityId %>" style="cursor:pointer;width:25px;float:left;" src="../../Documents/Images/ViewAll.png" onclick="showActivitiesList(this.id,'<%=Activity.ActivityType%>');" /></td>

        
    </tr>
    <%} %>
    <tr>
        <td class="pager" colspan="2" style="border-top: medium solid lightgrey; text-align: center; border-right-color: white; background-color: #F2EEEE;">
            <% Html.RenderPartial("Pager", Model.Paging); %>
        </td>
        <td colspan="3" style="border-top: medium solid lightgrey; background-color: #F2EEEE;">
            <i style="float: right;">You are viewing page <%: Model.Paging.CurrentPageIndex %> of <%: Model.Paging.PageCount %>...</i>
        </td>
    </tr>
    <tr>
        <td colspan="5"><%=ViewBag.Message %></td>
    </tr>
</table>
 <div id="divActivity" class="popUpStyle" style="width: 46%; height: 20%; left: 21%; top: 15%;overflow-y:auto;overflow-x:hidden">
        <a id="close_x" onclick="hideActivitiesList()" class="close sprited1" href="#" style="">
            <img src="../../Documents/images/button_red_close.png" height="18" width="18" alt="" style="float: right; margin-right: 2px; margin-top:2px; z-index: 300" /></a>

        
   <span> Activity Details</span>
        <hr />
      <div id="dvActivities" >


</div>

       