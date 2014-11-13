'---------------------------------------------------------------------------
'
' Class: CollectionItemInstanceMap
'
' Mapping of the POCO CollectionItemInstance to its persistent equivalent table
' CollectionItemInstance in the db
'
'----------------------------------------
Imports FluentNHibernate.Mapping
Imports TCollMVC.Domain

Namespace Mapping
    Public Class CollectionItemInstanceMap
        Inherits ClassMap(Of CollectionItemInstance)

        Public Sub New()
            Table("CollectionItemInstances")
            Id(Function(x) x.ItemInstanceID)
            Map(Function(x) x.ItemID).Not.Nullable()
            Map(Function(x) x.GenericItemID)
            Map(Function(x) x.Edition).Nullable()
            Map(Function(x) x.Title).Nullable()
            Map(Function(x) x.Price).Nullable()
            Map(Function(x) x.NoBid).Nullable()
            Map(Function(x) x.DateListed).Nullable()
            Map(Function(x) x.Condition).Nullable()
            Map(Function(x) x.IBid).Nullable()
            Map(Function(x) x.IBidValue).Nullable()
            Map(Function(x) x.IWon).Nullable()
            Map(Function(x) x.Resold).Nullable()
            Map(Function(x) x.ResoldValue).Nullable()
            Map(Function(x) x.ExcludeFromItemValuation).Nullable()
            References(Function(x) x.CollectionItem).Column("ItemID")

        End Sub


    End Class
End Namespace


