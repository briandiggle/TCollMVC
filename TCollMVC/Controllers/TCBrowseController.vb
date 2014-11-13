Imports TCollMVC.Domain

Namespace TCollMVC
    Public Class TCBrowseController
        Inherits System.Web.Mvc.Controller


        Dim repo As Repository.RepositoryBase
      
        Public Sub New()
            repo = New Repository.RepositoryBase
        End Sub

        Function Index() As ActionResult

            If Not Request.IsAjaxRequest Then
                Dim items = repo.GetCollectionItems
                ViewData("items") = New SelectList(items, "ItemID", "Title")
                Return View()
            Else
                Return View()
            End If


        End Function


        '-------------------------------------------------------------------------------------
        ' Action: GenericItems  
        ' Desc:   Get a full list of the generic items
        '-----------------------------------------------
        Function GenericItems() As ActionResult

            Dim genitems = repo.GetGenericItems()

            Return View(genitems)

        End Function


        '-------------------------------------------------------------------------------------
        ' Action: GenericItem 
        ' Desc:   Get a generic item
        '-----------------------------------------------
        Function GenericItem(ByVal iGenericItemID As Integer) As ActionResult

            Dim genitem = repo.GetGenericItem(iGenericItemID)

            Return View(genitem)

        End Function


        '-------------------------------------------------------------------------------------
        ' Action: CollectionItems
        ' Desc:   Get all collection items
        '-----------------------------------------------
        Function CollectionItems(Optional ByVal id As Integer = 0) As ActionResult

            Dim genitem As IQueryable(Of CollectionItem)

            If id = 0 Then
                genitem = repo.GetCollectionItems()
            Else
                genitem = repo.GetCollectionItemsByGenericItemID(id)
            End If
            Return View(genitem)

        End Function

        '-------------------------------------------------------------------------------------
        ' Action: CollectionItem 
        ' Desc:   Get a collection item
        '-----------------------------------------------
        Function CollectionItem(ByVal id As Integer) As ActionResult

            Dim mycollectionitem = repo.GetCollectionItem(id)

            Return View(mycollectionitem)

        End Function

        '-------------------------------------------------------------------------------------
        ' Action: ItemInstances
        ' Desc:   Get all collection item instances based on specified item ID
        '-----------------------------------------------
        Function ItemInstances(Optional ByVal id As Integer = 0) As ActionResult

            Dim genitems As IQueryable(Of CollectionItemInstance)
            'Dim oResultDict As Dictionary(Of String, Double)

            Dim collectionitem = repo.GetCollectionItem(id)

            If id = 0 Then
                genitems = repo.GetCollectionItems()
            Else
                genitems = repo.GetInstancesByItemID(id)
            End If

            ViewData("itemid") = id
            ViewData("collectionitem") = collectionitem



            ViewData("stats") = repo.CalculateStatsOnInstanceCollection(id)


            Return View(genitems)

        End Function

        '-------------------------------------------------------------------------------------
        ' Action: ItemInstance 
        ' Desc:   Get a collection item instance
        '-----------------------------------------------
        Function ItemInstance(ByVal id As Integer) As ActionResult

            Dim myiteminstance = repo.GetCollectionItemInstance(id)

            Return View(myiteminstance)

        End Function

  

        Function UpdateItemDetails(ByVal id As Integer) As ActionResult

            Dim myitem = repo.GetCollectionItem(id)
            Return PartialView("AJAXItem", myitem)

        End Function

        '-------------------------------------------------------------------------------------
        ' Action: AJAXItems
        ' Desc:   Return a partical view containing the items for a given generic item
        '-----------------------------------------------

        Function AJAXItems(ByVal id As Integer) As ActionResult

            Dim myitems = repo.GetCollectionItemsByGenericItemID(id)
            Return PartialView("AJAXItems", myitems)


        End Function

    End Class
End Namespace