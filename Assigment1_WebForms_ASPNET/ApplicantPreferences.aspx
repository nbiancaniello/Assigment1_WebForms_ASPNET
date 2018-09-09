<%@ Page Title="" Language="C#" MasterPageFile="~/ApplicantMasterPage.master" 
    AutoEventWireup="true" CodeBehind="ApplicantPreferences.aspx.cs" Inherits="Assigment1_WebForms_ASPNET.ApplicantPreferences" %>
<%@ Register TagPrefix="uc" TagName="changePasswd" Src="~/UserControls/changePassword.ascx" %>

<asp:Content ID="Content" ContentPlaceHolderID="ApplicantNavContent" runat="server">
    <uc:changePasswd runat="server" ID="changePassword"/>    
</asp:Content>
