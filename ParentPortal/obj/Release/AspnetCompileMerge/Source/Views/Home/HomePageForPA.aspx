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
            width: 100%;
        }

        .maintable {
            width: 80%;
            border: none;
        }

        .boldText {
            font-weight: bold;
            font-size: 14px;
        }

        .auto-style1 {
            list-style-type: square;
        }
    </style>
    <h4>HomePage</h4>
    <div class="clear"></div>
    <%if (Model.parentInfoPA != null)
      { %>
    <div>
        <table class="maintable" align="center">
            <tr>
                <td style="border: none; font-style: italic;" class="boldText">CLIENT PROFILE / PROTOCOL SUMMARY</td>
                <td style="border: none;">
                    <table>
                        <tr>
                            <td class="boldText" style="background-color: #F2EEEE;">DATE UPDATED:</td>
                            <td><%if (Model.parentInfoPA.AdmissionDate != null)
                                  { %><%=Model.parentInfoPA.AdmissionDate.Value.ToShortDateString() %><%} %></td>
                            <td><a href="../Home/btnExport/" target="_blank" style="float: right; color: Blue; text-decoration: underline;">Export</a></td>
                        </tr>
                    </table>
                    <br />
                </td>
            </tr>
            <tr>
                <td style="border: none;">
                    <table>
                        <tr>
                            <td class="boldText" style="width: 15%;">NAME:</td>
                            <td><%=Model.parentInfoPA.LastName %>, <%=Model.parentInfoPA.FirstName %></td>
                        </tr>
                    </table>
                </td>
                <td style="border: none;">
                    <table style="float: left; min-width: 100px; width: 250px;">
                        <tr>
                            <td class="boldText">GENDER:</td>
                            <td><%if (Model.parentInfoPA.Gender == "1")
                                  { %>Male<%}
                                  else if (Model.parentInfoPA.Gender == "2")
                                  { %>Female<%} %></td>
                        </tr>
                    </table>
                    <table style="float: left; min-width: 100px; width: 250px;">
                        <tr>
                            <td class="boldText">BIRTHDATE:</td>
                            <td><%if (Model.parentInfoPA.DOB != null)
                                  { %><%=Model.parentInfoPA.DOB.Value.ToShortDateString() %><%} %></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="border: none;" colspan="2">
                    <br />
                    <table>
                        <tr>
                            <td colspan="2" class="boldText" style="background-color: #F2EEEE;">CONTACT INFORMATION</td>
                        </tr>
                    </table>
                    <br />
                </td>
            </tr>
            <tr>
                <td style="border: none; width: 50%;">
                    <table>
                        <tr>
                            <td class="boldText" style="width:30%;">RESIDENT / INDIVIDUAL</td>
                            <td style="width:70%;"></td>
                        </tr>
                        <tr>
                            <td rowspan="2" class="boldText" style="width:30%;">CURRENT ADDRESS:</td>
                            <td style="width:70%;"><%=Model.parentInfoPA.Address2 %></td>
                           
                        </tr>
                        <tr>
                             <td style="width:70%;"><%=Model.parentInfoPA.Address1 %></td>
                        </tr>
                        <%--<tr>
                            <td><%=Model.parentInfoPA.Address3 %></td>
                        </tr>--%>
                       
                         <tr>
                            <td class="boldText" style="width:30%;">CITY:</td>
                            <td style="width:70%;"><%=Model.parentInfoPA.City %></td>
                        </tr>
                         <tr>
                            <td class="boldText" style="width:30%;">STATE:</td>
                            <td style="width:70%;"><%=ViewBag.State %></td>
                        </tr>
                         <tr>
                            <td class="boldText" style="width:30%;">ZIP:</td>
                            <td style="width:70%;"><%=Model.parentInfoPA.Zip %></td>
                        </tr>
                         <tr>
                            <td class="boldText" style="width:30%;">COUNTRY:</td>
                            <td style="width:70%;"><%=ViewBag.Country %></td>
                        </tr>
                         <tr>
                            <td class="boldText" style="width:30%;">PHONE NUMBER:</td>
                            <%if (Model.parentInfoPA.PrimaryCntct != null)
                             {%>
                            <td style="width:70%;"><%=Model.parentInfoPA.PrimaryCntct.HomePhone%></td>
                            <%} %>
                        </tr>
                        <tr height="64px">
                            <td class="boldText" style="width:30%;">
                                <br />
                                FUNDING SOURCE:<br />
                                <br />
                            </td>
                            <td style="width:70%;"><%=Model.parentInfoPA.FundingSource %></td>
                        </tr>
                    </table>
                    <br />
                </td>
                <td style="border: none;">
                     <%if (Model.parentInfoPA.PrimaryCntct != null)
                      {%>
                    <table>
                        <tr>
                            <td class="boldText" style="width:30%;">PRIMARY CONTACT</td>
                            <td style="width:70%;"><%=Model.parentInfoPA.PrimaryCntct.LName %>, <%=Model.parentInfoPA.PrimaryCntct.FName %></td>
                        </tr>
                        <tr>
                            <td rowspan="3" class="boldText" style="width:30%;">ADDRESS:</td>
                              <td style="width:70%;"><%=Model.parentInfoPA.PrimaryCntct.Address2 %></td>
                           
                        </tr>
                        <tr>
                           <td style="width:70%;"><%=Model.parentInfoPA.PrimaryCntct.Address1 %></td>
                        </tr>
                        <tr>
                            <td style="width:70%;"><%=Model.parentInfoPA.PrimaryCntct.Address3 %></td>
                        </tr>
                        <tr>
                            <td class="boldText" style="width:30%;">STATE:</td>
                            <td style="width:70%;"><%if (Model.parentInfoPA.PrimaryCntct.State != null && Model.parentInfoPA.PrimaryCntct.State != 0)
                                                  { %><%=ViewBag.PrcontactState %><%} %></td>
                        </tr>
                        <tr>
                            <td class="boldText" style="width:30%;">HOME PHONE #:</td>
                            <td style="width:70%;"><%=Model.parentInfoPA.PrimaryCntct.HomePhone %></td>
                        </tr>
                        <tr>
                            <td class="boldText" style="width:30%;">WORK PHONE #:</td>
                            <td style="width:70%;"><%=Model.parentInfoPA.PrimaryCntct.WorkPhone %></td>
                        </tr>
                        <tr>
                            <td class="boldText" style="width:30%;">CELL PHONE #:</td>
                            <td style="width:70%;"><%=Model.parentInfoPA.PrimaryCntct.CellPhone %></td>
                        </tr>
                        <tr>
                            <td class="boldText" style="width:30%;">E-MAIL ADDRESS:</td>
                            <td style="width:70%;"><%=Model.parentInfoPA.PrimaryCntct.Email %></td>
                        </tr>
                    </table>
                     <%}else{ %>
                     <table>
                        <tr>
                            <td class="boldText" style="width:30%;">PRIMARY CONTACT</td>
                            <td style="width:70%;">
                        </tr>
                         </table>
                    <%} %>

                    <br />
                </td>
            </tr>
            <tr>
                <td style="border: none;">
                    <%if (Model.parentInfoPA.LegalGrdn1 != null)
                      {%>
                    <table>
                        <tr>
                            <td class="boldText" style="width:30%;">LEGAL GUARDIAN</td>
                            <td style="width:70%;"><%=Model.parentInfoPA.LegalGrdn1.LName %>, <%=Model.parentInfoPA.LegalGrdn1.FName %></td>
                        </tr>
                        <tr>
                            <td rowspan="3" class="boldText" style="width:30%;">ADDRESS:</td>
                            <td style="width:70%;"><%=Model.parentInfoPA.LegalGrdn1.Address2 %></td>
                           
                        </tr>
                        <tr>
                             <td style="width:70%;"><%=Model.parentInfoPA.LegalGrdn1.Address1 %></td>
                        </tr>
                        <tr>
                            <td style="width:70%;"><%=Model.parentInfoPA.LegalGrdn1.Address3 %></td>
                        </tr>
                        <tr>
                            <td class="boldText" style="width:30%;">HOME PHONE #:</td>
                            <td style="width:70%;"><%=Model.parentInfoPA.LegalGrdn1.HomePhone %></td>
                        </tr>
                        <tr>
                            <td class="boldText" style="width:30%;">WORK PHONE #:</td>
                            <td style="width:70%;"><%=Model.parentInfoPA.LegalGrdn1.WorkPhone %></td>
                        </tr>
                        <tr>
                            <td class="boldText" style="width:30%;">CELL PHONE #:</td>
                            <td style="width:70%;"><%=Model.parentInfoPA.LegalGrdn1.CellPhone %></td>
                        </tr>
                        <tr>
                            <td class="boldText" style="width:30%;">E-MAIL ADDRESS:</td>
                            <td style="width:70%;"><%=Model.parentInfoPA.LegalGrdn1.Email %></td>
                        </tr>
                    </table>
                     <%} else{ %>
                     <table>
                        <tr>
                            <td class="boldText" style="width:30%;">LEGAL GUARDIAN</td>
                              <td style="width:70%;">
                        </tr>
                         </table>
                    <%} %>
                    <br />
                </td>
                <td style="border: none;">
                     <%if (Model.parentInfoPA.LegalGrdn2 != null)
                      {%>
                    <table>
                        <tr>
                            <td class="boldText" style="width:30%;">LEGAL GUARDIAN</td>
                            <td style="width:70%;"><%=Model.parentInfoPA.LegalGrdn2.LName %>, <%=Model.parentInfoPA.LegalGrdn2.FName %></td>
                        </tr>
                        <tr>
                            <td rowspan="3" class="boldText" style="width:30%;">ADDRESS:</td>
                            <td style="width:70%;"><%=Model.parentInfoPA.LegalGrdn2.Address2 %></td>
                           
                        </tr>
                        <tr>
                             <td style="width:70%;"><%=Model.parentInfoPA.LegalGrdn2.Address1 %></td>
                        </tr>
                        <tr>
                            <td style="width:70%;"><%=Model.parentInfoPA.LegalGrdn2.Address3 %></td>
                        </tr>
                        <tr>
                            <td class="boldText" style="width:30%;">HOME PHONE #:</td>
                            <td style="width:70%;"><%=Model.parentInfoPA.LegalGrdn2.HomePhone %></td>
                        </tr>
                        <tr>
                            <td class="boldText" style="width:30%;">WORK PHONE #:</td>
                            <td style="width:70%;"><%=Model.parentInfoPA.LegalGrdn2.WorkPhone %></td>
                        </tr>
                        <tr>
                            <td class="boldText" style="width:25%;">CELL PHONE #:</td>
                            <td style="width:75%;"><%=Model.parentInfoPA.LegalGrdn2.CellPhone %></td>
                        </tr>
                        <tr>
                            <td class="boldText" style="width:30%;">E-MAIL ADDRESS:</td>
                            <td style="width:70%;"><%=Model.parentInfoPA.LegalGrdn2.Email %></td>
                        </tr>
                    </table>
                     <%}  else{ %>
                     <table>
                        <tr>
                            <td class="boldText" style="width:30%;">LEGAL GUARDIAN</td>
                          <td style="width:70%;">
                        </tr>
                         </table>
                    <%} %>
                    <br />
                </td>
            </tr>
            <tr>
                <td style="border: none;">
                    <%if (Model.parentInfoPA.SupportCord != null)
                      {%>
                    <table>
                        <tr>
                            <td class="boldText" style="width:30%;">SUPPORT COORDINATOR</td>
                            <td style="width:70%;"><%=Model.parentInfoPA.SupportCord.LName %>, <%=Model.parentInfoPA.SupportCord.FName %></td>
                        </tr>
                        <tr>
                            <td rowspan="3" class="boldText" style="width:30%;">ADDRESS:</td>
                              <td style="width:70%;"><%=Model.parentInfoPA.SupportCord.Address2 %></td>
                          
                        </tr>
                        <tr>
                            <td style="width:70%;"><%=Model.parentInfoPA.SupportCord.Address1 %></td>
                        </tr>
                        <tr>
                            <td style="width:70%;"><%=Model.parentInfoPA.SupportCord.Address3 %></td>
                        </tr>
                        <tr>
                            <td class="boldText" style="width:30%;">WORK PHONE #:</td>
                            <td style="width:70%;"><%=Model.parentInfoPA.SupportCord.WorkPhone %></td>
                        </tr>
                        <tr>
                            <td class="boldText" style="width:30%;">CELL PHONE #:</td>
                            <td style="width:70%;"><%=Model.parentInfoPA.SupportCord.CellPhone %></td>
                        </tr>
                        <tr>
                            <td class="boldText" style="width:30%;">E-MAIL ADDRESS:</td>
                            <td style="width:70%;"><%=Model.parentInfoPA.SupportCord.Email %></td>
                        </tr>
                    </table>
                      <%}  else{ %>
                     <table>
                        <tr>
                            <td class="boldText" style="width:30%;">SUPPORT COORDINATOR</td>
                          <td style="width:70%;">
                        </tr>
                         </table>
                    <%} %>
                    <br />
                </td>
                <td style="border: none;">
                       <%if (Model.parentInfoPA.Advocate != null)
                      {%>
                    <table>
                        <tr>
                            <td class="boldText" style="width:30%;">ADVOCATE</td>
                            <td style="width:70%;"><%=Model.parentInfoPA.Advocate.LName %>, <%=Model.parentInfoPA.Advocate.FName %></td>
                        </tr>
                        <tr>
                            <td rowspan="3" class="boldText" style="width:30%;">ADDRESS:</td>
                              <td style="width:70%;"><%=Model.parentInfoPA.Advocate.Address2 %></td>
                          
                        </tr>
                        <tr>
                            <td style="width:70%;"><%=Model.parentInfoPA.Advocate.Address1 %></td>
                        </tr>
                        <tr>
                            <td style="width:70%;"><%=Model.parentInfoPA.Advocate.Address3 %></td>
                        </tr>
                        <tr>
                            <td class="boldText" style="width:30%;">WORK PHONE #:</td>
                            <td style="width:70%;"><%=Model.parentInfoPA.Advocate.WorkPhone %></td>
                        </tr>
                        <tr>
                            <td class="boldText" style="width:30%;">CELL PHONE #:</td>
                            <td style="width:70%;"><%=Model.parentInfoPA.Advocate.CellPhone %></td>
                        </tr>
                        <tr>
                            <td class="boldText" style="width:30%;">E-MAIL ADDRESS:</td>
                            <td style="width:70%;"><%=Model.parentInfoPA.Advocate.Email %></td>
                        </tr>
                    </table>
                      <%}  else{ %>
                     <table>
                        <tr>
                            <td class="boldText" style="width:30%;">ADVOCATE</td>
                             <td style="width:70%;">
                        </tr>
                         </table>
                    <%} %>
                    <br />
                </td>
            </tr>
            <tr>
                <td style="border: none;" colspan="2">
                    <table>
                        <tr>
                            <td colspan="4" class="boldText" style="background-color: #F2EEEE;width:25%;">DIAGNOSES:</td>

                        </tr>
                        <%if (Model.parentInfoPA.Diagnoses != null)
                          { %>
                        <%foreach (var item in Model.parentInfoPA.Diagnoses)
                          { %>
                        <tr>
                            <td colspan="4"><%=item.DiagnosesName %></td>
                        </tr>
                        <%} %>
                        <%}
                          else
                          { %>
                        <tr>
                            <td>No Data Found !!!</td>
                        </tr>
                        <%} %>
                    </table>
                    <br />
                </td>
            </tr>
            <tr>
                <td style="border: none;" colspan="2">
                    <table>
                        <tr>
                            <td class="boldText" style="background-color: #F2EEEE;">LEVEL OF SUPERVISION</td>
                        </tr>
                    </table>
                    <br />
                </td>
            </tr>
            <tr>
                <td style="border: none;" colspan="2">
                    <table>
                        <tr>
                            <td colspan="2" class="boldText">GENERAL</td>
                        </tr>
                        <tr>
                            <td class="boldText" style="width:25%;">BATHROOM</td>
                            <td style="width:75%;"><%=Model.parentInfoPA.BathRoom %></td>
                        </tr>
                        <tr>
                            <td class="boldText" style="width:25%;">ON CAMPUS</td>
                            <td style="width:75%;"><%=Model.parentInfoPA.OnCampus %></td>
                        </tr>
                        <tr>
                            <td class="boldText" style="width:25%;">WHEN TRANSPORTING</td>
                            <td style="width:75%;"><%=Model.parentInfoPA.WhenTransporting %></td>
                        </tr>
                        <tr>
                            <td class="boldText" style="width:25%;">OFF CAMPUS</td>
                            <td style="width:75%;"><%=Model.parentInfoPA.OffCampus %></td>
                        </tr>
                        <tr>
                            <td class="boldText" style="width:25%;">POOL / SWIMMING</td>
                            <td style="width:75%;"><%=Model.parentInfoPA.Pool_Swimming %></td>
                        </tr>
                        <tr>
                            <td class="boldText" style="width:25%;">VAN</td>
                            <td style="width:75%;"><%=Model.parentInfoPA.Van %></td>
                        </tr>
                    </table>
                    <br />
                </td>
            </tr>
            <tr>
                <td style="border: none;">
                    <table>
                        <tr>
                            <td colspan="2" class="boldText">HOME / RESIDENTIAL</td>
                        </tr>
                        <tr>
                            <td class="boldText" style="width:25%;">COMMON AREAS</td>
                            <td style="width:75%;"><%=Model.parentInfoPA.CommonAreas %></td>
                        </tr>
                        <tr>
                            <td class="boldText" style="width:25%;">BEDROOM AWAKE</td>
                            <td style="width:75%;"><%=Model.parentInfoPA.BedroomAwake %></td>
                        </tr>
                        <tr>
                            <td class="boldText" style="width:25%;">BEDROOM ASLEEP</td>
                            <td style="width:75%;"><%=Model.parentInfoPA.BedroomAsleep %></td>
                        </tr>

                    </table>
                    <br />
                </td>
                <td style="border: none;">
                    <table>
                        <tr>
                            <td colspan="2" class="boldText">DAY PROGRAM</td>
                        </tr>
                        <tr>
                            <td class="boldText" style="width:25%;">TASK / BREAK</td>
                            <td style="width:75%;"><%=Model.parentInfoPA.Task_Break %></td>
                        </tr>
                        <tr>
                            <td class="boldText" style="width:25%;">TRANSITIONS INSIDE</td>
                            <td style="width:75%;"><%=Model.parentInfoPA.TransitionsInside %></td>
                        </tr>
                        <tr>
                            <td class="boldText" style="width:25%;">TRANSITIONS UNEVEN GROUND</td>
                            <td style="width:75%;"><%=Model.parentInfoPA.TransitionsUneven %></td>
                        </tr>

                    </table>
                    <br />
                </td>
            </tr>
        </table>
        <br />
        <hr />
        <br />
        <table class="maintable" align="center">
        
            <tr>
                <td colspan="2" style="border: none;">
                    <br />
                    <table style="width: 100%;">
                        <tr>
                            <td class="boldText" style="background-color: #F2EEEE;">EVACUATION SKILLS <span style="font-size: 10px;">(HOW DOES THIS PERSON EVACUATE DURING FIRE DRILLS, WHAT ASSISTANCE DO THEY NEED)</span></td>
                        </tr>
                        <tr>
                            <td>
                                <ul>
                                    <li>RISK OF RESISTANCE: <%=Model.parentInfoPA.RiskofResistance %></li>
                                    <li>MOBILITY: <%=Model.parentInfoPA.Mobility %></li>
                                    <li>NEED FOR EXTRA HELP: <%=Model.parentInfoPA.NeedforExtraHelp %></li>
                                    <li>RESPONSE TO INSTRUCTIONS: <%=Model.parentInfoPA.ResponseToInstructions %></li>
                                    <li>CONSCIOUSNESS: <%=Model.parentInfoPA.Consciousness %></li>
                                    <li>WAKING RESPONSE: <%=Model.parentInfoPA.WakingResponse %></li>
                                </ul>

                            </td>
                        </tr>

                    </table>
                    <br />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="border: none;">
                    <table style="width: 100%;">
                        <tr>
                            <td class="boldText" colspan="2" style="background-color: #F2EEEE;">MEDICAL INFORMATION</td>
                        </tr>
                        <tr>
                            <td class="boldText"  style="width:25%;">ALLERGIES</td>
                            <td style="width:75%;"><%=Model.parentInfoPA.Allergies %></td>
                        </tr>
                        <tr>
                            <td class="boldText"  style="width:25%;">SEIZURES</td>
                            <td style="width:75%;"><%=Model.parentInfoPA.Seizures %></td>
                        </tr>
                        <tr>
                            <td class="boldText"  style="width:25%;">DIET</td>
                            <td style="width:75%;"><%=Model.parentInfoPA.Diet %></td>
                        </tr>
                        <tr>
                            <td class="boldText"  style="width:25%;">OTHER</td>
                            <td style="width:75%;"><%=Model.parentInfoPA.Other %></td>
                        </tr>
                    </table>
                    <br />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="border: none;">
                    <table style="width: 100%;">
                        <tr>
                            <td class="boldText" style="background-color: #F2EEEE;">LIFTING / TRANSFERS<span style="font-size: 10px;">(HOW DOES THIS PERSON TRANSFER, HOW ARE THEY LIFTED – IF APPLICABLE)</span></td>
                        </tr>
                        <tr>
                            <td>
                                <ul class="auto-style1">
                                    <%if (Model.parentInfoPA.LiftingOrTransfers != null)
                                      { %>
                                    <%foreach (var item in Model.parentInfoPA.LiftingOrTransfers)
                                      { %>
                                    <li><%=item.BehaviorName %></li>
                                    <%} %><%}
                                      else
                                      {%>
                                    No Data Found !!!<%} %>
                                </ul>
                            </td>
                        </tr>
                    </table>
                    <br />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="border: none;">
                    <table style="width: 100%;">
                        <tr>
                            <td class="boldText" style="background-color: #F2EEEE;">AMBULATION<span style="font-size: 10px;"> (HOW DOES THIS PERSON GET FROM PLACE TO PLACE)</span></td>
                        </tr>
                        <tr>
                            <td>
                                <ul class="auto-style1">
                                    <%if (Model.parentInfoPA.Ambulation != null)
                                      { %>
                                    <%foreach (var item in Model.parentInfoPA.Ambulation)
                                      { %>
                                    <li><%=item.BehaviorName %></li>
                                    <%}
                                      }
                                      else
                                      {%>
                                    No Data Found !!!<%} %>
                                </ul>
                            </td>
                        </tr>
                    </table>
                    <br />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="border: none;">
                    <table style="width: 100%;">
                        <tr>
                            <td class="boldText" style="background-color: #F2EEEE;">TOILETING <span style="font-size: 10px;">(GENERAL INFORMATION-WHAT ARE THEY ABLE TO DO-WHAT KIND OF SUPPORT/ASSISTANCE IS NEEDED)</span></td>
                        </tr>
                        <tr>
                            <td>
                                <ul class="auto-style1">
                                    <%if (Model.parentInfoPA.Toileting != null)
                                      { %>
                                    <%foreach (var item in Model.parentInfoPA.Toileting)
                                      { %>
                                    <li><%=item.BehaviorName %></li>
                                    <%}
                                      }
                                      else
                                      {%>
                                    No Data Found !!!<%} %>
                                </ul>
                            </td>
                        </tr>
                    </table>
                    <br />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="border: none;">
                    <table style="width: 100%;">
                        <tr>
                            <td class="boldText" style="background-color: #F2EEEE;">EATING<span style="font-size: 10px;"> (GENERAL INFORMATION-WHAT ARE THEY ABLE TO DO-WHAT KIND OF SUPPORT/ASSISTANCE IS NEEDED)</span></td>
                        </tr>
                        <tr>
                            <td>
                                <ul class="auto-style1">
                                    <%if (Model.parentInfoPA.Eating != null)
                                      { %>
                                    <%foreach (var item in Model.parentInfoPA.Eating)
                                      { %>
                                    <li><%=item.BehaviorName %></li>
                                    <%}
                                      }
                                      else
                                      {%>
                                    No Data Found !!!<%} %>
                                </ul>
                            </td>
                        </tr>
                    </table>
                    <br />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="border: none;">
                    <table style="width: 100%;">
                        <tr>
                            <td class="boldText" style="background-color: #F2EEEE;">SHOWERING<span style="font-size: 10px;"> (GENERAL INFORMATION-WHAT ARE THEY ABLE TO DO-WHAT KIND OF SUPPORT/ASSISTANCE IS NEEDED)</span></td>
                        </tr>
                        <tr>
                            <td>
                                <ul class="auto-style1">
                                    <%if (Model.parentInfoPA.Showering != null)
                                      { %>
                                    <%foreach (var item in Model.parentInfoPA.Showering)
                                      { %>
                                    <li><%=item.BehaviorName%></li>
                                    <%}
                                      }
                                      else
                                      {%>
                                    No Data Found !!!<%} %>
                                </ul>
                            </td>
                        </tr>
                    </table>
                    <br />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="border: none;">
                    <table style="width: 100%;">
                        <tr>
                            <td class="boldText" style="background-color: #F2EEEE;">TOOTHBRUSHING<span style="font-size: 10px;"> (GENERAL INFORMATION-WHAT ARE THEY ABLE TO DO-WHAT KIND OF SUPPORT/ASSISTANCE IS NEEDED)</span></td>
                        </tr>
                        <tr>
                            <td>
                                <ul class="auto-style1">
                                    <%if (Model.parentInfoPA.ToothBrushing != null)
                                      { %>
                                    <%foreach (var item in Model.parentInfoPA.ToothBrushing)
                                      { %>
                                    <li><%=item.BehaviorName %></li>
                                    <%}
                                      }
                                      else
                                      {%>
                                    No Data Found !!!<%} %>
                                </ul>
                            </td>
                        </tr>
                    </table>
                    <br />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="border: none;">
                    <table style="width: 100%;">
                        <tr>
                            <td class="boldText" style="background-color: #F2EEEE;">DRESSING <span style="font-size: 10px;">(GENERAL INFORMATION-WHAT ARE THEY ABLE TO DO-WHAT KIND OF SUPPORT/ASSISTANCE IS NEEDED)</span></td>
                        </tr>
                        <tr>
                            <td>
                                <ul class="auto-style1">
                                    <%if (Model.parentInfoPA.Dressing != null)
                                      { %>
                                    <%foreach (var item in Model.parentInfoPA.Dressing)
                                      { %>
                                    <li><%=item.BehaviorName%></li>
                                    <%}
                                      }
                                      else
                                      {%>
                                    No Data Found !!!<%} %>
                                </ul>
                            </td>
                        </tr>
                    </table>
                    <br />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="border: none;">
                    <table style="width: 100%;">
                        <tr>
                            <td class="boldText" style="background-color: #F2EEEE;">SKIN CARE/SKIN INTEGRITY <span style="font-size: 10px;">(GENERAL INFORMATION-SPECIAL CARE NEEDS-WHAT KIND OF SUPPORT/ASSISTANCE IS NEEDED)</span></td>
                        </tr>
                        <tr>
                            <td>
                                <ul class="auto-style1">
                                    <%if (Model.parentInfoPA.SkinCareOrSkinIntegrity != null)
                                      { %>
                                    <%foreach (var item in Model.parentInfoPA.SkinCareOrSkinIntegrity)
                                      { %>
                                    <li><%=item.BehaviorName%></li>
                                    <%}
                                      }
                                      else
                                      {%>
                                    No Data Found !!!<%} %>
                                </ul>
                            </td>
                        </tr>
                    </table>
                    <br />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="border: none;">
                    <table style="width: 100%;">
                        <tr>
                            <td class="boldText" style="background-color: #F2EEEE;">COMMUNICATION <span style="font-size: 10px;">(HOW DOES THIS PERSON COMMUNICATE, WORDS USED, WORDS TO AVOID, ETC)</span></td>
                        </tr>
                        <tr>
                            <td>
                                <ul class="auto-style1">
                                    <%if (Model.parentInfoPA.Communication != null)
                                      { %>
                                    <%foreach (var item in Model.parentInfoPA.Communication)
                                      { %>
                                    <li><%=item.BehaviorName%></li>
                                    <%}
                                      }
                                      else
                                      {%>
                                    No Data Found !!!<%} %>
                                </ul>
                            </td>
                        </tr>
                    </table>
                    <br />
                </td>
            </tr>
        </table>
        <br />
        <hr />
        <br />
        <table class="maintable" align="center">
            
            <tr>
                <td colspan="2" style="border: none;">
                    <br />
                    <table style="width: 100%;">
                        <tr>
                            <td colspan="4" class="boldText" style="background-color: #F2EEEE;">ADAPTIVE EQUIPMENT / HEALTH RELATED PROTECTIONS</td>
                        </tr>
                        <tr>
                            <td style="text-align: center;" class="boldText">ITEM</td>
                            <td style="text-align: center;" class="boldText">SCHEDULE FOR USE</td>
                            <td style="text-align: center;" class="boldText">STORAGE LOCATION</td>
                            <td style="text-align: center;" class="boldText">CLEANING INSTRUCTIONS</td>
                        </tr>
                        <%if (Model.parentInfoPA.AdaptiveEquip != null)
                          { %>
                        <%foreach (var item in Model.parentInfoPA.AdaptiveEquip)
                          { %>
                        <tr>
                            <td><%=item.Item%></td>
                            <td><%=item.ScheduleForUse%></td>
                            <td><%=item.StorageLocation%></td>
                            <td><%=item.CleaningInstructions%></td>
                        </tr>
                        <%}
                          }
                          else
                          {%><tr>
                              <td>No Data Found !!!</td>
                          </tr>
                        <%} %>
                    </table>
                    <br />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="border: none;">
                    <table style="width: 100%;">

                        <tr>
                            <td colspan="3" class="boldText" style="background-color: #F2EEEE;">BASIC BEHAVIORAL INFORMATION</td>
                        </tr>
                        <tr>
                            <td style="text-align: center;" class="boldText">TARGET BEHAVIOR
                                <br />
                                <span style="font-size: 10px;">(FOR ACCELERATION & DECELERATION)</span></td>
                            <td style="text-align: center;" class="boldText">DEFINITION</td>
                            <td style="text-align: center;" class="boldText">RESPONSE / STRATEGY</td>
                        </tr>
                        <%if (Model.parentInfoPA.BasicBehaviouralInfo != null)
                          { %>
                        <%foreach (var item in Model.parentInfoPA.BasicBehaviouralInfo)
                          { %>
                        <tr>
                            <td rowspan="3"><%=item.TargetBehaviour %></td>
                            <td rowspan="3"><%=item.Definition %></td>
                            <td class="boldText" style="font-size: 12px;">ANTECEDENT: <%=item.Antecedent %></td>
                        </tr>
                        <tr>
                            <td class="boldText" style="font-size: 12px;">FCT: <%=item.FCT %></td>
                        </tr>
                        <tr>
                            <td class="boldText" style="font-size: 12px;">CONSEQUENCE: <%=item.Consequence %></td>
                        </tr>
                        <%}
                          }
                          else
                          {%><tr>
                              <td>No Data Found !!!</td>
                          </tr>
                        <%} %>
                    </table>
                    <br />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="border: none;">
                    <table style="width: 50%;">
                        <tr>
                            <td class="boldText" style="background-color: #F2EEEE;">PREFERRED ACTIVITIES</td>
                        </tr>
                        <tr>
                            <td>
                                <ul class="auto-style1">
                                    <%if (Model.parentInfoPA.PreferredActivities != null)
                                      { %>
                                    <%foreach (var item in Model.parentInfoPA.PreferredActivities)
                                      { %>
                                    <li><%=item.BehaviorName%></li>
                                    <%}
                                      }
                                      else
                                      { %>No Data Found !!!<%} %>
                                </ul>
                            </td>
                        </tr>
                    </table>
                    <br />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="border: none;">
                    <table style="width: 100%;">
                        <tr>
                            <td class="boldText" style="background-color: #F2EEEE;">GENERAL INFORMATION <span style="font-size: 10px;">(IMPORTANT TO KNOW, WHAT GETS THIS PERSON UPSET, WHAT MAKES THEM HAPPY, THINGS TO WATCH OUT FOR,

ANY IMPORTANT STRUCTURE NEEDED IN THEIR DAY, ROUTINES, PREFERRED ITEMS)</span></td>
                        </tr>
                        <tr>
                            <td>
                                <ul class="auto-style1">
                                    <%if (Model.parentInfoPA.GeneralInformation != null)
                                      { %>
                                    <%foreach (var item in Model.parentInfoPA.GeneralInformation)
                                      { %>
                                    <li><%=item.BehaviorName %></li>
                                    <%}
                                      }
                                      else
                                      { %>No Data Found !!!<%} %>
                                </ul>
                            </td>
                        </tr>
                    </table>
                    <br />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="border: none;">
                    <table style="width: 100%;">
                        <tr>
                            <td class="boldText" style="background-color: #F2EEEE;">SUGGESTED PROACTIVE ENVIRONMENTAL PROCEDURES <span style="font-size: 10px;">(WHAT CAN BE DONE IN THE ENVIRONMENT TO SUPPORT THIS

PERSON, HOW SHOULD THE STAFF RESPOND IF THIS PERSON IS UPSET, ETC)</span></td>
                        </tr>
                        <tr>
                            <td>
                                <ul class="auto-style1">
                                    <%if (Model.parentInfoPA.SuggestedProactiveEnvironmentalProcedures != null)
                                      { %>
                                    <%foreach (var item in Model.parentInfoPA.SuggestedProactiveEnvironmentalProcedures)
                                      { %>
                                    <li><%=item.BehaviorName%></li>
                                    <%}
                                      }
                                      else
                                      { %>No Data Found !!!<%} %>
                                </ul>
                            </td>
                        </tr>
                    </table>
                    <br />
                </td>
            </tr>
        </table>
        <br />
        <hr />
        <br />
    </div>
    <%}
      else
      { %>
    <div>
        <h3>No Data Found !!!!</h3>
    </div>
    <%} %>
</asp:Content>
