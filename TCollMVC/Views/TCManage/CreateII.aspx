<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage(Of TCollMVC.ViewModels.ItemInstanceViewModel)" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	CreateII
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<script type="text/javascript">
    $('#GenericItemID').change(function () {
        $.getJSON('/TCManage/CollectionItems', { GenericItemID: $('#GenericItemID').val() }, function (oResults, status) {

            /* Populate the collection items dropdown */
        });

    });

</script>

    <h2>CreateII</h2>

    <%-- The following line works around an ASP.NET compiler warning --%>
    <%= ""%>
    <% Using Html.BeginForm()%>
        <%= Html.ValidationSummary(True) %>
        <fieldset>
            <legend>Fields</legend>
            <p>Generic Item</p>
            <p><%= Html.DropDownListFor(Function(m) m.ItemInstance.GenericItemID, Model.GenericItemsList)%></p>
            <p></p>
            <!--- Populate this select list with an ajax call which uses _repo.GetCollectionItemsForSelectListByGenericItemID(ByVal GenericItemID) ----
                It should be made visible on item selection, then the ajax call made, supplying genericitemid. 
            <p>Collection Item</p>
            <p></p>
            <p></p> -->
            <p>Title</p>
            <p><%= Html.TextBoxFor(Function(m) m.ItemInstance.Title, New With {.size = 80})%></p>
            <p></p>
            <p>Edition</p>
            <p><%= Html.TextBoxFor(Function(m) m.ItemInstance.Edition, New With {.size = 80})%></p>
            <p></p>
            <p>Date Listed</p>
            <p><%= Html.TextBoxFor(Function(m) m.ItemInstance.DateListed, New With {.size = 80})%></p>
            <p></p>
           
            <p>Condition</p>
            <p><%= Html.TextAreaFor(Function(m) m.ItemInstance.Condition, New With {.rows = 5, .cols = 100})%></p>

            <p>Price</p>
            <p><%= Html.TextBoxFor(Function(m) m.ItemInstance.Price, New With {.size = 20})%></p>
           <p></p>
            <p>No Bid?</p>
            <p><%= Html.CheckBoxFor(Function(m) m.ItemInstance.NoBid)%></p>
           <p>Me</p>
            <p>I Bid? <%= Html.CheckBoxFor(Function(m) m.ItemInstance.NoBid)%>
               Bid Value: <%= Html.TextBoxFor(Function(m) m.ItemInstance.IBidValue, New With {.size = 20})%> 
               Won ? <%= Html.CheckBoxFor(Function(m) m.ItemInstance.IWon) %>
               Resold? <%= Html.CheckBoxFor(Function(m) m.ItemInstance.Resold)%>
               Resold value: <%= Html.TextBoxFor(Function(m) m.ItemInstance.ResoldValue, New With {.size = 20})%>
                </p>
            <p>
                <input type="submit" value="Create" />
            </p>
        </fieldset>

    <% End Using %>

    <div>
        <%= Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ViewSpecificHead" runat="server">
</asp:Content>

