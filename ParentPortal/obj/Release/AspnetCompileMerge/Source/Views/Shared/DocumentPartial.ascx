<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ParentPortal.Models.DocumentModel>" %>

<table id="tblDocs" style="width: 100%; margin-left: 20px;" align="center">

    <tr style="border-bottom: solid; border-bottom-color: lightgrey;">
        <td style="width: 25%;"><b>Document Type</b></td>
        <td style="width: 25%;"><b>Document Name</b></td>
        <td style="width: 20%;"><b>UserType</b></td>
        <td style="width: 15%;"><b>View</b></td>
        
    </tr>
    <%foreach (var Doc in Model.DocumentInfo)
      { %>
    <tr>
        <td><%=Doc.DocumentType %></td>
        <td><%=Doc.DocumentName %></td>
        <td><%=Doc.UserType %></td>
        <td align="center">
            <img id="<%=Doc.DocumentId %>" src="../../Documents/Images/download.PNG" onclick="downloadFn(this.id);" /></td>
        
    </tr>
    <%} %>
    <tr>
        <td class="pager" colspan="3" style="border-top: medium solid lightgrey; text-align: center; border-right-color: white; background-color: #F2EEEE;">
         <%--   <% Html.RenderPartial("Pager", Model.Paging); %>--%>
        </td>
        <td colspan="2" style="border-top: medium solid lightgrey; background-color: #F2EEEE;">
            <i style="float: right;"><%--You are viewing page <%: Model.Paging.CurrentPageIndex %> of <%: Model.Paging.PageCount %>...--%></i>
        </td>
    </tr>

</table>
