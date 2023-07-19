<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ParentPortal.Models.ConcentModel>" %>

<table id="tblActivities" style="width: 100%; margin-left: 20px;" align="center">
        
        <tr style="border-bottom: solid; border-bottom-color: lightgrey;">
            <td style="width: 25%;"><b>Consent Form</b></td>
            <td style="width: 25%;"><b>View</b></td>
            <td style="width: 25%;"><b>Signed On</b></td>
            <td style="width: 25%;"><b>Sign</b></td>
        </tr>
        <%foreach (var Concent in Model.ConcentInfo)
          { %>
        <tr>
            <td><%=Concent.ConcentForm %></td>
            <td align="center">
            <img id="<%=Concent.ConcentId %>" src="../../Documents/Images/download.PNG" onclick="downloadFn(this.id);" /></td>
            <td><%if (Concent.SignedOn != null)
                  { %><%=Concent.SignedOn.Value.ToShortDateString() %><%} %></td>
            <td align="center">
            <img id="imgsign" src="../../Documents/Images/edit.PNG" onclick="" /></td>
            <!-----Sign Document--->
             <%--<td align="center">
             <img id="img1" src="../../Documents/Images/edit.PNG" onclick="sign(1);" /></td>--%>
        </tr>
        <%} %>
        <tr>
            <td class="pager" colspan="2" style="border-top: medium solid lightgrey; text-align: center; border-right-color: white; background-color: #F2EEEE;">
               <%-- <% Html.RenderPartial("Pager", Model.Paging); %>--%>
            </td>
            <td colspan="2" style="border-top: medium solid lightgrey; background-color: #F2EEEE;">
                
            </td>
        </tr>
    </table>