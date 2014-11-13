Imports TCollMVC.Domain

Namespace Utilities

    Public Class TCHelper

        Private Const INFLATION_RATE_MULTIPLIER As Double = 1.035

        Public Shared Function CalculateInflatedValue(ByVal val As Double, ByVal iNumYears As Integer) As Double

            If iNumYears > 1 Then
                Return CalculateInflatedValue(val * INFLATION_RATE_MULTIPLIER, iNumYears - 1)
            Else
                Return val * INFLATION_RATE_MULTIPLIER
            End If

        End Function

        Public Shared Function CollectionItemForSelectOption(ByVal oCollectionItem As CollectionItem) As String

            Dim oSB As New StringBuilder


            If Not IsNothing(oCollectionItem.Edition) AndAlso oCollectionItem.Edition.Length > 0 Then
                oSB.Append(oCollectionItem.Edition)
            End If
            If Not IsNothing(oCollectionItem.Impression) AndAlso oCollectionItem.Impression.Length > 0 Then
                If oSB.Length > 0 Then
                    oSB.Append(", ")
                End If
                oSB.Append(oCollectionItem.Impression.PadRight(20, "_"))
            End If

            If Not IsNothing(oCollectionItem.PublicationYear) AndAlso oCollectionItem.PublicationYear <> 0 Then
                If oSB.Length > 0 Then
                    oSB.Append(", ")
                End If
                oSB.Append(oCollectionItem.PublicationYear.ToString)
            End If
            If Not IsNothing(oCollectionItem.Publisher) AndAlso oCollectionItem.Publisher.Length > 0 Then
                If oSB.Length > 0 Then
                    oSB.Append(", ")
                End If
                oSB.Append(oCollectionItem.Publisher)
            End If

            If Not IsNothing(oCollectionItem.Hardback) Then
                If oSB.Length > 0 Then
                    oSB.Append(", ")
                End If
                If oCollectionItem.Hardback Then
                    oSB.Append("HB")
                Else
                    oSB.Append("SB")
                End If
            End If

            If Not IsNothing(oCollectionItem.DustJacket) Then
                If oSB.Length > 0 Then
                    oSB.Append(", ")
                End If
                If oCollectionItem.DustJacket Then
                    oSB.Append("DJ")
                Else
                    oSB.Append("No DJ")
                End If
            End If

            Return oSB.ToString
        End Function

    End Class

End Namespace


