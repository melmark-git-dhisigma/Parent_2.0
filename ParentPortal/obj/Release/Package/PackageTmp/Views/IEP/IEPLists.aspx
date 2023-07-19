<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/ParentMaster.Master" Inherits="System.Web.Mvc.ViewPage<ParentPortal.Models.IEPModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    IEPLists
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

        .web_dialog_overlay {
    position: fixed;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    height: 100%;
    width: 100%;
    margin: 0;
    padding: 0;
    background: #000000;
    opacity: .15;
    filter: alpha(opacity=15);
    -moz-opacity: .15;
    z-index: 101;
    display: none;
}

.web_dialog {
    display: block;
    position: fixed;
    width: 800px;
    height: auto;
    top: 40%;
    left: 40%;
    margin-left: -190px;
    font-size: 100%;
    font-family: Arial, Helvetica, sans-serif;
    color: #333;
    z-index: 999;
    background: #f8f7fc url(../../Documents/Images/smllogo.JPG) right bottom no-repeat;
    padding: 5px 5px 30px 5px;
    border: 5px solid #b2ccca;
}

    .web_dialog hr {
    
        margin-top: 5px;
        padding: 1px;
        background-color: #B6D1DD;
    }
    </style>
    <%{ ViewBag.Filter = ""; } %>
    <script type="text/javascript">
        $(document).ready(function () {
            SetColor($('#btniep'));
        });

        $(document).ready(function () {
            $('#close_x').click(function () {
                $('#dialog').fadeOut('slow', function () {
                    $('#overlay').fadeOut('slow');
                });
            });
        });


        



        function downloadFn(id) {           
            window.open('/IEP/DownloadDoc?id=' + id + '   ', '_self');
        }
        function sign(id) {
            window.open('/IEP/SignDoc?id=' + id + '   ', '_self');
        }
        function Viewsign(signid) {
          
            var id = signid.split('Sign');
            $.get("/IEP/GetSignedUsers?IEPId=" + id[1], function (result) {
           
                var temp = document.getElementById('tblSigned');
                temp.innerHTML = result;
                // $('#tblSigned').val()
                $('#overlay').fadeIn('slow', function () {
                    $('#dialog').fadeIn('slow');
                });
            });
        }
    </script>
    <h4>&nbsp;&nbsp;&nbsp;&nbsp;IEP's</h4>
    <div class="clear"></div>
    <form>
        <table style="width: 95%; margin-left: 20px;" align="center">
            <tr>
                <td style="border: none; width: 20%;"><b><%=Html.TextBoxFor(search => search.Paging.SearchKeyword, new { style="width:90%;",id="btnSearch" })%></b></td>
                <td style="border: none; width: 10%;"><%using (Html.BeginForm("IEPLists", "IEP", FormMethod.Get))
                                                        { %>
                    <input type="submit" value="Search" name="edit" />
                    <% } %></td>
            <%--    <td style="border: none; width: 10%; text-align: right;" colspan="2">Status </td>--%>

<%--                <td style="border: none; width: 10%;"><%=Html.DropDownListFor(model => model.Paging.FilterStatus, (IEnumerable<SelectListItem>)ViewBag.StatusLists, "--Select Status--",new { onchange="this.form.submit();",id="ddlFilter" }) %></td>--%>

            </tr>
        </table>
    </form>
    <%--<%using (@Ajax.BeginForm("IEPLists", "IEP", new AjaxOptions { UpdateTargetId = "partialMainArea" }, new { id = "divIEP", enctype = "multipart/form-data" }))
      { %>--%>
    <%--<%using (Html.BeginForm("IEPLists", "IEP", FormMethod.Post))
      { %>--%>
    <%--<div id="partialMainArea">
        <table id="tblIEPs" style="width: 80%;" align="center">

            <tr style="border-bottom: solid; border-bottom-color: lightgrey;">
                <td style="width: 40%;"><b>Year</b></td>
                <td style="width: 20%;"><b>Start Date</b></td>
                <td style="width: 20%;"><b>End Date</b></td>
                <td style="width: 10%;"><b>Status</b></td>
                <td style="width: 10%;"><b>View</b></td>
            </tr>
            <%foreach (var IEP in Model.IEPs)
              { %>
            <tr>
                <td><%=IEP.IEPYear %></td>
                <td><%if (IEP.StartDate != null)
                      { %><%=IEP.StartDate.Value.ToShortDateString() %><%} %></td>
                <td><%if (IEP.EndDate != null)
                      { %><%=IEP.EndDate.Value.ToShortDateString() %><%} %></td>
                <td><%=IEP.Status %></td>
                <td></td>
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
        </table>
    </div>--%>
        
       
    <div id="displayArea">
        <% 
            Html.RenderPartial("IEPPartial", Model); %>
    </div>

    <%-- <%} %>--%>
   
  

        



</asp:Content>
