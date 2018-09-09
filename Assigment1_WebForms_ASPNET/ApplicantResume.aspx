<%@ Page Title="" Language="C#" MasterPageFile="~/ApplicantMasterPage.master" AutoEventWireup="true" 
    CodeBehind="ApplicantResume.aspx.cs" Inherits="Assigment1_WebForms_ASPNET.ApplicantResume" %>

<asp:Content ID="Content" ContentPlaceHolderID="ApplicantNavContent" runat="server">
    <div>
        <asp:RequiredFieldValidator runat="server" ID="reqResume" ControlToValidate="txtResume" ErrorMessage="Resume is Required" CssClass="lblError"/>
        <asp:TextBox ID="txtResume" runat="server" Height="204px" Width="1253px" Rows="100" TextMode="MultiLine"></asp:TextBox>
        <br />
        <asp:Button ID="btnSave" runat="server" CssClass="ButtonBlue11px" Text="Save" OnClick="btnSave_Click" />
    </div>
</asp:Content>
