'-----------------------------------------------------------------------------
'
' Class: CollectionItem
'
' Domain for an collection item. Will be mapped to CollectionItems table
' by the class CollectionItemsMap by Fluent NHibernate
'
' This is a POCO
'-------------------------------------
Namespace Domain

    Public Class CollectionItem

        '----Item id property----------------------------------------
        Private _ItemID As Integer
        Public Overridable Property ItemID() As Integer
            Get
                Return _ItemID
            End Get
            Set(ByVal value As Integer)
                _ItemID = value
            End Set
        End Property

        '-----GenericItemID property------------------------------------------
        Private _GenericItemID As Integer
        Public Overridable Property GenericItemID() As Integer
            Get
                Return _GenericItemID
            End Get
            Set(ByVal value As Integer)
                _GenericItemID = value
            End Set
        End Property

        '----Title property--------------------------
        Private _Title As String
        Public Overridable Property Title() As String
            Get
                Return _Title
            End Get
            Set(ByVal value As String)
                _Title = value
            End Set
        End Property

        '----Edition property-------------------------------
        Private _Edition As String
        Public Overridable Property Edition() As String
            Get
                Return _Edition
            End Get
            Set(ByVal value As String)
                _Edition = value
            End Set
        End Property

        '----Impression property-------------------------------
        Private _Impression As String
        Public Overridable Property Impression() As String
            Get
                Return _Impression
            End Get
            Set(ByVal value As String)
                _Impression = value
            End Set
        End Property

        '-----GenericItemID property------------------------------------------
        Private _PublicationYear As Integer
        Public Overridable Property PublicationYear() As Integer
            Get
                Return _PublicationYear
            End Get
            Set(ByVal value As Integer)
                _PublicationYear = value
            End Set
        End Property

        '-----Publisher property-----------------------------
        Private _Publisher As String
        Public Overridable Property Publisher() As String
            Get
                Return _Publisher
            End Get
            Set(ByVal value As String)
                _Publisher = value
            End Set
        End Property

        '----Hardback property----------------------------
        Private _Hardback As Boolean
        Public Overridable Property Hardback() As Boolean
            Get
                Return _Hardback
            End Get
            Set(ByVal value As Boolean)
                _Hardback = value
            End Set
        End Property

        '----DustJacket property----------------------------
        Private _DustJacket As Boolean
        Public Overridable Property DustJacket() As Boolean
            Get
                Return _DustJacket
            End Get
            Set(ByVal value As Boolean)
                _DustJacket = value
            End Set
        End Property

        '----Will hold the instances of this collection item-----------
        Private _ItemInstances As IList(Of CollectionItemInstance)
        Public Overridable Property ItemInstances() As IList(Of CollectionItemInstance)
            Get
                Return _ItemInstances
            End Get
            Set(ByVal value As IList(Of CollectionItemInstance))
                _ItemInstances = value
            End Set
        End Property

        '-----Notes property-----------------------------
        Private _Notes As String
        Public Overridable Property Notes() As String
            Get
                Return _Notes
            End Get
            Set(ByVal value As String)
                _Notes = value
            End Set
        End Property
    End Class

End Namespace



