Imports FluentNHibernate.Mapping
Imports TCollMVC.Domain

'---------------------------------------------------------------------------
'
' Class: CollectionGenericItem
'
' Mapping of the POCO GenericItemInstances to its persistent equivalent table
' GenericItemInstances in the db
'
'----------------------------------------

Namespace Mapping

    Public Class CollectionGenericItemMap
        Inherits ClassMap(Of Domain.CollectionGenericItem)

        Public Sub New()
            Table("CollectionGenericItems")
            Id(Function(x) x.GenericItemID)
            Map(Function(x) x.GenericItemTitle)
            HasMany(Function(x) x.CollectionItems).KeyColumn("GenericItemID")
        End Sub
    End Class

End Namespace


