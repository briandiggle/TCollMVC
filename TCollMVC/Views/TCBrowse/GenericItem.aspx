<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage(Of TCollMVC.Domain.CollectionGenericItem)" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	GenericItem
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>GenericItem</h2>

    <fieldset>
        <legend>Fields</legend>
        
        <div class="display-label">GenericItemID</div>
        <div class="display-field"><%= Html.Encode(Model.GenericItemID) %></div>
        
        <div class="display-label">GenericItemTitle</div>
        <div class="display-field"><%= Html.Encode(Model.GenericItemTitle) %></div>
        
    </fieldset>
    <p>
        <%--<%= Html.ActionLink("Edit", "Edit", New With {.id = Model.PrimaryKey})%> |--%>
        <%= Html.ActionLink("Back to List", "Index") %>
    </p>

</asp:Content>

