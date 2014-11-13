<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage(Of IEnumerable (Of TCollMVC.Domain.CollectionItemInstance))" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	My Instances
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>My Instances</h2>

     <table class="datatable">
        <tr>
            <th>
                InstanceID
            </th>
            <th>
                ItemID
            </th>
            <th>
                GenericID
            </th>
            <th>
                Title
            </th>
            <th>
                Edition
            </th>
            <th>
                Price
            </th>
            <th>
                NoBid
            </th>
            <th>
                Date Listed
            </th>
  
            <th>
                IBid
            </th>
            <th>
                IBid
                Value
            </th>
            <th>
                Won?
            </th>
            <th>
                Resold?
            </th>
            <th>
                Resale at
            </th>
        </tr>

    <% For Each item In Model%>
    
        <tr>
            <td>
                <%= Html.Encode(item.ItemInstanceID) %>
            </td>
            <td>
                <%= Html.Encode(item.ItemID) %>
            </td>
            <td>
                <%= Html.Encode(item.GenericItemID) %>
            </td>
            <td>
                g<%= Html.ActionLink(item.Title, "ItemInstance", "TCBrowse", New With {.id = item.ItemInstanceID}, New Object)%>
            </td>
            <td>
                <%= Html.Encode(item.Edition) %>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0:F}", item.Price)) %>
            </td>
            <td>
                <% If item.NoBid = True Then
                        Response.Write("Yes")
                   End If
                %>
            </td>
            <td>
                <%  Response.Write(item.DateListed.ToLongDateString)%>
            </td>
   
            <td>
                <% If item.IBid = True then
                        Response.Write("Yes")
                    Else
                        Response.Write("No")
                    End If
                 %>
            </td>
            <td>
                <%  If item.IBidValue <> 0 Then
                        Response.Write(Html.Encode(item.IBidValue))
                    End If
                %>
            </td>
            <td>
                <% If item.IBid = True Then
                        If item.IWon = True Then
                            Response.Write("Yes")
                        Else
                            Response.Write("No")
                        End If
                   End If
                %>
            </td>
            <td>
                <%
                    If item.IWon = True Then
                        If item.Resold = True Then
                            Response.Write("Yes")
                        Else
                            Response.Write("No")
                        End If
                    End If
                %>
            </td>
            <td>
                <% If item.Resold = True Then
                        Response.Write(Html.Encode(item.ResoldValue))
                   End If
                %>
            </td>
        </tr>
        <tr>
          <td colspan="14" class="bigbottom">
                <%= Html.Encode(item.Condition) %>
            </td>
        </tr>

    <% Next%>

    </table>

</asp:Content>

