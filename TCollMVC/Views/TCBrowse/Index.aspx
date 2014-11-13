<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Browse index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Browse options</h2>

    <p>
    <%= Html.ActionLink("Browse Generic Items", "GenericItems", "TCBrowse")%> <br/>
    <%= Html.ActionLink("Browse Items", "CollectionItems", "TCBrowse")%><br/>
    </p>

    <p>Item: <%= Html.DropDownList("items")%></p>

<%= Ajax.ActionLink("show details", "UpdateItemDetails", New With {.id = 3444}, New AjaxOptions With {.UpdateTargetId = "itemdetails"})%>

<div id="itemdetails">

</div>

</asp:Content>
