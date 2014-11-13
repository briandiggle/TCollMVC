<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage(Of TCollMVC.Domain.CollectionItem)" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Collection Item
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Collection Item</h2>

    <fieldset>
        <legend>Fields</legend>
        
        <div class="display-label">ItemID</div>
        <div class="display-field"><%= Html.Encode(Model.ItemID) %></div>
        
        <div class="display-label">GenericItemID</div>
        <div class="display-field"><%= Html.Encode(Model.GenericItemID) %></div>
        
        <div class="display-label">Title</div>
        <div class="display-field"><%= Html.Encode(Model.Title) %></div>
        
        <div class="display-label">Edition</div>
        <div class="display-field"><%= Html.Encode(Model.Edition) %></div>
        
        <div class="display-label">Impression</div>
        <div class="display-field"><%= Html.Encode(Model.Impression) %></div>
        
        <div class="display-label">PublicationYear</div>
        <div class="display-field"><%= Html.Encode(Model.PublicationYear) %></div>
        
        <div class="display-label">Publisher</div>
        <div class="display-field"><%= Html.Encode(Model.Publisher) %></div>
        
        <div class="display-label">Hardback</div>
        <div class="display-field"><%= Html.Encode(Model.Hardback) %></div>
        
        <div class="display-label">DustJacket</div>
        <div class="display-field"><%= Html.Encode(Model.DustJacket) %></div>
        
        <div class="display-label">Notes</div>
        <div class="display-field"><%= Html.Encode(Model.Notes) %></div>
        
    </fieldset>
    <p>
        <%--<%= Html.ActionLink("Edit", "Edit", New With {.id = Model.PrimaryKey})%> |--%>
        <%= Html.ActionLink("Back to List", "Index") %>
    </p>

</asp:Content>

