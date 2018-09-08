<%@ Page Title="" Language="C#" MasterPageFile="~/CompanyMasterPage.master" AutoEventWireup="true" CodeBehind="CompanyProfile.aspx.cs" Inherits="Assigment1_WebForms_ASPNET.CompanyProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CompanyNavContent" runat="server">
    <div>
        <table border="0">
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
