<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageWithNav.master" 
    AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="Assigment1_WebForms_ASPNET.SignIn" %>
<%@ Register TagPrefix="uc" TagName="Login" Src="~/UserControls/login.ascx" %>

<asp:Content ID="Content" ContentPlaceHolderID="NavContentDisplay" runat="server">
    <uc:Login runat="server" ID="Login"/>    
</asp:Content>