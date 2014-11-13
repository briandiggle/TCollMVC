<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Reports Index</h2>

 <p>
      <%= Html.ActionLink("My instances", "MyInstances", "TCReport")%><br/>
      <%= Html.ActionLink("My bids", "MyBids", "TCReport")%><br/>
 </p>


</asp:Content>
