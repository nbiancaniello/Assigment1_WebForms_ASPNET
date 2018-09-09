<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageWithNav.master" 
    AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="Assigment1_WebForms_ASPNET.SignUp" %>

<asp:Content ID="Content" ContentPlaceHolderID="NavContentDisplay" runat="server">
    <div>
        <table border="0">
        <tr>
            <td><asp:Label ID="lblIam" runat="server" CssClass="lblBoldUpperXXS" Text="I am: "></asp:Label></td>
            <td><asp:RadioButton ID="rbRecruiter" runat="server" GroupName="Profile" Text="Recruiter" CssClass="lblBoldUpperXXS" Enabled="False"></asp:RadioButton></td>
            <td style="width: 205px"><asp:RadioButton ID="rbSeeker" runat="server" GroupName="Profile" Text="Job Seeker" CssClass="lblBoldUpperXXS"></asp:RadioButton></td>
        </tr>
        <tr>
            <td><asp:Label ID="lblFirstName" runat="server" CssClass="lblBoldUpperXXS" Text="First Name: "></asp:Label></td>
            <td><asp:TextBox ID="txtFirstName" runat="server" CssClass="TextBox"></asp:TextBox></td>
            <td style="width: 205px"><asp:RequiredFieldValidator runat="server" ID="reqFirstName" ControlToValidate="txtFirstName" ErrorMessage="First Name is Required" CssClass="lblError"/></td>
        </tr>
        <tr>
            <td><asp:Label ID="lblLastName" runat="server" CssClass="lblBoldUpperXXS" Text="Last Name: "></asp:Label></td>
            <td><asp:TextBox ID="txtLastName" runat="server" CssClass="TextBox"></asp:TextBox></td>
            <td style="width: 205px"><asp:RequiredFieldValidator runat="server" ID="reqLastName" ControlToValidate="txtLastName" ErrorMessage="Last Name is Required" CssClass="lblError"/></td>
        </tr>
        <tr>
            <td><asp:Label ID="lblPhone" runat="server" CssClass="lblBoldUpperXXS" Text="Phone: "></asp:Label></td>
            <td><asp:TextBox ID="txtPhone" runat="server" CssClass="TextBox"></asp:TextBox></td>
            <td style="width: 205px"><asp:RequiredFieldValidator runat="server" ID="reqPhone" ControlToValidate="txtPhone" ErrorMessage="Phone is Required" CssClass="lblError"/></td>
            <td style="width: 388px"><asp:RegularExpressionValidator runat="server" ID="regPhone" ControlToValidate="txtPhone" ErrorMessage="Phone is Invalid. Preferred Format: (###-###-####)" CssClass="lblError" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"/></td>
        </tr>    
        <tr>
            <td style="height: 12px"><asp:Label ID="lblEmail" runat="server" CssClass="lblBoldUpperXXS" Text="Email: " Width="104px"></asp:Label></td>
            <td style="height: 12px"><asp:TextBox ID="txtEmail" runat="server" CssClass="TextBox"></asp:TextBox></td>
            <td style="width: 205px; height: 12px;"><asp:RequiredFieldValidator runat="server" ID="reqEmail" ControlToValidate="txtEmail" ErrorMessage="Email is Required" CssClass="lblError"/></td>
            <td style="width: 388px; height: 12px;"><asp:RegularExpressionValidator runat="server" ID="regEmail" ControlToValidate="txtEmail" ErrorMessage="Email is Invalid" CssClass="lblError" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"/></td>
        </tr>
        <tr>
            <td><asp:Label ID="lblPassword" runat="server" CssClass="lblBoldUpperXXS" Text="Password: "></asp:Label></td>
            <td><asp:TextBox ID="txtPassword" runat="server" CssClass="TextBox" TextMode="Password"></asp:TextBox></td>
            <td style="width: 205px"><asp:RequiredFieldValidator runat="server" ID="reqPassword" ControlToValidate="txtPassword" ErrorMessage="Password is Required" CssClass="lblError"/></td>
        </tr>
        <tr>
            <td><asp:Label ID="lblRePassword" runat="server" CssClass="lblBoldUpperXXS" Text="Re-Enter Password: "></asp:Label></td>
            <td><asp:TextBox ID="txtRePassword" runat="server" CssClass="TextBox" TextMode="Password"></asp:TextBox></td>
            <td style="width: 205px"><asp:RequiredFieldValidator runat="server" ID="reqRePassword" ControlToValidate="txtRePassword" ErrorMessage="Password Validation is Required" CssClass="lblError"/></td>
            <td style="width: 388px"><asp:CompareValidator runat="server" ID="cmpPasswords" ControlToValidate="txtRePassword" ControlToCompare="txtPassword" Type="String" Operator="Equal" Text="Passwords must match" CssClass="lblError"/></td>
        </tr>
        </table>
        <br />
        <asp:Button ID="btnSignUp" runat="server" CssClass="ButtonBlue11px" Text="Sign Up" OnClick="btnSignUp_Click" />
    </div>
</asp:Content>
