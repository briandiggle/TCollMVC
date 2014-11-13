'-----------------------------------------------------------------------------
'
' Class: CollectionGenericItem
'
' Domain for a generic item. Will be mapped to CollectionGenericItems table
' by the class CollectionGenericItemsMap by Fluent NHibernate
'
' This is a POCO
'-------------------------------------

Namespace Domain

    Public Class CollectionGenericItem

        '----Item instance id property----------------------------------------
        Private _GenericItemID As Integer
        Public Overridable Property GenericItemID() As Integer
            Get
                Return _GenericItemID
            End Get
            Set(ByVal value As Integer)
                _GenericItemID = value
            End Set
        End Property

        '----Generic Item Title property--------------------------
        Private _GenericItemTitle As String
        Public Overridable Property GenericItemTitle() As String
            Get
                Return _GenericItemTitle
            End Get
            Set(ByVal value As String)
                _GenericItemTitle = value
            End Set
        End Property

        '----Will hold the collection items based on this generic item-----------
        Private _CollectionItems As IList(Of CollectionItem)
        Public Overridable Property CollectionItems() As IList(Of CollectionItem)
            Get
                Return _CollectionItems
            End Get
            Set(ByVal value As IList(Of CollectionItem))
                _CollectionItems = value
            End Set
        End Property
    End Class

End Namespace


