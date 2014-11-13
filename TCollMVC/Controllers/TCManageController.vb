Imports TCollMVC.Domain

Namespace TCollMVC
    Public Class TCManageController
        Inherits System.Web.Mvc.Controller

        '---------------------------------------------------------------------------------
        '
        ' Used encapsulation to hide the implementation of the repository in a property
        '
        '--------------------

        Private _repo As Repository.RepositoryBase
        Public Sub New()
            _repo = New Repository.RepositoryBase
        End Sub
        Public ReadOnly Property Repo() As Repository.RepositoryBase
            Get
                Return _repo
            End Get
        End Property

        '
        ' GET: /TCManage
        Function Index() As ActionResult
            Return View()
        End Function

        '----OK try it with a strongly typed view---------
        Function CreateII() As ActionResult

            Dim oCollectionItemInstanceViewModel As New ViewModels.ItemInstanceViewModel

            oCollectionItemInstanceViewModel.ItemInstance = New CollectionItemInstance

            oCollectionItemInstanceViewModel.GenericItemsList = New SelectList(_repo.GetGenericItems(), "GenericItemID", "GenericItemTitle")

            '---we need to fill the collection items with an ajax call---- 
            '           oCollectionItemInstanceViewModel.ItemsList = New SelectList(_repo.GetCollectionItemsForSelectList(), "ItemID", "Title")

            ViewData.Model = oCollectionItemInstanceViewModel

            Return View()

        End Function

        '----OK try it with a strongly typed view---------
        <AcceptVerbs(HttpVerbs.Post)>
        Function CreateII(ByVal vm As ViewModels.ItemInstanceViewModel) As ActionResult

            Dim oCollectionItemInstanceViewModel As New ViewModels.ItemInstanceViewModel

            '  _repo.Save(vm.ItemInstance)

            Return View("Index")
        End Function

  
        Function CollectionItems(Optional ByVal GenericItemID As Integer = 0) As JsonResult

            'Dim oCollectionItems As List(Of CollectionItem)
            'Dim iGenericItemID As Integer
            'Try
            '    iGenericItemID = CInt(strGenericItemID)
            'Catch ex As Exception
            '    iGenericItemID = 0
            'End Try
            Dim mycollectionitems = New List(Of Object)()

            ' Dim oResults As New ListItem()
            Dim oCollectionItems = _repo.GetCollectionItemsByGenericItemID(GenericItemID).AsEnumerable
            '           Dim oResults = oCollectionItems.ToArray

            For Each oCI In oCollectionItems
                mycollectionitems.Add(New With {.Text = Utilities.TCHelper.CollectionItemForSelectOption(oCI), .Value = oCI.ItemID})
            Next

            '     Dim oJSONRes As JsonResult
            Dim oResults = mycollectionitems.ToArray
            'Dim oResults() = {New With {.mytext = "Hellow"}, New With {.mytext = "bye"}}

            ' Return Json(mycollectionitems.ToArray, JsonRequestBehavior.AllowGet)
            Return Json(oResults, JsonRequestBehavior.AllowGet)


        End Function

    End Class
End Namespace