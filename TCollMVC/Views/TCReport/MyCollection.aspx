<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage(Of IEnumerable (Of TCollMVC.Domain.CollectionItemInstance))" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	MyCollection
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<script type="text/javascript">
        $(document).ready(function()
        {  //hide the all of the element with class msg_body  
        $(".itemdetails").hide();
        //toggle the componenet with class msg_body  
        $(".itemheader").click(function () {

            $(this).next(".itemdetails").slideToggle(300);
        });
    });
</script>

    <h2>MyCollection</h2>

    <h3>
        Value at time of purchase: <%= Html.Encode(String.Format("{0:F}", ViewData("CollectionValue")))%><br/>
        Estimated total value now: <%= Html.Encode(String.Format("{0:F}", ViewData("InflatedValue")))%>
    </h3>
       
    <table class="datatable">
        <tr>
    
            <th>
                ItemInstanceID
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
                IBid Value
            </th>
            <th>
                IWon
            </th>
            <th>
                Resold
            </th>
            <th>
                Resold Value
            </th>
        </tr>

    <% For Each item In Model%>
    
        <tr class="itemheader">
   
            <td>
                <%= Html.Encode(item.ItemInstanceID) %>
            </td>
   
            <td>
                <%= Html.Encode(item.Title) %>
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
                <% Response.Write(item.DateListed.ToString("dd MMM yy"))%>
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
                <%= Html.Encode(String.Format("{0:F}", item.IBidValue))%>
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
                <%= Html.Encode(item.Resold) %>
            </td>
            <td>
               <% If item.Resold = True Then
                        Response.Write(Html.Encode(item.ResoldValue))
                        
                   End If
                %>
            </td>
        </tr>
       <tr class="itemdetails">
          <td colspan="14" class="bigbottom">
                <%= item.Condition%><br/>
                
            </td>
        </tr>    
    <% Next%>

    </table>

</asp:Content>

