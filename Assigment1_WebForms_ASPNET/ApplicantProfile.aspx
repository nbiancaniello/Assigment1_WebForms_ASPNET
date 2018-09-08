<%@ Page Title="" Language="C#" MasterPageFile="~/ApplicantMasterPage.master" 
    AutoEventWireup="true" CodeBehind="ApplicantProfile.aspx.cs" Inherits="Assigment1_WebForms_ASPNET.ApplicantProfile" %>

<asp:Content ID="Content" ContentPlaceHolderID="ApplicantNavContent" runat="server">
    <div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Job_Portal %>" ProviderName="<%$ ConnectionStrings:Job_Portal.ProviderName %>" SelectCommand="SELECT [Full_Name], [Phone_Number], [Email_Address] FROM [Security_Logins]"></asp:SqlDataSource>
        <table border="0">
        <tr>
            <td><asp:Label ID="lblFirstName" runat="server" CssClass="lblBoldUpperXXS" Text="First Name: "></asp:Label></td>
            <td><asp:TextBox ID="txtFirstName" runat="server" CssClass="TextBox" ReadOnly="true"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="lblLastName" runat="server" CssClass="lblBoldUpperXXS" Text="Last Name: "></asp:Label></td>
            <td><asp:TextBox ID="txtLastName" runat="server" CssClass="TextBox" ReadOnly="true"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="lblPhone" runat="server" CssClass="lblBoldUpperXXS" Text="Phone: "></asp:Label></td>
            <td><asp:TextBox ID="txtPhone" runat="server" CssClass="TextBox" ReadOnly="true"></asp:TextBox></td>
        </tr>    
        <tr>
            <td><asp:Label ID="lblEmail" runat="server" CssClass="lblBoldUpperXXS" Text="Email: " Width="104px"></asp:Label></td>
            <td><asp:TextBox ID="txtEmail" runat="server" CssClass="TextBox" ReadOnly="true"></asp:TextBox></td>
        </tr>
        </table>
        <br />
        <asp:Button ID="btnSave" runat="server" CssClass="ButtonBlue11px" Text="Save" OnClick="btnSave_Click" />
    </div>
</asp:Content>