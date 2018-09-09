<%@ Page Title="" Language="C#" MasterPageFile="~/ApplicantMasterPage.master" 
    AutoEventWireup="true" CodeBehind="JobsApplied.aspx.cs" Inherits="Assigment1_WebForms_ASPNET.JobsApplied" %>

<asp:Content ID="Content" ContentPlaceHolderID="ApplicantNavContent" runat="server">
    <div>
        <asp:SqlDataSource ID="ApplicantJobApplications" runat="server" ConnectionString="<%$ ConnectionStrings:Job_Portal %>" ProviderName="<%$ ConnectionStrings:Job_Portal.ProviderName %>" 
            SelectCommand="select cd.Company_Name [Company Name], cjd.Job_Name [Job Name], 
                                   cjd.Job_Descriptions [Job Description], CAST(aja.Application_Date as DATE) [Date Applied]
                            from Company_Descriptions cd join Company_Jobs cj on cd.Company = cj.Company
                            join Company_Jobs_Descriptions cjd on cj.Id = cjd.Job
                            join Applicant_Job_Applications aja on cjd.Job = aja.Job
                            where aja.Applicant = ? and cd.LanguageID = 'EN'">
          <SelectParameters>
            <asp:ControlParameter ControlID="hApplicantId" PropertyName="Value" Name="ApplicantId" Type="String" />
          </SelectParameters>
        </asp:SqlDataSource>
      
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="ApplicantJobApplications" 
            AutoGenerateColumns="False" style="margin-right: 22px" Width="1244px ">
            <Columns>
                <asp:BoundField DataField="Company Name" HeaderText="Company Name" SortExpression="Company Name" />
                <asp:BoundField DataField="Job Name" HeaderText="Job Name" SortExpression="Job Name" />
                <asp:BoundField DataField="Job Description" HeaderText="Job Description" SortExpression="Job Description" />
                <asp:BoundField DataField="Date Applied" HeaderText="Date Applied" ReadOnly="True" SortExpression="Date Applied" />
            </Columns>
        </asp:GridView>
        <asp:HiddenField ID="hApplicantId" runat="server" />
    </div>
</asp:Content>
