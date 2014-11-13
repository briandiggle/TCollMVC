<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Manage Index</h2>
    <p>
         <p>
            <%= Html.ActionLink("Create Instance", "CreateItemInstance", "TCManage")%><br/>
            <%= Html.ActionLink("Edit Instance", "EditItemInstance", "TCManage")%><br/>
            <%= Html.ActionLink("Delete Instance", "DeleteItemInstance", "TCManage")%><br/>
            <%= Html.ActionLink("Create Item", "CreateItem", "TCManage")%><br/>
            <%= Html.ActionLink("Edit Item", "EditItem", "TCManage")%><br/>
            <%= Html.ActionLink("Create Generic Item", "CreateItem", "TCManage")%><br/>
            <%= Html.ActionLink("Edit Generic Item", "EditItem", "TCManage")%><br/>
        </p>
</p>
</asp:Content>
