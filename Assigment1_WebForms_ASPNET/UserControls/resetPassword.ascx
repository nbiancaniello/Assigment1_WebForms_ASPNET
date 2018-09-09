<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="resetPassword.ascx.cs" Inherits="Assigment1_WebForms_ASPNET.resetPassword" %>

<div>
<table border="0">
    <tr>
        <td><asp:Label ID="lblEmail" runat="server" CssClass="lblBoldUpperXXS" Text="Email: " Width="104px"></asp:Label></td>
        <td><asp:TextBox ID="txtEmail" runat="server" CssClass="TextBox"></asp:TextBox></td>
        <td style="width: 183px"><asp:RequiredFieldValidator runat="server" ID="reqEmail" ControlToValidate="txtEmail" ErrorMessage="Email is Required" CssClass="lblError"/></td>
        <td style="width: 343px"><asp:RegularExpressionValidator runat="server" ID="regEmail" ControlToValidate="txtEmail" ErrorMessage="Email is Invalid" CssClass="lblError" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"/></td>
    </tr>
</table>
<br />
<asp:Button ID="btnReset" runat="server" CssClass="ButtonBlue11px" Text="Reset" OnClick="btnReset_Click" />
</div>