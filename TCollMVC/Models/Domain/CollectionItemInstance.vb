'-----------------------------------------------------------------------------
'
' Class: CollectionItemInstance
'
' Domain for an instance of a item. Will be mapped to CollectionItemInstances table
' by the class CollectionItemInstancesMap by Fluent NHibernate
'
' This is a POCO
'-------------------------------------

Namespace Domain

    Public Class CollectionItemInstance

        '----Item instance id property----------------------------------------
        Private _ItemInstanceID As Integer
        Public Overridable Property ItemInstanceID() As Integer
            Get
                Return _ItemInstanceID
            End Get
            Set(ByVal value As Integer)
                _ItemInstanceID = value
            End Set
        End Property

        '----Item ID property---------------------------------------------------
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

        '-----Price property--------------------------------------
        Private _Price As Double
        Public Overridable Property Price() As Double
            Get
                Return _Price
            End Get
            Set(ByVal value As Double)
                _Price = value
            End Set
        End Property

        '----NoBid property----------------------------
        Private _NoBid As Boolean
        Public Overridable Property NoBid() As Boolean
            Get
                Return _NoBid
            End Get
            Set(ByVal value As Boolean)
                _NoBid = value
            End Set
        End Property

        '-----DateListed property-----------------------------
        Private _DateListed As Date
        Public Overridable Property DateListed() As Date
            Get
                Return _DateListed
            End Get
            Set(ByVal value As Date)
                _DateListed = value
            End Set
        End Property


        '-----Condition property-----------------------------
        Private _Condition As String
        Public Overridable Property Condition() As String
            Get
                Return _Condition
            End Get
            Set(ByVal value As String)
                _Condition = value
            End Set
        End Property

        '----IBid property----------------------------
        Private _IBid As Boolean
        Public Overridable Property IBid() As Boolean
            Get
                Return _IBid
            End Get
            Set(ByVal value As Boolean)
                _IBid = value
            End Set
        End Property

        '----IBidValue property----------------------------
        Private _IBidValue As Integer
        Public Overridable Property IBidValue() As Integer
            Get
                Return _IBidValue
            End Get
            Set(ByVal value As Integer)
                _IBidValue = value
            End Set
        End Property

        '----IWon property----------------------------
        Private _IWon As Boolean
        Public Overridable Property IWon() As Boolean
            Get
                Return _IWon
            End Get
            Set(ByVal value As Boolean)
                _IWon = value
            End Set
        End Property

        '----Resold property----------------------------
        Private _Resold As Boolean
        Public Overridable Property Resold() As Boolean
            Get
                Return _Resold
            End Get
            Set(ByVal value As Boolean)
                _Resold = value
            End Set
        End Property

        '----ResoldValue property----------------------------
        Private _ResoldValue As Integer
        Public Overridable Property ResoldValue() As Integer
            Get
                Return _ResoldValue
            End Get
            Set(ByVal value As Integer)
                _ResoldValue = value
            End Set
        End Property

        '-----CollectionItem property will hold the referenced collection item----------
        Private _CollectionItem As CollectionItem
        Public Overridable Property CollectionItem As CollectionItem
            Get
                Return _CollectionItem
            End Get
            Set(ByVal value As CollectionItem)
                _CollectionItem = value
            End Set
        End Property

        '-----ExcludeFromItemValuation property-----------------------------
        Private _ExcludeFromItemValuation As Boolean
        Public Overridable Property ExcludeFromItemValuation() As Boolean
            Get
                Return _ExcludeFromItemValuation
            End Get
            Set(ByVal value As Boolean)
                _ExcludeFromItemValuation = value
            End Set
        End Property
    End Class


End Namespace

