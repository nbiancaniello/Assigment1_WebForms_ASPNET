<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageWithNav.master" 
    AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="Assigment1_WebForms_ASPNET.SignIn" %>

<asp:Content ID="Content" ContentPlaceHolderID="NavContentDisplay" runat="server">
    <div>
    <table border="0">
        <tr>
            <td><asp:Label ID="lblUser" runat="server" CssClass="lblBoldUpperXXS" Text="User: "></asp:Label></td>
            <td><asp:TextBox ID="txtUser" runat="server" CssClass="TextBox"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="lblPassword" runat="server" CssClass="lblBoldUpperXXS" Text="Password: "></asp:Label></td>
            <td><asp:TextBox ID="txtPassword" runat="server" CssClass="TextBox"></asp:TextBox></td>
        </tr>
        <tr>
            <td></td>
            <td><asp:HyperLink ID="hlForgotPassword" runat="server" 
                CssClass="hyperlinks" Text="I Forgot My Password" NavigateUrl="~/SignUp.aspx"></asp:HyperLink></td>
        </tr>
        <tr>
            <td></td>
            <td><asp:HyperLink ID="hlNewUser" runat="server" 
                CssClass="hyperlinks" Text="I am a New User" NavigateUrl="~/SignUp.aspx"></asp:HyperLink></td>
        </tr>
    </table>
    <br />
    <asp:Button ID="btnSignIn" runat="server" CssClass="ButtonBlue11px" Text="Sign In" OnClick="btnSignIn_Click" />
    </div>
</asp:Content>