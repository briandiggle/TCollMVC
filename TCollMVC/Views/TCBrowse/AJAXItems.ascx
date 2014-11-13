<%@ Control Language="VB" Inherits="System.Web.Mvc.ViewUserControl(Of IEnumerable (Of TCollMVC.Domain.CollectionItem))" %>

    <table class="datatable">
        <tr>
  
            <th>
                ItemID
            </th>
            <th>
                GenericItem ID
            </th>
            <th>
                Title
            </th>
            <th>
                Edition
            </th>
            <th>
                Impression
            </th>
            <th>
                Pubn Year
            </th>
            <th>
                Publisher
            </th>
            <th>
                HBK
            </th>
            <th>
                DJ
            </th>
            <th>
                Notes
            </th>
        </tr>

    <% For Each item In Model%>
    
        <tr>
 
            <td>
                <%= Html.Encode(item.ItemID) %>
            </td>
            <td>
                <%= Html.Encode(item.GenericItemID) %>
            </td>
            <td>
                 <%= Html.ActionLink(item.Title, "ItemInstances", New With {.id = item.ItemID})%>
            </td>
            <td>
                <%= Html.Encode(item.Edition) %>
            </td>
            <td>
                <%= Html.Encode(item.Impression) %>
            </td>
            <td>
                <%= Html.Encode(item.PublicationYear) %>
            </td>
            <td>
                <%= Html.Encode(item.Publisher) %>
            </td>
            <td>
                <%= Html.Encode(item.Hardback) %>
            </td>
            <td>
                <%= Html.Encode(item.DustJacket) %>
            </td>
            <td>
                <%= Html.Encode(item.Notes) %>
            </td>
        </tr>
    
    <% Next%>

    </table>


