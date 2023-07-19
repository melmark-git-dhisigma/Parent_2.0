<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/ParentMaster.Master" Inherits="System.Web.Mvc.ViewPage<ParentPortal.Models.ConcentModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ConcentList
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
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            SetColor($('#btnconcent'));
        });
        function downloadFn(id) {
            window.open('/Concent/DownloadDoc?id=' + id + '   ', '_self');
        }
        function sign(id) {
            window.open('/Concent/SignDoc?id=' + id + '   ', '_self');
        }
    </script>
    <h4>&nbsp;&nbsp;&nbsp;&nbsp;Consent Forms</h4>
    <div class="clear"></div>
    <form>
        <table style="width: 95%; margin-left: 20px;" align="center">
            <tr>
                <td style="border: none; width: 20%;"><b><%=Html.TextBoxFor(search => search.Paging.SearchKeyword, new { style="width:90%;",id="btnSearch" })%></b></td>
                <td style="border: none; width: 10%;"><%using (Html.BeginForm("ConcentList", "Concent", FormMethod.Get))
                                                        { %>
                    <input type="submit" value="Search" name="edit" />
                    <% } %></td>
                <%--<td style="border: none; width: 30%; text-align: right;" colspan="2">Status </td>--%>

                <%--<td style="border: none; width: 10%;"><%=Html.DropDownListFor(model => model.Paging.FilterStatus, (IEnumerable<SelectListItem>)ViewBag.StatusLists, "--Select Status--",new { onchange="this.form.submit();",id="ddlFilter" }) %></td>--%>

            </tr>
        </table>
    </form>
    <div id="displayArea">
        <% 
            Html.RenderPartial("ConcentPartial", Model); %>
    </div>
</asp:Content>
