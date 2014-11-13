<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage(Of IEnumerable (Of TCollMVC.Domain.CollectionItem))" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	CollectionItems
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>CollectionItems</h2>

    <p>
        <%= Html.ActionLink("Create New", "Create")%>
    </p>
    
    <table class="datatable">
        <tr>
            <th></th>
            <th>
                Item ID
            </th>
            <th>
                Generic Item ID
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
        </tr>

    <% For Each item In Model%>
    
        <tr>
            <td>
                <%= Html.ActionLink("Edit", "EditItem", New With {.id = item.ItemID})%>
            </td>
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
                <% If item.Hardback = "True" Then Response.Write("Yes")%>
            </td>
            <td>
                <% If item.DustJacket = "True" Then Response.Write("Yes") %>
            </td>

        </tr>
    
    <% Next%>

    </table>
<p>
<%= Html.ActionLink("View Generic Items", "GenericItems","TCBrowse")%>

</p>
</asp:Content>

