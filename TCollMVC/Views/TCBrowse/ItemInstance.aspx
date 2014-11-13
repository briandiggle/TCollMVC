<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage(Of TCollMVC.Domain.CollectionItemInstance)" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	ItemInstance
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>ItemInstance</h2>

    <fieldset>
        <legend>Fields</legend>
        <table class="datatable">
        <tr>
            <td class="titlecell">Title</td>
            <td class="titlecell"><%= Html.Encode(Model.Title) %></td>
        </tr>
        <tr>
            <td>ItemInstanceID</td>
            <td><%= Html.Encode(Model.ItemInstanceID) %></td>
        </tr>
        <tr>
            <td>ItemID</td>
            <td><%= Html.Encode(Model.ItemID) %></td>
        </tr>
        <tr>
            <td>GenericItemID</td>
            <td><%= Html.Encode(Model.GenericItemID) %></td>
        </tr>
        <tr>
            <td>Edition</td>
            <td><%= Html.Encode(Model.Edition) %></td>
        </tr>
        <tr>
            <td>Price</td>
            <td><%= Html.Encode(String.Format("{0:F}", Model.Price)) %></td>
        </tr>
        <tr>
            <td>No Bid?</td>
            <td><% If Model.NoBid = True Then
                        Response.Write("Yes")
                   End If
                %></td>
        </tr>
        <tr>
            <td>Date Listed</td>
            <td><%= Model.DateListed.ToLongDateString%></td>
        </tr>
        <tr>
            <td>Condition</td>
            <td><%= Html.Encode(Model.Condition) %></td>
        </tr>
        <tr>
            <td>I Bid?</td>
            <td><% If model.IBid = True then
                        Response.Write("Yes")
                    Else
                        Response.Write("No")
                    End If
                 %></td>
        </tr>
        <tr>
            <td>My bid</td>
            <td>
               <%  If Model.IBidValue <> 0 Then
                       Response.Write(Html.Encode(Model.IBidValue))
                   End If
                %>            
            </td>
        </tr>
        <tr>
            <td>Won?</td>
            <td>
                <%  If Model.IBid = True Then
                        If Model.IWon = True Then
                            Response.Write("Yes")
                        Else
                            Response.Write("No")
                        End If
                    End If
                %>           
            </td>
        </tr>
        <tr>
            <td>Resold?</td>
            <td><%
                    If Model.IWon = True Then
                        If Model.Resold = True Then
                            Response.Write("Yes")
                        Else
                            Response.Write("No")
                        End If
                    End If
                 %>
            </td>
        </tr>                                           
        <tr>
            <td>Resale amnt</td>
            <td>
               <%  If Model.Resold = True Then
                       Response.Write(Html.Encode(Model.ResoldValue))
                   End If
                %>            
            </td>
        </tr>            
        
        </table>

    </fieldset>
    <p>
        <%= Html.ActionLink("List of instances of this item", "ItemInstances", New With {.id = Model.ItemID})%>
    </p>

</asp:Content>

