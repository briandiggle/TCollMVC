<%@ Page Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="indexTitle" ContentPlaceHolderID="TitleContent" runat="server">
    TColl Main options
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%=Html.Encode(ViewData("Message"))%></h2>
    
        <h3>Browse</h3>
        <p>
            <%= Html.ActionLink("Browse Generic Items", "GenericItems", "TCBrowse")%><br/>
            <%= Html.ActionLink("Browse Items", "CollectionItems", "TCBrowse")%><br/>
            <%= Html.ActionLink("Browse Instances", "Instances", "TCBrowse")%><br/>
        </p>
       <h3>Search</h3>
        <p>
            <%= Html.ActionLink("Search Generic Items", "GenericItems", "TCSearch")%><br/>
            <%= Html.ActionLink("Search Items", "Items", "TCSearch")%><br/>
            <%= Html.ActionLink("Search Instances", "Instances", "TCSearch")%><br/>
        </p>

     <h3>Reports</h3>
        <p>
            <%= Html.ActionLink("My instances", "MyInstances", "TCReport")%><br/>
            <%= Html.ActionLink("My bids", "MyBids", "TCReport")%><br/>
            <%= Html.ActionLink("My Collection", "MyCollection", "TCReport")%><br/>
       </p>
    
    <h3>Create/Edit</h3>
        <p>
            <%= Html.ActionLink("Create Instance", "CreateII", "TCManage")%><br/>
            <%= Html.ActionLink("Edit Instance", "EditItemInstance", "TCManage")%><br/>
            <%= Html.ActionLink("Delete Instance", "DeleteItemInstance", "TCManage")%><br/>
            <%= Html.ActionLink("Create Item", "CreateItem", "TCManage")%><br/>
            <%= Html.ActionLink("Edit Item", "EditItem", "TCManage")%><br/>
            <%= Html.ActionLink("Create Generic Item", "CreateItem", "TCManage")%><br/>
            <%= Html.ActionLink("Edit Generic Item", "EditItem", "TCManage")%><br/>
        </p>
</asp:Content>
