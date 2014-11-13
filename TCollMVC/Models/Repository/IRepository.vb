'---------------------------------------------------------------------------------------------------
' Interface:  IRepository
'             Define the methods which must be implemented to comprise a repository instance
'----------------------------------------------------------------------------------------------------

Imports TCollMVC.Domain

Namespace Repository

    Public Interface IRepository
        Sub Save(ByVal obj As Object)
        Sub Delete(ByVal obj As Object)
        Function GetById(ByVal objType As Type, ByVal objId As Object) As Object
        Function ToList(Of TEntity)(ByVal strHQL As String) As IQueryable(Of TEntity)
        Function GetGenericItem(ByVal iGenericItemID As Integer) As CollectionGenericItem
        Function GetGenericItems() As IQueryable(Of CollectionGenericItem)
        Function GetCollectionItem(ByVal iCollectionItem As Integer) As CollectionItem
        Function GetCollectionItems() As IQueryable(Of CollectionItem)
        '  Function GetCollectionItemsForSelectListByGenericItemID(ByVal GenericItemID) As IQueryable(Of CollectionItem)
        Function GetCollectionItemsByGenericItemID(ByVal iGenericItemID As Integer) As IQueryable(Of CollectionItem)
        Function GetCollectionItemInstance(ByVal iCollectionItemInstanceID As Integer) As CollectionItemInstance
        Function GetInstancesByItemID(ByVal iCollectionItemID As Integer) As IQueryable(Of CollectionItemInstance)
        Function GetMyInstances() As IQueryable(Of CollectionItemInstance)
        Function GetMyBids() As IQueryable(Of CollectionItemInstance)
        Function GetMyCollection() As IQueryable(Of CollectionItemInstance)
        Function CalculateStatsOnInstanceCollection(ByVal ItemID As Integer) As Dictionary(Of String, Double)
        Function CalculateCollectionValue(ByRef iInflatedValue As Double) As Double
    End Interface

End Namespace



