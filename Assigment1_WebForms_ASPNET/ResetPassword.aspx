<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageWithNav.master" 
    AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="Assigment1_WebForms_ASPNET.ResetPassword" %>
<%@ Register TagPrefix="uc" TagName="resetPassword" Src="~/UserControls/resetPassword.ascx" %>

<asp:Content ID="Content" ContentPlaceHolderID="NavContentDisplay" runat="server">
    <uc:resetPassword runat="server" ID="reset"/>
</asp:Content>