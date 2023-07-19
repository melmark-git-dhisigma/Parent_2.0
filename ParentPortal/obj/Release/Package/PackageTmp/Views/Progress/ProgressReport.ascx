<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ParentPortal.Models.ProgressDetails>" %>



<style type="text/css">
    .auto-style2 {
        width: 920px;
    }
</style>
<link href="../../Documents/CSS/jquery-ui.css" rel="stylesheet" />
<link href="../../Documents/CSS/jquery-ui-1.10.3.custom.css" rel="stylesheet" />
<script src="../../Documents/JS/jquery-1.8.2.js"></script>
<script src="../../Documents/JS/jquery-ui-1.8.24.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        SetColor($('#btnrpt'));
    });
    function ProgressReport() {
        $('#dvProgressReport').load('../Progress/ProgressGrid/');
        $('#divProgress').show();

    }
    //function ProgressReport(IEPId) {
    //    $('#divProgress').hide();
    //    $.get("../Progress/ProgressRpt/?Id=" + IEPId, function (data) {
    //        $('#content').html(data);
    //    });
    //}
    function showProgress(IEPId) {
        $.get("../Progress/ProgressRpt/?Id=" + IEPId, function (data) {
            $('#divProgress').hide();
        });
    }
</script>

<div id="partialMainArea">

    
     <div id="Sample" style="float: left; width: 100%">


        <table id="tblSchooldetails" style="width: 50%">
            <tr>
                <td class="tdLabel">School District Name:</td>
                <td><%=Model.SclDistrictName %></td>
            </tr>
            <tr>
                <td class="tdLabel">School District Address:</td>
                <td><%=Model.SclDistrictAddress %></td>
            </tr>
            <tr>
                <td class="tdLabel">School District Contact Person/Phone #:</td>
                <td><%=Model.SclDistrictContact %></td>
            </tr>

        </table>
          
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
                       <hr style="width: 100%; border: 5px solid;" />
                         <br />
                     <table id="tblDatedetails" style="width: 100%">
                         <tr>
                            <td>
                                        <h2 style="color: black">Progress Report</h2>
                             </td>
                             <td>on IEP Dated: from &nbsp;<%=Model.IEPDtFrom.ToString("MM/dd/yyyy").Replace('-', '/') %></td>
                             <td>to &nbsp; <%=Model.IEPDtTo.ToString("MM/dd/yyyy").Replace('-', '/') %></td>
                         </tr>
                      </table>
                        <hr  style="width:100%" border:"solid" />
                    <table id="tblStudentDetails" style="width: 100%">
                      <tr>
                         <td class="tdLabel">Student Name:&nbsp;&nbsp;<%=Model.StudentName %></td>

                          <td class="tdLabel">DOB:&nbsp;&nbsp;<%=Model.DOB.ToString("MM/dd/yyyy").Replace('-', '/') %></td>

                          <td class="tdLabel">ID #:&nbsp;&nbsp;<%=Model.ID %></td>
                      </tr>

                   </table>
        <div id="divInfo" style="width: 100%; height: 10%; background-color: black; color: white; font-size: 18px; text-align: center">INFORMATION FROM CURRENT IEP</div>
        <table id="tblCurrentIEP" style="width: 100%; border: thick">


            <tr>
                <td>Goal #:&nbsp;&nbsp;<%=item.Goalid%></td>
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
          
        <div id="PrgRptInfo" style="width: 100%; height: 10%; background-color: black; color: white; font-size: 18px; text-align: center">PROGRESS REPORT INFORMATION</div>
        <div id="<%=name%>">
            <% string rptdate = "report_date" + temp;
               string txtreport = "txtreport" + temp;
               int index=0;
               int quarter =1;

               foreach (var reports in item.RptList)
                   {
                       
               
               %>

          
               <table class="Ctable" id="tblinfo" style="width: 100%; border: thick">

                   <tr>
                      <td>Progress Report Date:&nbsp;&nbsp;<%=reports.rptdate%></td>
                        <td></td>
                       <td>Progress Report # <%=quarter %>NFORMATION FROM CURRENT IEP of  4</td>
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
              } %>
               
               </div>
   
             </div>
   
   

<%count++;
      } %>
   
</div>


