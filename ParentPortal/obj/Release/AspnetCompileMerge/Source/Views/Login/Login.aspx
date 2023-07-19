<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<ParentPortal.Models.LoginModel>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title><%=ViewBag.title %></title>
    <link href="../../Documents/CSS/loginstyle.css" rel="stylesheet" type="text/css" />
    <script src="../../Documents/JS/jquery-1.8.2.js"></script>
    <script type="text/javascript">
        function login() {
            alert('hi')
            $('#divLogin').load('/Login/Login/');
        }

        //$('#btnLogin').on('click', function (event) {
        //    alert('hi')
        //   // 
        //});
    </script>
    <style>
        Body {
            padding: 0px 0px 0px 0px;
            margin: 0px 0px 0px 0px;
            background: url(../../Documents/images/bg.jpg) no-repeat center top #f4f5f0;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12px;
            font-weight: normal;
            color: #000;
            text-align: left;
            line-height: 19px;
        }
    </style>
</head>

<body>
    <%using (@Ajax.BeginForm("Login", "Login", FormMethod.Post, new AjaxOptions { UpdateTargetId = "divLogin" }, new { id = "divLogin", enctype = "multipart/form-data" }))
      { %>
    <%--<%using (Html.BeginForm("Login", "Login", FormMethod.Post))
      { %>--%>
    <%--<div id="divLogin">
        <div align="center" style="padding-top: 200px;"><b>PARENT LOGIN</b></div>
        <table style="padding-top: 50px; width: 100%;">
            <tr>
                <td align="right" width="45%">Username : </td>
                <td><%=Html.TextBoxFor(m=>m.UserName,Model.UserName) %></td>
            </tr>
            <tr>
                <td align="right">Password : </td>
                <td><%=Html.PasswordFor(m=>m.Password,Model.Password) %></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="submit" id="btnLogin" value="Login" <%--onclick="login()"--%>
       <%--     </tr>
            <tr>
                <td></td>
                <td><%=Model.Message %></td>
            </tr>
        </table>
    </div>--%>

    <div id="container">
            <div id="Loginlogo">
                <img src="../../Documents/images/login-logo.jpg" width="297" height="76" align="middle">
            </div>
            <div id="login-panel">
                <div id="Logindiv" runat="server" visible="true">
                    <ul class="loginul">
                        <li class="login">
                            <%--<asp:TextBox ID="txtUserName" runat="server" value="User Name" onBlur="if(this.value=='') this.value='User Name'" autocomplete="off" onFocus="if(this.value =='User Name' ) this.value=''" class="user-textbox"></asp:TextBox>--%>
                            <%=Html.TextBoxFor(m => m.UserName, Model.UserName, new { @class = "user-textbox" })%>
                        </li>
                        <li class="login">
                            <%--<asp:TextBox ID="txtPassword" runat="server" value="Password" onBlur="if(this.value=='') this.value='Password'" autocomplete="off"  onFocus="if(this.value =='Password' ) this.value=''" type="password" class="pwd-textbox"></asp:TextBox>--%>
                            <%=Html.PasswordFor(m => m.Password, new { @class = "pwd-textbox" })%>
                        </li>
                        <li>
                            <%if(Model.Message!=null){ %>
                            <div id="tdMessage" style="color: white; font-weight: bold;"><%=Model.Message %></div>
                            <%} %>
                        </li>
                        <li class="button-panel">
                            <input type="submit" id="Submit1" value="" class="login-button" <%--onclick="login()"--%>/>
                            <%--<asp:LinkButton ID="lnkLogin" CssClass="login-button" Text="" runat="server" OnClick="lnkLogin_Click"></asp:LinkButton>--%></li>
                       
                    </ul>
                </div>

            </div>



        </div>

    <%} %>
</body>
</html>
