<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageWithNav.master" 
    AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="Assigment1_WebForms_ASPNET.SignUp" %>

<asp:Content ID="Content" ContentPlaceHolderID="NavContentDisplay" runat="server">
    <div>
    <table border="0">
    <tr>
        <td><asp:Label ID="lblIam" runat="server" CssClass="lblBoldUpperXXS" Text="I am: "></asp:Label></td>
        <td><asp:RadioButton ID="rbRecruiter" runat="server" GroupName="Profile" Text="Recruiter" CssClass="lblBoldUpperXXS"></asp:RadioButton></td>
        <td><asp:RadioButton ID="rbSeeker" runat="server" GroupName="Profile" Text="Job Seeker" CssClass="lblBoldUpperXXS"></asp:RadioButton></td>
    </tr>
    <tr>
        <td><asp:Label ID="lblFirstName" runat="server" CssClass="lblBoldUpperXXS" Text="First Name: "></asp:Label></td>
        <td><asp:TextBox ID="txtFirstName" runat="server" CssClass="TextBox"></asp:TextBox></td>
    </tr>
    <tr>
        <td><asp:Label ID="lblLastName" runat="server" CssClass="lblBoldUpperXXS" Text="Last Name: "></asp:Label></td>
        <td><asp:TextBox ID="txtLastName" runat="server" CssClass="TextBox"></asp:TextBox></td>
    </tr>
    <tr>
        <td><asp:Label ID="lblPhone" runat="server" CssClass="lblBoldUpperXXS" Text="Phone: "></asp:Label></td>
        <td><asp:TextBox ID="txtPhone" runat="server" CssClass="TextBox"></asp:TextBox></td>
    </tr>    
    <tr>
        <td><asp:Label ID="lblEmail" runat="server" CssClass="lblBoldUpperXXS" Text="Email: " Width="104px"></asp:Label></td>
        <td><asp:TextBox ID="txtEmail" runat="server" CssClass="TextBox"></asp:TextBox></td>
    </tr>
    <tr>
        <td><asp:Label ID="lblPassword" runat="server" CssClass="lblBoldUpperXXS" Text="Password: "></asp:Label></td>
        <td><asp:TextBox ID="txtPassword" runat="server" CssClass="TextBox" TextMode="Password"></asp:TextBox></td>
    </tr>
    <tr>
        <td><asp:Label ID="lblRePassword" runat="server" CssClass="lblBoldUpperXXS" Text="Re-Enter Password: "></asp:Label></td>
        <td><asp:TextBox ID="txtRePassword" runat="server" CssClass="TextBox" TextMode="Password"></asp:TextBox></td>
    </tr>
    </table>
    <br />
    <asp:Button ID="btnSignUp" runat="server" CssClass="ButtonBlue11px" Text="Sign Up" OnClick="btnSignUp_Click" />
    </div>
</asp:Content>
