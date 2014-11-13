<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage(Of TCollMVC.Domain.CollectionItemInstance)" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	CreateItemInstance
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>CreateItemInstance</h2>

    <%-- The following line works around an ASP.NET compiler warning --%>
    <%= ""%>
    <% Using Html.BeginForm()%>
        <%= Html.ValidationSummary(True) %>
        <fieldset>
            <legend>Fields</legend>
            
            <div class="editor-label">
                <%= Html.LabelFor(Function(model) model.ItemInstanceID) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(Function(model) model.ItemInstanceID) %>
                <%= Html.ValidationMessageFor(Function(model) model.ItemInstanceID) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(Function(model) model.ItemID) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(Function(model) model.ItemID) %>
                <%= Html.ValidationMessageFor(Function(model) model.ItemID) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(Function(model) model.GenericItemID) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(Function(model) model.GenericItemID) %>
                <%= Html.ValidationMessageFor(Function(model) model.GenericItemID) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(Function(model) model.Title) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(Function(model) model.Title) %>
                <%= Html.ValidationMessageFor(Function(model) model.Title) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(Function(model) model.Edition) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(Function(model) model.Edition) %>
                <%= Html.ValidationMessageFor(Function(model) model.Edition) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(Function(model) model.Price) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(Function(model) model.Price) %>
                <%= Html.ValidationMessageFor(Function(model) model.Price) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(Function(model) model.NoBid) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(Function(model) model.NoBid) %>
                <%= Html.ValidationMessageFor(Function(model) model.NoBid) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(Function(model) model.DateListed) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(Function(model) model.DateListed) %>
                <%= Html.ValidationMessageFor(Function(model) model.DateListed) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(Function(model) model.Condition) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(Function(model) model.Condition) %>
                <%= Html.ValidationMessageFor(Function(model) model.Condition) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(Function(model) model.IBid) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(Function(model) model.IBid) %>
                <%= Html.ValidationMessageFor(Function(model) model.IBid) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(Function(model) model.IBidValue) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(Function(model) model.IBidValue) %>
                <%= Html.ValidationMessageFor(Function(model) model.IBidValue) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(Function(model) model.IWon) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(Function(model) model.IWon) %>
                <%= Html.ValidationMessageFor(Function(model) model.IWon) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(Function(model) model.Resold) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(Function(model) model.Resold) %>
                <%= Html.ValidationMessageFor(Function(model) model.Resold) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(Function(model) model.ResoldValue) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(Function(model) model.ResoldValue) %>
                <%= Html.ValidationMessageFor(Function(model) model.ResoldValue) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(Function(model) model.ExcludeFromItemValuation) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(Function(model) model.ExcludeFromItemValuation) %>
                <%= Html.ValidationMessageFor(Function(model) model.ExcludeFromItemValuation) %>
            </div>
            
            <p>
                <input type="submit" value="Create" />
            </p>
        </fieldset>

    <% End Using %>

    <div>
        <%= Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

