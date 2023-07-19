<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/ParentMaster.Master" Inherits="System.Web.Mvc.ViewPage<ParentPortal.Models.HomeModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
   <%=Session["title"].ToString() %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript">

        $(document).ready(function () {
            SetColor($('#btnhome'));
        });

    </script>

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
    </style>
   
    <table width="99%" border="0" cellpadding="0" cellspacing="0">
  
  </table>
  <h3>Facesheet</h3>
   <div class=" clear"></div>
    <table style="width: 100%">
        <tr>
            <td><a class="styleA" href="../Home/btnExport/" target="_blank">Export</a></td>
        </tr>
    </table>
     <%if (Model.parentInfo != null)
          { %>
  <table width="99%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="" rowspan="7" width="330"><img src="data:image/gif;base64,<%=Model.Imageurl %>" width="267" height="181" /></td>
    <td>Legal Name (Last, First, MI)</td>
    <td colspan="2" width="250"><%=Model.parentInfo.LastName %>, <%=Model.parentInfo.FirstName %>, <%=Model.parentInfo.MiddleName %></td>
  </tr>
  <tr>
    <td>Nickname</td>
    <td colspan="2"><%=Model.parentInfo.NickName %></td>
  </tr>
  <tr>
    <td>Date of Birth</td>
    <td colspan="2"><%if (Model.parentInfo.DOB != null)
                                  { %><%=Model.parentInfo.DOB.Value.ToShortDateString().Replace("-","/") %><%} %></td>
  </tr>
  <tr>
    <td>Current Address or 
      Residential Service Setting</td>
    <td colspan="2"><%=Model.parentInfo.Address1 %>, <%=Model.parentInfo.Address2%></td>
  </tr>
  <tr>
    <td>Date of Admission</td>
    <td colspan="2"><%if (Model.parentInfo.AdmissionDate != null)
                                  { %><%=Model.parentInfo.AdmissionDate.Value.ToShortDateString().Replace("-","/")  %><%} %></td>
  </tr>
  <tr>
    <td>Place of Birth</td>
    <td colspan="2"><%=Model.parentInfo.BirthPlace %></td>
  </tr>
  <tr>
    <td>Citizenship</td>
    <td colspan="2"><%=Model.parentInfo.CitizenShip %></td>
  </tr>
      
    </table>
    <table width="99%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td style="width:20%">Race</td>
    <td style="width:30%"><%=Model.parentInfo.Race %></td>
    <td style="width:20%">Primary Language</td>
    <td style="width:30%"><%=Model.parentInfo.PrimaryLanguage %></td>
  </tr>
  <tr>
    <td style="width:20%">Height (date)</td>
    <td style="width:30%"><%=Model.parentInfo.Height %></td>
    <td style="width:20%">Gender</td>
    <td style="width:30%"><%if (Model.parentInfo.Gender == "1")
                                  { %>Male<%}
                                  else if (Model.parentInfo.Gender == "2")
                                  { %>Female<%} %></td>
  </tr>
  <tr>
    <td style="width:20%">Weight (date)</td>
    <td style="width:30%"><%=Model.parentInfo.Weight %></td>
    <td style="width:20%">Legal Competency Status</td>
    <td style="width:30%"><%=Model.parentInfo.LegalCompetencyStat %></td>
  </tr>
  <tr>
    <td style="width:20%">Hair Color</td>
    <td style="width:30%"><%=Model.parentInfo.HairColor %></td>
    <td style="width:20%">Guardianship Status</td>
    <td style="width:30%"><%=Model.parentInfo.GuardianStat %></td>
  </tr>
  <tr>
    <td style="width:20%">Eye Color</td>
    <td style="width:30%"><%=Model.parentInfo.EyeColor %></td>
    <td style="width:20%">Other State Agencies Involved With Student</td>
    <td style="width:30%"><%=Model.parentInfo.OtherStateInvolveStat %></td>
  </tr>
  <tr>
    <td style="width:20%">Distinguishing Marks</td>
    <td style="width:30%"><%=Model.parentInfo.DistinguishMarks %></td>
    <td style="width:20%">Marital Status of Both Parents</td>
    <td style="width:30%"><%=Model.parentInfo.ParentMaritalStat %></td>
  </tr>
  <tr>
    <td colspan="" style="width:20%">Case Manager Residential</td>
    <td colspan="3" style="width:30%"><%=Model.parentInfo.CaseManagerRes %></td>
    </tr>
  <tr>
    <td colspan="" style="width:20%">Case Manager Educational</td>
    <td colspan="3" style="width:30%"><%=Model.parentInfo.CaseManagerEdu %></td>
    </tr>
  <tr>
    <td colspan="" style="width:20%">Educational Surrogate: (if applicable)</td>
    <td colspan="3" style="width:30%">&nbsp;</td>
    </tr>
</table>

<h4>Emergency Contacts – Personal</h4>
  <table width="99%" border="0" cellpadding="0" cellspacing="0">
  <tr>
  	<td> <table style="width: 100%;">
                        <%int i = 1;
                          if (Model.parentInfo.Relations != null)
                          {
                              foreach (var Rel in Model.parentInfo.Relations)
                              {
                                  if(Rel.Relation=="Emergency Contact")
                                  {
                        %>
                        <tr>
                            <td rowspan="4" style="background-color: #000000; text-align: center;"><b style="color: #FFFFFF"><%=i++%>. </b></td>
                            <td><b>Relation</b></td>
                            <td><%=Rel.Relation%></td>
                            <td><b>Full Name</b></td>
                            <td><%=Rel.LName%>, <%=Rel.FName%>, <%=Rel.MName%></td>
                            <td><b>Primary Language</b></td>
                            <td><%=Rel.PrmryLanguage%></td>
                        </tr>
                        <tr>
                            <td rowspan="3"><b>Address</b></td>
                            <td colspan="3" rowspan="3"><%=Rel.Address1%>, <%=Rel.Address2%>, <%=Rel.Address3%></td>
                            <td><b>Home Phone</b></td>
                            <td><%=Rel.HomePhone%></td>
                        </tr>
                        <tr>
                            <td><b>Other Phone</b></td>
                            <td><%=Rel.OtherPhone%></td>
                        </tr>
                        <tr>
                            <td><b>E-mail</b></td>
                            <td><%=Rel.Email%></td>
                        </tr>
                        <%
                        }}
                          }
                          else
                          { %>
                        <tr>
                            <td>No Data Found !!!</td>
                        </tr>
                        <%} %>
                    </table></td>
  </tr>
  </table>
  <h4>Emergency Contacts – School</h4>
  <table width="99%" border="0" cellpadding="0" cellspacing="0">
  <tr>
  	<td> <table style="width: 100%;">
                        <%i = 1;
                          if (Model.parentInfo.EmergencySchool != null)
                          {
                              foreach (var Emer in Model.parentInfo.EmergencySchool)
                              {%>
                        <tr>
                            <td style="background-color: #000000; color: #FFFFFF; text-align: center;width: 10%;"><b style="color: #FFFFFF"><%=i++ %>. </b></td>
                            <td  style="width: 15%;">Full Name, Title</td>
                            <td  style="width: 30%;"><%=Emer.FName %> <%=Emer.LName %>, <%=Emer.Title %></td>
                            <td  style="width: 15%;">Phone</td>
                            <td  style="width: 30%;"><%=Emer.Phone %></td>
                        </tr>
                        <%}
                          }
                          else
                          { %>
                        <tr>
                            <td>No Data Found !!!</td>
                        </tr>
                        <%} %>
                    </table></td>
  </tr>
  </table>
    <h4>Medical and Insurance</h4>
    
     <table width="99%" border="0" cellpadding="0" cellspacing="0">
  <tr>
  	<td> <table style="width: 100%;">
                        <%
              if (Model.parentInfo.InsuranceDetl != null)
              {
                  foreach (var Insurance in Model.parentInfo.InsuranceDetl)
                  {
                        %>
                        <tr>
                            <td style="background-color: #000000; color: #FFFFFF; text-align: center; width: 10%;" rowspan="2">Insurance</td>
                            <td  style="width: 15%;">Insurance Type</td>
                            <td style="width: 30%;"><%=Insurance.InsuranceType %></td>
                            <td  style="width: 15%;">Policy Number</td>
                            <td style="width: 30%;"><%=Insurance.PolicyNumber %></td>
                        </tr>
                        <tr>
                            <td  style="width: 15%;">Policy Holder</td>
                            <td style="width: 30%;"><%=Insurance.PolicyHolder %></td>
                            <td>&nbsp;</td>
                            <td></td>
                        </tr>
                        <%}
              }
              else
              { %>
                        <tr>
                            <td>No Data Found !!!</td>
                        </tr>
                        <%} %>
                    </table></td>
  </tr>
  </table>
     <table width="99%" border="0" cellpadding="0" cellspacing="0">
  <tr>
<td> <table style="width: 100%;">
                        <%
              if (Model.parentInfo.MedicalInform != null)
              {
                  
                        %>
                        <tr>
                    <td rowspan="2">Primary Physician</td>
                    <td>Full Name </td>
                    <td><%=Model.parentInfo.MedicalInform.PhLastName%>,<%=Model.parentInfo.MedicalInform.PhFirstName%></td>
                    <td>Office Phone</td>
                    <td><%=Model.parentInfo.MedicalInform.Phone%></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><% =Model.parentInfo.MedicalInform.Address1%>,<%=Model.parentInfo.MedicalInform.Address2%>,<%=Model.parentInfo.MedicalInform.Address3%></td>
                    <td></td>
                    
                </tr>
                        <%
              }
              else
              { %>
                        <tr>
                            <td>No Data Found !!!</td>
                        </tr>
                        <%} %>
                    </table></td>
  </tr>
  </table>
   <table width="99%" border="0" cellpadding="0" cellspacing="0">
  <tr>
  	<td> <table style="width: 100%;">
        
        <%
            if(Model.parentInfo.MedicalInform !=null)
            {
            
             %>
        <tr>
            <tr>
            <td>Date Of Last Physical Exam</td>
            <td><%=Model.parentInfo.MedicalInform.DtExam.Value.ToShortDateString().Replace("-","/") %></td>
            </tr>
            <tr>
            <td>Allergies</td>
            <td><%=Model.parentInfo.MedicalInform.Allergies %></td>
             </tr>
             <tr>
            <td>Medical Conditions or Diagnosis</td>
            <td><%=Model.parentInfo.MedicalInform.Diagnosis %></td>
            </tr>
            <tr>
            <td>Current Medications</td>
            <td><%=Model.parentInfo.MedicalInform.CMedications %></td>
             </tr>
            <tr>
            <td>Self Preservation Ability</td>
            <td><%=Model.parentInfo.MedicalInform.SelfPA %></td>
            </tr>
              <tr>
            <td>SignificantBehaviorCharacteristics</td>
            <td><%=Model.parentInfo.MedicalInform.SBCharacteristics %></td>
            </tr>
              <tr>
             <td>Relevant Capabilities, Limitations, and Preferences</td>
             </tr>
              <tr>
            <td><h4>Capabilities</h4></td>
            <td><%=Model.parentInfo.MedicalInform.Capabilities %></td>
            </tr>
           <tr>
            <td><h4>Limitations</h4></td>
            <td><%=Model.parentInfo.MedicalInform.Limitations %></td>
            </tr>
            <tr>
             <td><h4>Preferences</h4></td>
            <td><%=Model.parentInfo.MedicalInform.Preferences %></td>
            </tr>
        </tr>
         <%
              }
              else
              { %>
                        <tr>
                            <td>No Data Found !!!</td>
                        </tr>
                        <%} %>

          </table></td>
  </tr>

 </table>


 
      <h4>Referral/IEP Information</h4>
  
  <table width="99%" border="0" cellpadding="0" cellspacing="0">
      <%if (Model.parentInfo.RefIEPInform != null)
        {
            foreach (var RefIEP in Model.parentInfo.RefIEPInform)
            {
                     %>  
      <tr>
                    <td class="top bgClr" style="width: 10%;">Liaison</td>
                    <td class="top" style="width: 15%;">Full Name, Title</td>
                    <td class="top" style="width: 30%;"> <% =RefIEP.Name%><b>,</b><% =RefIEP.Title%></td>
                    <td class="top" style="width: 15%;">Phone</td>
                    <td class="top righ" style="width: 30%;"><% =RefIEP.Phone%></td>
                </tr>
  <tr>
  	<td>Referring Agency</td>	<td> <%=RefIEP.ReferringAgency%></td>
  </tr>
    <tr>
  	<td>Source of Tuition</td><td> <%=RefIEP.SourceofTuition%></td>
  </tr><%}
        } %>
  </table>
  
      <h4>Education History</h4>
   <table width="99%" border="0" cellpadding="0" cellspacing="0">
  <tr>
  	<td width="35%">Date Initially Eligible for Special Education</td><td><%=Model.parentInfo.DateInitEligibleforSpclEducation.ToString().Replace("-","/").Replace("00","").Replace(":","")%></td>
  </tr>
    <tr>
  	<td width="35%">Date of Most Recent Special Education Evaluations</td><td>
          
          
          <%=Model.parentInfo.DateofMostRecentSpecialEducationEvaluations.ToString().Replace("-","/").Replace("00","").Replace(":","") %>



  	                                                                      </td>
  </tr>
    <tr>
  	<td width="35%">Date of Next Scheduled 3-Year Evaluation</td><td><%=Model.parentInfo.DateofNextScheduled3YearEvaluation.ToString().Replace("-","/").Replace("00","").Replace(":","") %></td>
  </tr>
    <tr>
  	<td width="35%">Current IEP Start Date</td><td><%=Model.parentInfo.CrntIEPStartDate.ToString().Replace("-","/").Replace("00","").Replace(":","") %></td>
  </tr>
    <tr>
  	<td width="35%">Current IEP Expiration Date</td><td><%=Model.parentInfo.CrntIEPExpireDate.ToString().Replace("-","/").Replace("00","").Replace(":","") %></td>
  </tr>
  </table>
 <h4>Schools Attended</h4>
<p> <strong>Lists schools attended in reverse-chronological order with current placement first.</strong></p>
   <table width="99%" border="0" cellpadding="0" cellspacing="0">
 
    <tr>
  	<td colspan="3"> <table style="width: 100%;">
                        <tr>
                            <td class="auto-style3"><span class="auto-style2"><b>Name</b></td>
                            <td><b>Address</b></td>
                            <td><b>Dates Attended</b></td>
                        </tr>
                        <%
              if (Model.parentInfo.SchoolsAttended != null)
              {
                  foreach (var schlsAttended in Model.parentInfo.SchoolsAttended)
                  {
                      string datefrom = "-";
                      if (schlsAttended.DateFrom != null)
                      {
                          datefrom = schlsAttended.DateFrom.Value.ToShortDateString();
                      }
                        %>
                        <tr>
                            <td><%=schlsAttended.SchoolName %></td>
                            <td><%=schlsAttended.Address1 %>, <%=schlsAttended.Address2 %>, <%=schlsAttended.City %>, <%=schlsAttended.State %></td>
                            <td><%if (schlsAttended.DateTo == null)
                                  { %>
                                <%=datefrom.Replace("-","/")  %> - Present<%}
                                  else
                                  { %>
                                <%=datefrom.Replace("-","/")  %> - <%=schlsAttended.DateTo.Value.ToShortDateString().Replace("-","/")  %>
                                <%} %>
                            </td>
                        </tr>
                        <%}
              }
              else
              { %>
                        <tr>
                            <td>No Data Found !!!</td>
                        </tr>
                        <%} %>
                    </table></td>
    </tr>
  </table>
<h4>Discharge Information</h4>
  <table width="99%" border="0" cellpadding="0" cellspacing="0">
  <tr>
  	<td width="30%">Discharge Date</td><td><%if (Model.parentInfo.DischargeDate != null)
                                  {%><%= Model.parentInfo.DischargeDate.Value.ToShortDateString().Replace("-","/") %><% } %></td>
  </tr>
    <tr>
  	<td width="30%">Location After Discharge</td><td><%= Model.parentInfo.LocationAfterDischarge%></td>
  </tr>
      <tr>
  	<td width="30%">Melmark New England’s Follow Up Responsibility</td><td><%=Model.parentInfo.MelmarkNewEnglandsFollowUpResponsibilities %></td>
  </tr>
  </table>
     <%}
          else
          { %>
        <div>
            <h3>No Data Found !!!!</h3>
        </div>
        <%} %>
    
</asp:Content>
