Imports FluentNHibernate.Mapping
Imports TCollMVC.Domain

'---------------------------------------------------------------------------
'
' Class: CollectionItemsMap
'
' Mapping of the POCO CollectionItem to its persistent equivalent table
' CollectionItems in the db
'
'----------------------------------------

Namespace Mapping

    Public Class CollectionItemMap
        Inherits ClassMap(Of CollectionItem)

        Public Sub New()
            Table("CollectionItems")
            Id(Function(x) x.ItemID)
            Map(Function(x) x.GenericItemID).Nullable()
            Map(Function(x) x.Title).Nullable()
            Map(Function(x) x.Edition).Nullable()
            Map(Function(x) x.Impression).Nullable()
            Map(Function(x) x.PublicationYear).Nullable()
            Map(Function(x) x.Publisher).Nullable()
            Map(Function(x) x.Hardback).Nullable()
            Map(Function(x) x.DustJacket).Nullable()
            Map(Function(x) x.Notes).Nullable()
            HasMany(Function(x) x.ItemInstances).KeyColumn("ItemID")
        End Sub
    End Class
 
End Namespace




