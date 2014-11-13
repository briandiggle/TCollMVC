<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage(Of IEnumerable (Of TCollMVC.Domain.CollectionGenericItem))" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	GenericItems
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Generic Items</h2>

    <p>
        <%= Html.ActionLink("Create New", "Create")%>
    </p>
    
    <table class="datatable">
        <tr>
            <th>Action</th>
            <th>
                GenID
            </th>
            <th>
                Generic Item Title
            </th>
        </tr>

    <% For Each item In Model%>
    
        <tr>
 
            <td>
                <%= Html.Encode(item.GenericItemID) %>
            </td>
          <td>
               <%= Html.ActionLink("Edit", "EditItem", New With {.iGenericItemID = item.GenericItemID})%> |
                <%= Ajax.ActionLink("Items", "AjaxItems", New With {.id = item.GenericItemID}, New AjaxOptions With {.UpdateTargetId = "itemsfor" + item.GenericItemID.ToString})%>
            </td>
            <td>
                <%= Html.ActionLink(item.GenericItemTitle, "CollectionItems", New With {.id = item.GenericItemID})%>
            </td>
 
        </tr>
        <tr>
            <td colspan="3">
            <div id="itemsfor<%= item.GenericItemID.ToString %>"></div>
            
            </td>
        
        </tr>
    
    <% Next%>

    </table>

</asp:Content>

