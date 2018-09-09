<%@ Page Title="" Language="C#" MasterPageFile="~/ApplicantMasterPage.master" 
    AutoEventWireup="true" CodeBehind="ApplicantApplyJobs.aspx.cs" Inherits="Assigment1_WebForms_ASPNET.ApplicantApplyJobs" %>

<asp:Content ID="Content" ContentPlaceHolderID="ApplicantNavContent" runat="server">
    <div>
        <asp:SqlDataSource ID="ApplicantJobApplications" runat="server" ConnectionString="<%$ ConnectionStrings:Job_Portal %>" ProviderName="<%$ ConnectionStrings:Job_Portal.ProviderName %>" 
            SelectCommand="select cd.Company_Name [Company Name], cjd.Job_Name [Job Name], 
		cjd.Job_Descriptions [Job Description], CAST(cj.Profile_Created AS DATE) [Date Created]
                            from Company_Descriptions cd join Company_Jobs cj on cd.Company = cj.Company
                            join Company_Jobs_Descriptions cjd on cj.Id = cjd.Job
                            where cj.Is_Company_Hidden = 0
                            and cj.Is_Inactive = 0 
                            and cd.LanguageID = 'EN'"></asp:SqlDataSource>

      
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="ApplicantJobApplications" 
            AutoGenerateColumns="False" style="margin-right: 22px" Width="1244px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="Company Name" HeaderText="Company Name" SortExpression="Company Name" />
                <asp:BoundField DataField="Job Name" HeaderText="Job Name" SortExpression="Job Name" />
                <asp:BoundField DataField="Job Description" HeaderText="Job Description" SortExpression="Job Description" />
                <asp:BoundField DataField="Date Created" HeaderText="Date Created" ReadOnly="True" SortExpression="Date Created" />
                <asp:ButtonField AccessibleHeaderText="Apply" ButtonType="Button" CommandName="applyEvent" Text="Apply" />
            </Columns>
        </asp:GridView>

      
    </div>
</asp:Content>
