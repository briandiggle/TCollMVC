Imports TCollMVC.Domain

Namespace TCollMVC
    Public Class TCReportController
        Inherits System.Web.Mvc.Controller

        Public repo As Repository.RepositoryBase

        Public Sub New()
            repo = New Repository.RepositoryBase
        End Sub

        Function Index() As ActionResult
            Return View()
        End Function

        Public Function MyInstances() As ActionResult

            Dim mycollection = repo.GetMyInstances()

            Return View(mycollection)

        End Function

        Public Function MyBids() As ActionResult

            Dim mycollection = repo.GetMyBids()

            Return View(mycollection)

        End Function


        Public Function MyCollection() As ActionResult

            Dim thecollection = repo.GetMyCollection()
            Dim dInflatedValue As Double = 0
            Dim collectionvalue As Double = repo.CalculateCollectionValue(dInflatedValue)

            ViewData("CollectionValue") = collectionvalue

            ViewData("InflatedValue") = dInflatedValue
            Return View(thecollection)

        End Function
    End Class
End Namespace