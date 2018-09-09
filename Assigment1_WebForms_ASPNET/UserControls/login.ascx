<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="login.ascx.cs" 
    Inherits="Assigment1_WebForms_ASPNET.UserControls.login" %>

<div>
<table border="0">
    <tr>
        <td><asp:Label ID="lblUser" runat="server" CssClass="lblBoldUpperXXS" Text="User: "></asp:Label></td>
        <td><asp:TextBox ID="txtUser" runat="server" CssClass="TextBox"></asp:TextBox></td>
        <td><asp:RequiredFieldValidator runat="server" ID="reqUser" ControlToValidate="txtUser" ErrorMessage="User is Required" CssClass="lblError"/></td>
    </tr>
    <tr>
        <td><asp:Label ID="lblPassword" runat="server" CssClass="lblBoldUpperXXS" Text="Password: "></asp:Label></td>
        <td><asp:TextBox ID="txtPassword" runat="server" CssClass="TextBox" TextMode="Password"></asp:TextBox></td>
        <td><asp:RequiredFieldValidator runat="server" ID="reqPassword" ControlToValidate="txtPassword" ErrorMessage="Password is Required" CssClass="lblError"/></td>
    </tr>
    <tr>
        <td></td>
        <td><asp:HyperLink ID="hlForgotPassword" runat="server" Text="I Forgot My Password" NavigateUrl="~/ResetPassword.aspx"></asp:HyperLink></td>
    </tr>
    <tr>
        <td></td>
        <td><asp:HyperLink ID="hlNewUser" runat="server" Text="I am a New User" NavigateUrl="~/SignUp.aspx"></asp:HyperLink></td>
    </tr>
</table>
<br />
<asp:Button ID="btnSignIn" runat="server" CssClass="ButtonBlue11px" Text="Sign In" OnClick="btnSignIn_Click" />
</div>