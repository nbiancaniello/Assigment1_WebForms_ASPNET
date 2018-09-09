<%@ Page Title="" Language="C#" MasterPageFile="~/ApplicantMasterPage.master" 
    AutoEventWireup="true" CodeBehind="ApplicantProfile.aspx.cs" Inherits="Assigment1_WebForms_ASPNET.ApplicantProfile" %>

<asp:Content ID="Content" ContentPlaceHolderID="ApplicantNavContent" runat="server">
    <div>
        <asp:SqlDataSource ID="Currencies" runat="server" ConnectionString="<%$ ConnectionStrings:Job_Portal %>" ProviderName="<%$ ConnectionStrings:Job_Portal.ProviderName %>" SelectCommand="select distinct [Currency] from dbo.Applicant_Profiles;"></asp:SqlDataSource>
        <asp:SqlDataSource ID="Countries" runat="server" ConnectionString="<%$ ConnectionStrings:Job_Portal %>" ProviderName="<%$ ConnectionStrings:Job_Portal.ProviderName %>" SelectCommand="SELECT [Name], [Code] FROM [System_Country_Codes]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="StatesProvinces" runat="server" ConnectionString="<%$ ConnectionStrings:Job_Portal %>" ProviderName="<%$ ConnectionStrings:Job_Portal.ProviderName %>" SelectCommand="select distinct [State_Province_Code] from dbo.Applicant_Profiles;"></asp:SqlDataSource>
        <table border="0">
        <tr>
            <td><asp:Label ID="lblFirstName" runat="server" CssClass="lblBoldUpperXXS" Text="First Name: "></asp:Label></td>
            <td><asp:TextBox ID="txtFirstName" runat="server" CssClass="TextBox"></asp:TextBox></td>
            <td style="width: 183px"><asp:RequiredFieldValidator runat="server" ID="reqFirstName" ControlToValidate="txtFirstName" ErrorMessage="First Name is Required" CssClass="lblError"/></td>
        </tr>
        <tr>
            <td><asp:Label ID="lblLastName" runat="server" CssClass="lblBoldUpperXXS" Text="Last Name: "></asp:Label></td>
            <td><asp:TextBox ID="txtLastName" runat="server" CssClass="TextBox"></asp:TextBox></td>
            <td style="width: 183px"><asp:RequiredFieldValidator runat="server" ID="reqLastName" ControlToValidate="txtLastName" ErrorMessage="Last Name is Required" CssClass="lblError"/></td>
        </tr>
        <tr>
            <td><asp:Label ID="lblPhone" runat="server" CssClass="lblBoldUpperXXS" Text="Phone: "></asp:Label></td>
            <td><asp:TextBox ID="txtPhone" runat="server" CssClass="TextBox"></asp:TextBox></td>
            <td style="width: 183px"><asp:RequiredFieldValidator runat="server" ID="reqPhone" ControlToValidate="txtPhone" ErrorMessage="Phone is Required" CssClass="lblError"/></td>
            <td style="width: 343px"><asp:RegularExpressionValidator runat="server" ID="regPhone" ControlToValidate="txtPhone" ErrorMessage="Phone is Invalid. Preferred Format: (###-###-####)" CssClass="lblError" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"/></td>
        </tr>    
        <tr>
            <td><asp:Label ID="lblEmail" runat="server" CssClass="lblBoldUpperXXS" Text="Email: " Width="104px"></asp:Label></td>
            <td><asp:TextBox ID="txtEmail" runat="server" CssClass="TextBox"></asp:TextBox></td>
            <td style="width: 183px"><asp:RequiredFieldValidator runat="server" ID="reqEmail" ControlToValidate="txtEmail" ErrorMessage="Email is Required" CssClass="lblError"/></td>
            <td style="width: 343px"><asp:RegularExpressionValidator runat="server" ID="regEmail" ControlToValidate="txtEmail" ErrorMessage="Email is Invalid" CssClass="lblError" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"/></td>
        </tr>
        </table>
        <br />
        <hr />
        <br />
        <table border="0">
        <tr>
            <td><asp:Label ID="lblCurrentSalary" runat="server" CssClass="lblBoldUpperXXS" Text="Current Salary: "></asp:Label></td>
            <td><asp:TextBox ID="txtCurrentSalary" runat="server" CssClass="TextBox"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="lblCurrentRate" runat="server" CssClass="lblBoldUpperXXS" Text="Current Rate: "></asp:Label></td>
            <td><asp:TextBox ID="txtCurrentRate" runat="server" CssClass="TextBox"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="lblCurrency" runat="server" CssClass="lblBoldUpperXXS" Text="Currency: "></asp:Label></td>
            <td><asp:DropDownList ID="ddlCurrency" runat="server" CssClass="TextBox" DataSourceID="Currencies" DataTextField="Currency" DataValueField="Currency"></asp:DropDownList></td>
        </tr>    
        <tr>
            <td><asp:Label ID="lblCountryCode" runat="server" CssClass="lblBoldUpperXXS" Text="Country Code: " Width="104px"></asp:Label></td>
            <td><asp:DropDownList ID="ddlCountryCode" runat="server" CssClass="TextBox" DataSourceID="Countries" DataTextField="Name" DataValueField="Code"></asp:DropDownList></td>
        </tr>
        <tr>
            <td><asp:Label ID="lblStateProvince" runat="server" CssClass="lblBoldUpperXXS" Text="State/Province: " Width="104px"></asp:Label></td>
            <td><asp:DropDownList ID="ddlStateProvince" runat="server" CssClass="TextBox" DataSourceID="StatesProvinces" DataTextField="State_Province_Code" DataValueField="State_Province_Code"></asp:DropDownList></td>
        </tr>
        <tr>
            <td><asp:Label ID="lblStreet" runat="server" CssClass="lblBoldUpperXXS" Text="Street Address: " Width="104px"></asp:Label></td>
            <td><asp:TextBox ID="txtStreet" runat="server" CssClass="TextBox"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="lblCityTown" runat="server" CssClass="lblBoldUpperXXS" Text="City/Town: " Width="104px"></asp:Label></td>
            <td><asp:TextBox ID="txtCityTown" runat="server" CssClass="TextBox"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="lblZipPostalCode" runat="server" CssClass="lblBoldUpperXXS" Text="Zip/Postal Code: " Width="104px"></asp:Label></td>
            <td><asp:TextBox ID="txtZipPostalCode" runat="server" CssClass="TextBox"></asp:TextBox></td>
        </tr>
        </table>
        <asp:Button ID="btnSave" runat="server" CssClass="ButtonBlue11px" Text="Save" OnClick="btnSave_Click" />
    </div>
</asp:Content>