<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.Master"  Inherits="System.Web.Mvc.ViewPage(Of IQueryable (Of TCollMVC.Domain.CollectionItemInstance))" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	ItemInstances
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<%  
    Dim myCollectionItem As TCollMVC.Domain.CollectionItem = ViewData("collectionitem")
    Dim oResults As Dictionary(Of String, Double) = ViewData("stats")
%>

    <h2>Item Instances for <em><%= myCollectionItem.Title + ", " + myCollectionItem.Edition + ", " + myCollectionItem.Impression + ", " + myCollectionItem.PublicationYear.ToString%></em></h2>

    <br />&nbsp;<strong>
    <table>
    <tr>
        <td>Number of items</td>
        <td><%= String.Format("{0}", oResults("Count"))%></td>
    </tr>
    <tr>
        <td>Average original sale price</td>
        <td><%= String.Format("{0:F}", oResults("Average"))%></td>
    </tr>
    <tr>
        <td>Average adjusted sale price:</td>
        <td><%= String.Format("{0:F}", oResults("InflatedAverage"))%></td>
    </tr>
    </table>
    </strong>
   <br />&nbsp;
    <table class="datatable">
        <tr>
            <th>
                ID
            </th>
            <th>
                Title
            </th>
            <th>
                Edition
            </th>
            <th>
                Price (adj)
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
        <tr><td colspan="11">&nbsp;</td></tr>
    <% For Each item In Model %>
    
        <tr>
            <td>
                <%= Html.Encode(item.ItemInstanceID) %>
            </td>
            <td>
                <%= Html.ActionLink(item.Title, "ItemInstance", New With {.id = item.ItemInstanceID})%>
            </td>
            <td>
                <%= Html.Encode(item.Edition) %>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0:F}", item.Price)) %> (<%= String.Format("{0:F}", TCollMVC.Utilities.TCHelper.CalculateInflatedValue(item.Price, Date.Now.Year - item.DateListed.Year))%>)
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
          <td colspan="12" class="bigbottom">
                <%= Replace(item.Condition, vbCrLf, "<br/>")%><br/>
                <br />&nbsp;
            </td>
        </tr>

    <% 
            
    Next%>

    </table>
     <p>
        <%= Html.ActionLink("Create New", "Create")%>
    </p>
  <p>
        <%= Html.ActionLink("List of instances of this item", "CollectionItems", New With {.id = myCollectionItem.GenericItemID})%>
    </p>
</asp:Content>

