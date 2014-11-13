<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage(Of IEnumerable (Of TCollMVC.Domain.CollectionItemInstance))" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	My Bids
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>My Bids</h2>
    <br />
    <table class="datatable">
        <tr>
            <th class="thincolumn">
                Instance ID
            </th>
            <th>
                Title
            </th>
            <th>
                Edition
            </th>
            <th>
                Date Listed
            </th>
           <th class="thincolumn">
                Sale Price
            </th>
            <th class="thincolumn">
                My Bid
            </th>
            <th class="thincolumn">
                I Won?
            </th>
            <th class="thincolumn">
                Resold Value
            </th>
        </tr>

    <% For Each item In Model%>
    
         <tr>
            <td>
                <%= Html.Encode(item.ItemInstanceID) %>
            </td>

            <td>
                <%= Html.ActionLink(item.Title, "ItemInstance", "TCBrowse", New With {.id = item.ItemInstanceID}, New Object)%>
            </td>
            <td>
                <%= Html.Encode(item.Edition) %>
            </td>
           <td>
                <%  Response.Write(item.DateListed.ToLongDateString)%>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0:F}", item.Price)) %>
            </td>
            <td>
                <%  If item.IBidValue <> 0 Then
                        Response.Write(Html.Encode(String.Format("{0:F}", item.IBidValue)))
                    End If
                %>
            </td>
            <td>
                <%
                    If item.IWon = True Then
                       
                        Response.Write("Yes")
                    Else
                        Response.Write("No")
                    
                    End If
                %>
            </td>
            <td>
                <% If item.Resold = True Then
                        Response.Write(Html.Encode(String.Format("{0:F}", item.ResoldValue)))
                   End If
                %>
            </td>
        </tr>
  
    <% Next%>

    </table>

</asp:Content>

