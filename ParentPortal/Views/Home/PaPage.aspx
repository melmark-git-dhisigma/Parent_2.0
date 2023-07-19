<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/ParentMaster.Master" Inherits="System.Web.Mvc.ViewPage<ParentPortal.Models.HomeModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript">

        $(document).ready(function () {
            SetColor($('#btnhome'));
        });

    </script>

    <style>
        body {
            border: 0 none;
            color: #6B6B6B;
            font-family: Arial,Helvetica,sans-serif;
            font-size: 12px;
            margin: 0;
            padding: 0;
            width: 100%;
            text-transform: none;
        }

        .clear {
            border: 0 none;
            clear: both;
            margin: 0;
            padding: 0;
        }

        div.mainContainer {
            height: auto !important;
            min-height: 500px;
            width: 100%;
        }

            div.mainContainer div.topHead {
                background: url("../images/melmarkTop.jpg") repeat-y scroll left top #00539F;
                height: 47px;
                width: 100%;
                min-width: 800px;
            }

        div.imgcorner {
            height: 100px;
            margin: 0;
            padding: 0;
            min-width: 600px;
            width: 100%;
        }

            div.imgcorner a.logo,
            div.imgcorner a.logo:link,
            div.imgcorner a.logo:visited {
                border: 0;
                margin: 15px 0 0 25px;
                display: block;
                float: left;
                width: 2220px;
                height: 58px;
                display: block;
            }

                div.imgcorner a.logo img {
                    border: 0;
                }

        div.ContentAreaContainer {
            background: #FFFFFF;
            height: auto !important;
            margin: 0 auto;
            min-height: 500px;
            min-width: 600px;
            width: 100%;
            z-index: 999;
        }

            div.ContentAreaContainer img.logo {
                display: block;
                float: left;
                margin: 10px 0 10px 10px;
            }

            div.ContentAreaContainer div.titleContainer {
                width: 250px;
                float: right;
                min-height: 50px;
                min-width: 250px;
                margin: 10px 10px 10px 0;
            }

                div.ContentAreaContainer div.titleContainer h2.ri {
                    font-family: Arial, Helvetica, sans-serif;
                    font-size: 16px !important;
                    color: #076859;
                    text-align: left;
                    text-decoration: none;
                    margin: 10px 0 5px 0 !important;
                    background: none;
                    border: none;
                    text-align: left;
                    padding: 0;
                }

                div.ContentAreaContainer div.titleContainer h3.ri {
                    background: none;
                    font-family: Arial, Helvetica, sans-serif;
                    font-size: 14px !important;
                    color: #666;
                    text-align: left;
                    text-decoration: none;
                    text-align: left;
                    padding: 0 !important;
                    margin: 0;
                }



            div.ContentAreaContainer div.middleContainer {
                float: left;
                height: auto !important;
                margin: 0 auto;
                min-height: 500px;
                min-width: 550px;
                width: 98%;
            }


            div.ContentAreaContainer h2 {
                border-bottom: 1px solid #f2f2f2;
                border-top: 1px solid #f2f2f2;
                font-size: 12px;
                font-weight: bold;
                margin: 10px auto 10px auto;
                color: #006351;
                padding: 4px 0 5px 28px;
                text-align: left;
                width: 96%;
                text-transform: none;
                letter-spacing: 1px;
            }

            div.ContentAreaContainer h3 {
                background: url("../images/aro.PNG") no-repeat scroll 8px 4px rgba(0, 0, 0, 0);
                color: #666666;
                font-size: 12px;
                font-weight: bold;
                margin: 0 0 10px 12px;
                padding: 4px 0 5px 28px;
                text-align: left;
                width: 98%;
            }

            div.ContentAreaContainer h4 {
                color: #e23d29;
                font-size: 12px;
                font-weight: bold;
                margin: 0 0 10px 12px;
                padding: 4px 0 5px 15px;
                text-align: left;
                width: 98%;
            }

            div.ContentAreaContainer p {
                font-size: 12px;
                font-weight: normal;
                margin: 10px auto 10px;
                color: #666;
                padding: 4px 0 5px 15px;
                text-align: justify;
                width: 96%;
                line-height: 18px;
            }

            div.ContentAreaContainer table {
                margin: 0 auto !important;
                padding: 0;
                width: 98%;
                min-width: 600px;
            }

                div.ContentAreaContainer table.shot {
                    width: 60%;
                    margin: 0 auto;
                }

                div.ContentAreaContainer table.medium {
                    width: 85%;
                    margin: 0 auto;
                }

                div.ContentAreaContainer table td {
                    border-bottom: 1px solid #EDEDED;
                    border-left: 1px solid #EDEDED;
                    font-size: 11px;
                    font-weight: bold;
                    padding: 5px 1%;
                    min-width: 95px;
                }

                    div.ContentAreaContainer table td span {
                        text-align: right !important;
                        float: right;
                    }

                    div.ContentAreaContainer table td.top {
                        border-top: 1px solid #ededed;
                    }

                    div.ContentAreaContainer table td.bg {
                        background: #f9f9f9;
                        height: 20px;
                    }

                    div.ContentAreaContainer table td.righ {
                        border-right: 1px solid #ededed;
                    }

                    div.ContentAreaContainer table td img.im {
                        margin: 5px auto !important;
                        text-align: center;
                        border: 3px solid #ededed;
                        display: block;
                    }


                    div.ContentAreaContainer table td input.chkbx {
                        margin: 3px 0 0 0;
                        padding: 0;
                        float: left;
                    }

                    div.ContentAreaContainer table td select.dob {
                        background-color: #FFFFFF;
                        border: 1px solid #DADAC8;
                        border-radius: 3px 3px 3px 3px;
                        color: #666666;
                        font-size: 11px;
                        height: 25px !important;
                        padding: 4px 4px 2px;
                        margin: 0 0 0 5px;
                        min-width: 15px;
                        width: 25%;
                    }

                    div.ContentAreaContainer table td select.selbox {
                        background-color: #FFFFFF;
                        border: 1px solid #DADAC8;
                        border-radius: 3px 3px 3px 3px;
                        color: #666666;
                        font-size: 11px;
                        height: 25px !important;
                        padding: 4px 4px 2px;
                        width: 100% !important;
                        margin: 0 0 0 5px;
                    }

                    div.ContentAreaContainer table td textarea.txarea {
                        background-color: #FFFFFF;
                        border: 1px solid #DADAC8;
                        border-radius: 3px 3px 3px 3px;
                        color: #666666;
                        float: left;
                        font-size: 11px;
                        height: 65px;
                        margin: 0 0 0 5px;
                        min-width: 72px !important;
                        padding: 2px 4px;
                        width: 92%;
                    }



                div.ContentAreaContainer table.bdrtble {
                    border: 1px solid #EDEDED;
                    border-bottom: none;
                    border-left: 0;
                    width: 95%;
                    margin: 0 auto !important;
                    min-width: 250px;
                }

                    div.ContentAreaContainer table.bdrtble tr th {
                        background: #91bfbd;
                        color: #000;
                        text-align: left;
                        padding: 5px 5px;
                    }

                div.ContentAreaContainer table.nobder {
                    border: 0;
                }

                div.ContentAreaContainer table bdrtble tr td {
                    border: 0 !important;
                }

                div.ContentAreaContainer table.bdrtble tr td h4.title {
                    font-size: 12px;
                    color: #666;
                    margin: 0 0 0 0;
                    padding: 0;
                    float: left;
                    font-weight: bold !important;
                    text-align: left;
                }



                div.ContentAreaContainer table.bdrtble input.textfield {
                    background-color: #FFFFFF;
                    border: 1px solid #DADAC8;
                    border-radius: 3px 3px 3px 3px;
                    color: #666666;
                    float: left;
                    font-size: 11px;
                    height: 19px;
                    margin: 0 0 0 6px;
                    min-width: 72px !important;
                    padding: 2px 4px;
                    width: 92%;
                }

                div.ContentAreaContainer table.bdrtble td label.title {
                    margin: 0 0 0 5px;
                    padding: 3px 0 5px 0;
                    display: block;
                }
    </style>
    <div class="ContentAreaContainer">
        <div class="clear"></div>
        <div class="titleContainer">
            <a href="../Home/btnExport/" target="_blank" style="float: right; color: Blue; text-decoration: underline;">Export</a>
        </div>
        <div class="clear"></div>
        <table border="0" cellpadding="0" cellspacing="0" class="bdrtble">
            <%if (Model.parentInfoPA != null)
              {
                  string result = "";
            %>
            <tr>
                <td colspan="2" width="70%">
                    <h3>CLIENT PROFILE / PROTOCOL SUMMARY</h3>
                </td>
                <% if (Model.parentInfoPA.AdmissionDate != null)
                   {
                       DateTime date = (DateTime)Model.parentInfoPA.AdmissionDate;
                       result = date.ToString("MM/dd/yyyy").Replace('-', '/');
                   }      %>
                <td>DATE UPDATED : <%=result %></td>
            </tr>
            <tr>
                <td>NAME : <%=Model.parentInfoPA.LastName%>,<%=Model.parentInfoPA.FirstName %>,<%=Model.parentInfoPA.MiddleName %></td>
                <%if (Model.parentInfoPA.Gender == "1")
                      Model.parentInfoPA.Gender = "Male";
                  else
                      Model.parentInfoPA.Gender = "Female";
                %>
                <td>GENDER : <%=Model.parentInfoPA.Gender %></td>
                <% if (Model.parentInfoPA.DOB != null)
                   {
                       DateTime date = (DateTime)Model.parentInfoPA.DOB;
                       result = date.ToString("MM/dd/yyyy").Replace('-', '/');
                   }                    %>
                <td>DATE OF BIRTH : <% =result%></td>
            </tr>
        </table>
        <h2>CONTACT INFORMATION
        </h2>

        <table border="0" cellpadding="0" cellspacing="0" style="border: 0;" class="nobder">
            <tr>
                <td width="100%" style="float: left; border: 0;">
                    <table border="0" cellpadding="0" cellspacing="0" class="bdrtble">
                        <tr>
                            <td colspan="2">
                                <h4 class="title">RESIDENT / INDIVIDUAL</h4>
                            </td>

                        </tr>
                        <tr>
                            <td>CURRENT ADDRESS:</td>
                            <td><%=Model.parentInfoPA.Address1 %>,<%=Model.parentInfoPA.Address2 %>,<%=Model.parentInfoPA.Address3 %></td>

                        </tr>


                        <tr>
                            <td>PHONE NUMBER:</td>
                            <td><%=Model.parentInfoPA.PhoneNumber %></td>

                        </tr>
                        <tr>
                            <td>FUNDING SOURCE:</td>
                            <td><%=Model.parentInfoPA.FundingSource %></td>
                        </tr>
                    </table>
                </td>
                <td width="100%" style="float: right; border: 0;">
                    <%if (Model.parentInfoPA.PrimaryCntct != null)
                      {%>
                    <table border="0" cellpadding="0" cellspacing="0" class="bdrtble">
                        <tr>
                            <td colspan="2">
                                <h4 class="title">PRIMARY CONTACT</h4>
                            </td>
                        </tr>
                        <tr>
                            <td>CURRENT ADDRESS:</td>
                            <td><%=Model.parentInfoPA.PrimaryCntct.Address1 %>,<%=Model.parentInfoPA.PrimaryCntct.Address2 %>,<%=Model.parentInfoPA.PrimaryCntct.Address3 %></td>
                        </tr>

                        <tr>
                            <td>HOME PHONE #:</td>
                            <td><%=Model.parentInfoPA.PrimaryCntct.HomePhone %></td>
                        </tr>
                        <tr>
                            <td>WORK PHONE #:</td>
                            <td><%=Model.parentInfoPA.PrimaryCntct.WorkPhone%></td>
                        </tr>
                        <tr>
                            <td>CELL PHONE #:</td>
                            <td><%=Model.parentInfoPA.PrimaryCntct.CellPhone%></td>
                        </tr>
                        <tr>
                            <td>E-MAIL ADDRESS:</td>
                            <td><%=Model.parentInfoPA.PrimaryCntct.Email%></td>
                        </tr>
                    </table>
                    <%} %>
                </td>
            </tr>
            <tr>
                <td width="48%" style="float: left; border: 0;">
                    <%if (Model.parentInfoPA.LegalGrdn1 != null)
                      {%>
                    <table border="0" cellpadding="0" cellspacing="0" class="bdrtble">
                        <tr>
                            <td colspan="2">
                                <h4 class="title">LEGAL GUARDIAN</h4>
                            </td>
                        </tr>
                        <tr>
                            <td>CURRENT ADDRESS:</td>
                            <td><%=Model.parentInfoPA.LegalGrdn1.Address1 %>,<%=Model.parentInfoPA.LegalGrdn1.Address2 %>,<%=Model.parentInfoPA.LegalGrdn1.Address3 %></td>
                        </tr>
                        <tr>
                            <td>HOME PHONE #:</td>
                            <td><%=Model.parentInfoPA.LegalGrdn1.HomePhone%></td>
                        </tr>
                        <tr>
                            <td>WORK PHONE #:</td>
                            <td><%=Model.parentInfoPA.LegalGrdn1.WorkPhone%></td>
                        </tr>
                        <tr>
                            <td>CELL PHONE #:</td>
                            <td><%=Model.parentInfoPA.LegalGrdn1.CellPhone%></td>
                        </tr>
                        <tr>
                            <td>E-MAIL ADDRESS:</td>
                            <td><%=Model.parentInfoPA.LegalGrdn1.Email%></td>
                        </tr>
                    </table>
                    <%} %>
                </td>
                <td width="48%" style="float: right; border: 0;">
                    <%if (Model.parentInfoPA.LegalGrdn2 != null)
                      {%>
                    <table border="0" cellpadding="0" cellspacing="0" class="bdrtble">
                        <tr>
                            <td colspan="2">
                                <h4 class="title">LEGAL GUARDIAN</h4>
                            </td>
                        </tr>

                        <tr>
                            <td>CURRENT ADDRESS:</td>
                            <td><%=Model.parentInfoPA.LegalGrdn2.Address1 %>,<%=Model.parentInfoPA.LegalGrdn2.Address2 %>,<%=Model.parentInfoPA.LegalGrdn2.Address3 %></td>
                        </tr>

                        <tr>
                            <td>HOME PHONE #:</td>
                            <td><%=Model.parentInfoPA.LegalGrdn2.HomePhone %></td>
                        </tr>
                        <tr>
                            <td>WORK PHONE #:</td>
                            <td><%=Model.parentInfoPA.LegalGrdn2.WorkPhone %></td>
                        </tr>
                        <tr>
                            <td>CELL PHONE #:</td>
                            <td><%=Model.parentInfoPA.LegalGrdn2.CellPhone %></td>
                        </tr>
                        <tr>
                            <td>E-MAIL ADDRESS:</td>
                            <td><%=Model.parentInfoPA.LegalGrdn2.Email %></td>
                        </tr>
                    </table>

                    <%} %>

                </td>
            </tr>

            <tr>
                <td width="48%" style="float: left; border: 0;">
                    <%if (Model.parentInfoPA.SupportCord != null)
                      {%>
                    <table border="0" cellpadding="0" cellspacing="0" class="bdrtble">
                        <tr>
                            <td colspan="2">
                                <h4 class="title">SUPPORT COORDINATOR</h4>
                            </td>
                        </tr>
                        <tr>
                            <td>CURRENT ADDRESS:</td>
                            <td><%=Model.parentInfoPA.SupportCord.Address1 %>,<%=Model.parentInfoPA.SupportCord.Address2 %>,<%=Model.parentInfoPA.SupportCord.Address3 %></td>
                        </tr>
                        <tr>
                            <td>HOME PHONE #:</td>
                            <td><%=Model.parentInfoPA.SupportCord.HomePhone %></td>
                        </tr>
                        <tr>
                            <td>CELL PHONE #:</td>
                            <td><%=Model.parentInfoPA.SupportCord.CellPhone %></td>
                        </tr>
                        <tr>
                            <td>E-MAIL ADDRESS:</td>
                            <td><%=Model.parentInfoPA.SupportCord.Email %></td>
                        </tr>
                    </table>
                    <%} %>
                </td>
                <td width="48%" style="float: right; border: 0;">
                    <%if (Model.parentInfoPA.Advocate != null)
                      {%>
                    <table border="0" cellpadding="0" cellspacing="0" class="bdrtble">
                        <tr>
                            <td colspan="2">
                                <h4 class="title">ADVOCATE</h4>
                            </td>
                        </tr>
                        <tr>
                            <td>CURRENT ADDRESS:</td>
                            <td><%=Model.parentInfoPA.Advocate.Address1 %>,<%=Model.parentInfoPA.Advocate.Address2 %>,<%=Model.parentInfoPA.Advocate.Address3 %></td>
                        </tr>
                        <tr>
                            <td>HOME PHONE #:</td>
                            <td><%=Model.parentInfoPA.Advocate.HomePhone %></td>
                        </tr>
                        <tr>
                            <td>CELL PHONE #:</td>
                            <td><%=Model.parentInfoPA.Advocate.CellPhone %></td>
                        </tr>
                        <tr>
                            <td>E-MAIL ADDRESS:</td>
                            <td><%=Model.parentInfoPA.Advocate.Email %></td>
                        </tr>
                    </table>
                    <%} %>
                </td>
            </tr>
        </table>
        <br />
        <table border="0" cellpadding="0" cellspacing="0" class="bdrtble">

            <tr>
                <td colspan="2">DIAGNOSES:</td>
            </tr>
            <%if (Model.parentInfoPA.Diagnoses != null)
              {
                  foreach (var item in Model.parentInfoPA.Diagnoses)
                  {
		 
	
            %>
            <tr>
               <%-- <td><%=item.DiagnosesId %></td>--%>
                <td><%=item.DiagnosesName %></td>
            </tr>

            <%
                  }
              }
              else
              {
            %>
            <tr>
                <td>No Data Found</td>
            </tr>
            <%} %>
        </table>
        <br />
        <table border="0" cellpadding="0" cellspacing="0" class="bdrtble">
            <tr>
                <th colspan="3">BASIC BEHAVIORAL INFORMATION</th>

            </tr>
            <tr>
                <td>TARGET BEHAVIOR(FOR ACCELERATION & DECELERATION)</td>
                <td>DEFINITION</td>
                <td>RESPONSE / STRATEGY</td>
            </tr>
            <%
                  if (Model.parentInfoPA.BasicBehaviouralInfo != null)
                  {
                      foreach (var item in Model.parentInfoPA.BasicBehaviouralInfo)
                      {
		 
            %>
            <tr>
                <td rowspan="3"><%=item.TargetBehaviour %></td>
                <td rowspan="3"><%=item.Definition %></td>
                <td>ANTECEDENT:<%=item.Antecedent %></td>
            </tr>
            <tr>
                <td>FCT:<%=item.FCT %> </td>
            </tr>
            <tr>
                <td>CONSEQUENCE:<%=item.Consequence %>  </td>
            </tr>
            <%}
                  }
                  else
                  { %>
            <tr>
                <td>No Data Found</td>
            </tr>
            <%} %>


            <br />
            <table border="0" cellpadding="0" cellspacing="0" class="bdrtble">
                <tr>
                    <th>PREFERRED ACTIVITIES </th>
                </tr>
                <tr>

                    <%
                  if (Model.parentInfoPA.PreferredActivities != null)
                  {
                      if (Model.parentInfoPA.PreferredActivities.Count() != 0)
                      {
                          foreach (var item in Model.parentInfoPA.PreferredActivities)
                          {
		 
                    %>
                    <td><%=item.BehaviorName%></td>

                    <%}
                      }
                      else
                      {
                    %>
                    <td>No Data Found</td>
                    <%
                      }
                  } %>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <br />
            <table border="0" cellpadding="0" cellspacing="0" class="bdrtble">
                <tr>
                    <th>GENERAL INFORMATION (IMPORTANT TO KNOW, WHAT GETS THIS PERSON UPSET, WHAT MAKES THEM HAPPY, THINGS TO WATCH OUT FOR, ANY IMPORTANT STRUCTURE NEEDED IN THEIR DAY, ROUTINES, PREFERRED ITEMS) </th>
                </tr>
                <tr>
                    <%
                  if (Model.parentInfoPA.GeneralInformation != null)
                  {
                      if (Model.parentInfoPA.GeneralInformation.Count() != 0)
                      {
                          foreach (var item in Model.parentInfoPA.GeneralInformation)
                          {
		 
                    %>
                    <td><%=item.BehaviorName%></td>

                    <%}
                      }
                      else
                      {
                    %>
                    <td>No Data Found</td>
                    <%
                      }
                  }%>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <br />
            <table border="0" cellpadding="0" cellspacing="0" class="bdrtble">
                <tr>
                    <th>SUGGESTED PROACTIVE ENVIRONMENTAL PROCEDURES (WHAT CAN BE DONE IN THE ENVIRONMENT TO SUPPORT THIS PERSON, HOW SHOULD THE STAFF RESPOND IF THIS PERSON IS UPSET, ETC)</th>
                </tr>
                <tr>
                    <%
                  if (Model.parentInfoPA.SuggestedProactiveEnvironmentalProcedures != null)
                  {
                      if (Model.parentInfoPA.SuggestedProactiveEnvironmentalProcedures.Count() != 0)
                      {
                          foreach (var item in Model.parentInfoPA.SuggestedProactiveEnvironmentalProcedures)
                          {
		 
                    %>
                    <td><%=item.BehaviorName%></td>

                    <%}
                      }
                      else
                      {
                    %>
                    <td>No Data Found</td>
                    <%
                      }
                  }%>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
            </table>

            <br />
            <table border="0" cellpadding="0" cellspacing="0" class="bdrtble">
                <tr>
                    <td>
                        <h4 class="title">CLIENT PROFILE / PROTOCOL SUMMARY RESPONSIBILITIES</h4>
                        <p>Prior to working with an individual, you must first be trained on the person’s profile/protocol summary. This document is updated on an “as needed” basis, and re-issued with a new “updated” date at the top of the document.  The most recent changes will be reviewed and/or highlighted when the change occurs.  </p>
                        <p>
                            Please REVIEW protocol changes with someone in a supervisory position (i.e., Directors, Assistant Directors, Program Managers, Behavior Analysts, Voc Instructors, RSS’s, or Case Managers) before working with this individual.  When you are trained in this new protocol, you and your trainer must sign this sheet below.
                        </p>
                        <h4 class="title">Please note:</h4>
                        <p>
                            1.	Each time the individual’s profile/protocol summary is updated or reissued, all staff working with an individual need to be retrained on the profile/protocol summary. Each time you are trained, you and the trainer will need to sign the training log below. 
                        </p>
                        <p>
                            2.	Contact a supervisor for clarifications on any questions you have while working with an individual.
                        </p>
                        <p>
                            3.	Never transfer LOS to another staff member without assuring the person’s explicit agreement to assume LOS. 
                        </p>
                    </td>
                </tr>
            </table>
            <br />
            <table border="0" cellpadding="0" cellspacing="0" class="bdrtble">
                <tr>
                    <td>PRINT NAME</td>
                    <td>SIGNATURE</td>
                    <td>TRAINER</td>
                    <td>DATE</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <div class="clear"></div>
            <%}
              else
              { %>
            <tr>
                <td>No Data Found</td>
            </tr>
            <%} %>
    </div>
</asp:Content>
