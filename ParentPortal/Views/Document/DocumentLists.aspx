<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/ParentMaster.Master" Inherits="System.Web.Mvc.ViewPage<ParentPortal.Models.DocumentModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    DocumentLists
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
        .auto-style1 {
            width: 284px;
        }
        #file {
            width: 309px;
        }
    </style>
   
    <script type="text/javascript">
        function Validate() {
            var file = $('input[type="file"]').val();
            var exts = ['doc', 'docx', 'rtf', 'txt','pdf'];

            if ($('#btnDocName').val() == "") {
                alert("Please enter document name");
                return false;

            } else if ($('#ddlType option:selected').val() == "") {
                alert("Please select document type");
                return false;
            }


            // first check if file field has any value
            if (file) {
                // split file name at dot
                var get_ext = file.split('.');
                // reverse name to check extension
                get_ext = get_ext.reverse();
                // check file type is valid as given in 'exts' array
                if ($.inArray(get_ext[0].toLowerCase(), exts) > -1) {
                
                } else {
                    alert('Invalid file!');
                    return false;
                }
            } else {
                alert("Select file");
                return false;
            }


        }


        $(document).ready(function () {
            SetColor($('#btndoc'));
        });

        function downloadFn(id) {
            window.open('/Document/DownloadDoc?id=' + id + '   ', '_self');
        }
        function deleteFn(id) {
            window.open('/Document/DeleteDoc?id=' + id + '   ', '_self');
        }

        function displayDiv() {
            if (($('#ddlType :selected').text() == "Other"))
                $('#shwtxt').show();
            //else
            //    $('#showtxt').hide();

        }

    </script>
    <%--<div align="center"><b>Documents</b></div>--%>
    <h4>&nbsp;&nbsp;&nbsp;&nbsp;Documents</h4>
    <div class="clear"></div>
    <form>
        <table id="tblDocuments" style="width: 95%; margin-left: 20px;" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td style="border: none; width: 20%;"><b><%=Html.TextBoxFor(search => search.Paging.SearchKeyword, new { style="width:90%;",id="btnSearch" })%></b></td>
                <td style="border: none; width: 10%;"><%using (Html.BeginForm("DocumentLists", "Document", FormMethod.Get))
                                                        { %>
                    <input type="submit" value="Search" name="edit" />
                    <% } %></td>
               <%-- <td style="border: none; text-align: right; width: 10%;" colspan="2">Type </td>--%>
                <td style="border: none; width: 10%;"></td>
            </tr>
        </table>
    </form>
    <div id="displayArea" style="min-height: 200px;">
        <% 
            Html.RenderPartial("DocumentPartial", Model); %>
    </div>
    <table style="width: 95%; margin-left: 20px;" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td colspan="4" style="border: none;">
                <br />
            </td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: left; border-color: #F2EEEE; background-color: #F2EEEE;"><b>Select Document</b></td>
        </tr>
        <%using (Html.BeginForm("Upload", "Document", FormMethod.Post, new { enctype = "multipart/form-data" }))
          { %>
        <tr>
            <td style="border: none;width:15%">Document Name</td>
            <td colspan="3" style="border: none;"><%=Html.TextBoxFor(name=>name.DocumentName,Model.DocumentName, new { style="width:50%;",id="btnDocName" })%></td>
            <td style="border: none;"></td>
        </tr>
        <tr>


            <td style="border: none;width:15%" >Document Type</td>
            <td id="showtxt" style="border: none;"><%=Html.DropDownListFor(model => model.DocumentType, (IEnumerable<SelectListItem>)ViewBag.TypeLists, "--Select Type--",new {@class = "validate[required] ", id="ddlType", onChange = "displayDiv()" }) %>
             <div id="shwtxt" style="display:none; float:right;width:298px;position:initial;">
                  Other Type(Specify)<span style="color: red;">*</span>
                 <span style="float:right;"> <%=Html.TextBoxFor(m => m.Other,new { @class = "validate[required] ", ID = "ddlDocumentTypeTxt",value=Model.Other })%></span>
                  </div>
            </td>
            <td style="border: none;"></td>
         </tr>
        <tr>
           <td style="border: none;"></td>
            <td style="border: none;"></td>
            <td style="border: none;"></td>
        </tr>
         <tr>
             <td style="border: none;"></td>
            <td style="border: none;">
                <input type="file" name="Upfile" id="file" /></td>
            <td style="border: none;">
                <input type="submit" value="Add" name="Add" style="width: 80px;" onclick="Validate();" />
            </td>

        </tr>

        <tr>
            <td class="pager" colspan="3" style="border-top: medium solid lightgrey; text-align: center; border-right-color: white; background-color: #F2EEEE;">
            <td colspan="2" style="border-top: medium solid lightgrey; background-color: #F2EEEE;">
        </tr>
        <%} %>
        <%--<tr style="border-bottom: solid; border-bottom-color: lightgrey;">
            <td colspan="3" style="border: none;"></td>
            <td style="border: none;">
                <input type="button" value="Save" style="width: 80px;" /></td>
        </tr>--%>
    </table>
    <div class=" clear"></div>
    <div class=" clear"></div>
    <div class=" clear"></div>
    <div class=" clear"></div>
</asp:Content>
