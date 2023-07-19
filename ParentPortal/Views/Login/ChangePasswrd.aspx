<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/ParentMaster.Master" Inherits="System.Web.Mvc.ViewPage<ParentPortal.Models.LoginModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
   
    
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            SetColor($('#btncpswd'));
        });

        $(document).ready(function () {
             $('#FormChngPwd').validationEngine();
            //document.getElementById('FormChngPwd').validationEngine();

        });

    </script>
    <h4>&nbsp;&nbsp;&nbsp;&nbsp;Change Password</h4>
    <div class="clear"></div>
    <%using (@Html.BeginForm("ChangePasswrd", "Login", FormMethod.Post, new { id = "FormChngPwd", enctype = "multipart/form-data" }))
      { %>
    <div id="Content">
        
        <table style="padding-top: 10px; width: 100%;">
            <tr>
                <td align="right" width="20%">Old Password : </td>
                <td><%=Html.PasswordFor(oldPwd=>oldPwd.Password) %></td>
                <td></td>
            </tr>
            <tr>
                <td align="right" width="20%">New Password : </td>
                <td><%=Html.PasswordFor(newPwd => newPwd.NewPassword, new { @class = "validate[required]",id="newPwd" })%></td>
                <td></td>
            </tr>
            <tr>
                <td align="right" width="20%">Confirm Password : </td>
                <td><%=Html.PasswordFor(confrm => confrm.ConfirmPassword, new { @class = "validate[required,equals[newPwd]]" })%></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="submit" value="Submit" /></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td><%=Model.Message %></td>
                <td></td>
            </tr>
        </table>
    </div>
    <%} %>
</asp:Content>
