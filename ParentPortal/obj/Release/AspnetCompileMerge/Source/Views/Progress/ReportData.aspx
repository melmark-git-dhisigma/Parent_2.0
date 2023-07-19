<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/ParentMaster.Master" Inherits="System.Web.Mvc.ViewPage<ParentPortal.Models.ProgressDetails>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ReportData
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">





<style type="text/css">
    input.ExportWord,
    input.ExportWord:link,
    input.ExportWord:visited {
        width: 43px;
        height: 43px;
        display: block;
        background: url(../images/ExportWord.png) left top no-repeat;
        float: left;
        margin: 0 15px 0 0;
        border: none;
        cursor: pointer;
    }

        input.ExportWord:hover {
            background-position: 0 -45px;
        }

    .Heading {
        font-family: Arial;
        margin-bottom: 5px;
        width: 100%;
        height: 27px;
        font-size: 18px;
        padding-top: 10px;
        color: black;
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

    .styleA {
        float: right;
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
        height: 15px;
    }

    .clear {
        margin: 0;
        padding: 0;
        border: 0;
        clear: both;
    }
</style>
<link href="../../Documents/CSS/jquery-ui.css" rel="stylesheet" />
<link href="../../Documents/CSS/jquery-ui-1.10.3.custom.css" rel="stylesheet" />
<link href="../../Documents/CSS/General.css" rel="stylesheet" />
<script src="../../Documents/JS/jquery-1.8.2.js"></script>
<script src="../../Documents/JS/jquery-ui-1.8.24.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        SetColor($('#btnrpt'));
    });

    $(document).ready(function () {
        $(".datepicker").datepicker({
            changeMonth: true,
            changeYear: true,
            showAnim: "fadeIn",
            yearRange: 'c-30:c+30',
            maxDate: new Date,


            /* fix buggy IE focus functionality */
            fixFocusIE: true,

            /* blur needed to correctly handle placeholder text */
            onSelect: function (dateText, inst) {
                this.fixFocusIE = true;
                $(this).blur().change().focus();
                $(this).blur().change().focus();



            },
            onClose: function (dateText, inst) {
                this.fixFocusIE = true;
                this.focus();
            },
            beforeShow: function (input, inst) {
                var result = $.browser.msie ? !this.fixFocusIE : true;
                this.fixFocusIE = false;
                return result;
            }
        }).attr('readonly', 'true');
    });


</script>
<script type="text/javascript">
    //    var clicks = 0;

    function ExportTemplate() {
        $('#content').load('/Progress/ExportAllData/');

    }
    function ProgressReport() {
      //  alert('Click')

        $('#dvProgressReport').load('/Progress/ProgressGrid/');
        $('#divProgress').show();

    }
    function showProgress(IEPId) {
        $('#divProgress').hide();
        $.get("/Progress/ProgressRpt/?Id=" + IEPId + '-' + Status, function (data) {
          
        });
    }
    $(document).ready(function () {
        function ExportTemplate() {

            $.ajax({
                url: "/Progress/ExportAllData",
                type: 'POST',
                dataType: 'json',
                data: null,
                contentType: 'application/json; charset=utf-8',
                success: function (msg) {
                    window.alert("Okay");

                },
                error: handleError


            });
        }

    });
</script>
<%

    //<%using (Ajax.BeginForm("saveReport", "Progress", FormMethod.Post, new AjaxOptions { UpdateTargetId = "" }))
    { %>

 
    <div class="Heading">Progress Report -<%=Model.StudentName %> </div>
    <div style="padding:0;border:1px solid #000;min-height:200px; height:auto !important; padding:5px;" >
    <div id="partialMainArea" style="border:1px solid #ccc;">
    <%if (Model.ID > 0)
      { %>

    <div>
    <div id="Sample" style="float: left; width: 100%">


        <table id="tblSchooldetails" style="width: 100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td class="tdLabel">School District Name:</td>
                <td colspan="2"><%=Model.SclDistrictName %></td>
                
                    <td><a href="/Progress/ExportAllData/" class="styleA" target="_blank">Export</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;             
                     <input id="Button1"   class="styleA"  type="button" value="Progress List" onclick="ProgressReport()" style="width:100px;height:25px;visibility:visible;" />
                </td>
            </tr>
            <tr>
                <td class="tdLabel">School District Address:</td>
                <td colspan="2"><%=Model.SclDistrictAddress %></td>
                 <td></td>
            </tr>
            <tr>
                <td class="tdLabel">School District Contact Person/Phone #:</td>
                <td colspan="2"><%=Model.SclDistrictContact %></td>
                <td></td>
            </tr>

        </table>
         <input type="hidden" name="stdtiep" value="<%=Model.stdtIEPId%>" />
        <br />
    </div>
    <%int count = 0;%>
    <%foreach (var item in Model.GoalDt)
      {
          int temp = count;
          string name = "divprogress" + temp;
         
    %>
    <div id="divgrid" style="float: left; width: 100%">
        <input type="hidden" name="GoalData[<%=temp %>].GoalID" value="<%=item.Goalid %>" />
        <hr style="width: 100%; border: 3px solid #006a87;" />
        <br />
        <table id="tblDatedetails" style="width: 100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    Progress Report
                </td>
                <td>on IEP Dated: from &nbsp;<%=Model.IEPDtFrom.ToString("MM/dd/yyyy").Replace('-', '/') %></td>
                <td>to &nbsp; <%=Model.IEPDtTo.ToString("MM/dd/yyyy").Replace('-', '/') %></td>
            </tr>
        </table>
        <hr  style="width:100%" border:"solid" />
        <table id="tblStudentDetails" style="width: 100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td class="tdLabel">Student Name:&nbsp;&nbsp;<%=Model.StudentName %></td>

                <td class="tdLabel">DOB:&nbsp;&nbsp;<%=Model.DOB.ToString("MM/dd/yyyy").Replace('-', '/') %></td>

                <td class="tdLabel">ID #:&nbsp;&nbsp;<%=Model.ID %></td>
            </tr>

        </table>
        <div id="divInfo" style=" background-color: #0d668e;color: white;font-size: 18px;height: 10%;padding: 5px 0 5px 15px;text-align: center;width: 98.5%;">INFORMATION FROM CURRENT IEP</div>
        <table id="tblCurrentIEP" style="width: 100%;  border="0" cellpadding="0" cellspacing="0">


            <tr>
                <td>Goal #:&nbsp;&nbsp;<%=item.GoalNo%>&nbsp;&nbsp;<%=item.GoalName %></td>
                <td>Specific Goal Focus:&nbsp;<%=item.LessonplanName%></td>
            </tr>
        </table>
        <%foreach (var data in item.PlcacementList)
          {
              
        %> 
        Current Performance Level:&nbsp; What can the student currently do?<br />
        <ul>
            <li><b><%=data.objective1 %></b></li>
        </ul>
        <br />
        <%--<%=Html.TextBoxFor(x=>item.PlcacementList[0].objective1,data.objective1) %>--%>
        <hr  style="width:100%" border:"solid" />
        Measurable Annual Goal:What challenging, yet attainable, goal can we expect the student to meet by the end of this IEP period?<br />
        How will we know that the student has reached this goal?<br />
        <ul>
            <li><b><%=data.objective2 %></b></li>
        </ul>
        <br />
        <hr  style="width:100%" border:"solid" />
        Benchmark/Objectives: What will the student need to do to complete this goal?<br />
        <ul>
            <li><b><%=data.objective3 %></b></li>
        </ul>
        <br />
        <br />
        <%} %>
           
        <div id="PrgRptInfo" style=" background-color: #0d668e;color: white;font-size: 18px;height: 10%;padding: 5px 0 5px 15px;text-align: center;width: 98.5%;">PROGRESS REPORT INFORMATION</div>
        <div id="<%=name%>">
            <% string rptdate = "report_date" + temp;
               string txtreport = "txtreport" + temp;
               int index = 0;
               int quarter = 1;

               foreach (var reports in item.RptList)
               {
                   if (reports.VisibleToParent == true)
                   {
               
               %>

          
               <table class="Ctable" id="tblinfo" style="width: 100%; border="0" cellpadding="0" cellspacing="0">

                   <tr>
                      <td>Progress Report Date:&nbsp;&nbsp;<%=reports.rptdate.ToString("MM/dd/yyyy").Replace('-', '/')%></td>
                        <td></td>
                       <td>Progress Report # <%=quarter %> of  4</td>
                  </tr>
                   <tr>
                        <td colspan="3">Progress Reports are required to be sent to parents at least as often as parents are informed of their non-disabled children’s progress. Each progress report must describe the student’s progress toward meeting each annual goal.</td>
                   </tr>
                     <tr>
                         <td colspan="3"><%=reports.rptinfo %></td>
                    </tr>


                </table>
               
            <%
                       index++; quarter++;
                   }
                   else
                   {
                      if(index==0)
                      {  %>
               <table class="Ctable" id="tblinfo" style="width: 100%; border="0" cellpadding="0" cellspacing="0">

                   <tr>
                      <td>

                          No Progress Information found...
                      </td>
                      </tr>
                      </table>
                  <% index++;
                      }
                   }
               } %>
               
               </div>
   
             
   
   

<%count++;
      } %>
     
        </div>
    </div>
    <%}
      else
      { %>
    <div>

        No Goal Assigned For This IEP....
         
    </div><%} %>
 </div>
<%} %>



 <div id="divProgress" class="popUpStyle" style="width: 76%; height: 70%; left: 11%; top: 15%;overflow-y:auto;overflow-x:hidden">
        <a id="close_x" onclick="showProgress(this.id)" class="close sprited1" href="#" style="">
            <img src="../../Documents/images/button_red_close.png" height="18" width="18" alt="" style="float: right; margin-right: 22px; margin-top: 16px; z-index: 300" /></a>

        
   <span> Progress List</span>
        <hr />

       <div id="dvProgressReport" >


</div>

    </div>

   </div>

</asp:Content>
