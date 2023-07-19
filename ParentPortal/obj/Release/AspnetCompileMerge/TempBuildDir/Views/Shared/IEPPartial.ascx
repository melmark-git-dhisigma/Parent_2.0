<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ParentPortal.Models.IEPModel>" %>
<div id="partialMainArea">
    
    <table id="tblIEPs" style="width: 100%; margin-left: 20px;" align="center">

        <tr style="border-bottom: solid; border-bottom-color: lightgrey;">
            <td style="width: 20%;"><b>Year</b></td>
            <td style="width: 20%;"><b>Start Date</b></td>
            <td style="width: 20%;"><b>End Date</b></td>
            <td style="width: 10%;"><b>Status</b></td>
            <td style="width: 10%;"><b>View</b></td>
            <td style="width: 10%;"><b>Sign</b></td>
            <td style="width: 10%;"><b>Sign Details</b></td>
        </tr>
        <%foreach (var IEP in Model.IEPInfo)
          {
              var Id = IEP.IEPId;
              
              %>

        <tr>
            <td><%=IEP.IEPYear %></td>
            <td><%if (IEP.StartDate != null)
                  { %><%=IEP.StartDate.Value.ToShortDateString() %><%} %></td>
            <td><%if (IEP.EndDate != null)
                  { %><%=IEP.EndDate.Value.ToShortDateString() %><%} %></td>
            <td><%=IEP.Status %></td>
            <td align="center">
            <img id="<%=Id %>" src="../../Documents/Images/download.PNG" onclick="downloadFn(this.id);" /></td>
            <%--  <img id="Img1" src="../../Documents/Images/edit.PNG" onclick="sign(<%=Id %>)" /></td>
            <td align="center">
            <img id="Img2" src="../../Documents/Images/edit.PNG" onclick="" /></td>     --%>
            <!-----Sign document----->

            <td align="center">
            <img id="<%=IEP.IEPId %>" src="../../Documents/Images/edit.PNG" onclick="sign(this.id);" /></td>
            <td align="center">
            <img id="Sign<%=Id %>" src="../../Documents/Images/edit.PNG" onclick="Viewsign(this.id);" /></td>                  
        </tr>
        <%} %>
        <tr>
            <td class="pager" colspan="4" style="border-top: medium solid lightgrey; text-align: center; border-right-color: white; background-color: #F2EEEE;">
                <% Html.RenderPartial("Pager", Model.Paging, new ViewDataDictionary { { "Filter", Model.Paging.FilterStatus }, { "Keyword", Model.Paging.SearchKeyword } }); %>
                    
            </td>
            <td colspan="3" style="border-top: medium solid lightgrey; background-color: #F2EEEE;">
                <i style="float: right;">You are viewing page <%: Model.Paging.CurrentPageIndex %> of <%: Model.Paging.PageCount %>...</i>
            </td>
        </tr>
    </table>


    <div id="overlay" class="web_dialog_overlay">
    </div>
     <div id="dialog" class="web_dialog" style="width: 711px;display:none;top:20%">
                <div id="sign_up5">
                    <a id="close_x" class="close sprited1" href="#" style="margin-top: -13px; margin-right: -14px;">
                        <img src="../../Documents/Images/button_red_close.png" style="float: right; margin-right: 0px; margin-top: 0px; z-index: 300" width="18" height="18" alt="" /></a>
                    <h3>Sign Details
              </h3>
                    <hr />
                    
                   <table>
                       <tr>
                           <td id="tblSigned"></td>
                       </tr>

                  
 
                 </table>  
                       
                </div>
            </div>

</div>
