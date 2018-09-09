<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="changePassword.ascx.cs" Inherits="Assigment1_WebForms_ASPNET.UserControls.changePassword" %>

<div>
<table border="0">
    <tr>
        <td><asp:Label ID="lblOldPassword" runat="server" CssClass="lblBoldUpperXXS" Text="Old Password: "></asp:Label></td>
        <td><asp:TextBox ID="txtOldPassword" runat="server" CssClass="TextBox" TextMode="Password"></asp:TextBox></td>
        <td style="width: 205px"><asp:RequiredFieldValidator runat="server" ID="reqOldPassword" ControlToValidate="txtOldPassword" ErrorMessage="Password is Required" CssClass="lblError"/></td>
    </tr>
    <tr>
        <td><asp:Label ID="lblNewPassword" runat="server" CssClass="lblBoldUpperXXS" Text="New Password: "></asp:Label></td>
        <td><asp:TextBox ID="txtNewPassword" runat="server" CssClass="TextBox" TextMode="Password"></asp:TextBox></td>
        <td style="width: 205px"><asp:RequiredFieldValidator runat="server" ID="reqNewPassword" ControlToValidate="txtNewPassword" ErrorMessage="Password is Required" CssClass="lblError"/></td>
    </tr>
    <tr>
        <td><asp:Label ID="lblNewRePassword" runat="server" CssClass="lblBoldUpperXXS" Text="Re-Enter Password: "></asp:Label></td>
        <td><asp:TextBox ID="txtNewRePassword" runat="server" CssClass="TextBox" TextMode="Password"></asp:TextBox></td>
        <td style="width: 205px"><asp:RequiredFieldValidator runat="server" ID="reqRePassword" ControlToValidate="txtNewRePassword" ErrorMessage="Password Validation is Required" CssClass="lblError"/></td>
        <td style="width: 388px"><asp:CompareValidator runat="server" ID="cmpPasswords" ControlToValidate="txtNewRePassword" ControlToCompare="txtNewPassword" Type="String" Operator="Equal" Text="Passwords must match" CssClass="lblError"/></td>
    </tr>
</table>
<br />
<asp:Button ID="btnChange" runat="server" CssClass="ButtonBlue11px" Text="Change Password" OnClick="btnChange_Click" Width="123px" />
</div>