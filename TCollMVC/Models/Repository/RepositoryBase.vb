'--------------------------------------------------------------------------------------------------------
' Class: RepositoryBase
'        Implementation of the IRepository interface which defines the methods necessary to implement
'        the repository 
'--------------------------------------------------------------------------------------------------------
Imports NHibernate
Imports TCollMVC.Domain

Namespace Repository


    Public Class RepositoryBase
        Implements IRepository, IDisposable

        Protected _session As ISession = Nothing
        Protected _transaction As ITransaction = Nothing

        Public Sub New()
            _session = TCollDB.OpenSession()
        End Sub

        Public Sub New(ByVal session As ISession)
            _session = session
        End Sub

#Region "Transaction and Session Management Methods"

        Public Sub BeginTransaction()
            _transaction = _session.BeginTransaction()
        End Sub

        Public Sub CommitTransaction()
            ' _transaction will be replaced with a new transaction            // by NHibernate, but we will close to keep a consistent state.
            _transaction.Commit()

            CloseTransaction()
        End Sub

        Public Sub RollbackTransaction()
            ' _session must be closed and disposed after a transaction            // rollback to keep a consistent state.
            _transaction.Rollback()

            CloseTransaction()
            CloseSession()
        End Sub

        Private Sub CloseTransaction()
            _transaction.Dispose()
            _transaction = Nothing
        End Sub

        Private Sub CloseSession()
            _session.Close()
            _session.Dispose()
            _session = Nothing
        End Sub

#End Region

#Region "IRepository Members"

        Public Overridable Sub Save(ByVal obj As Object) Implements IRepository.Save
            _session.SaveOrUpdate(obj)
        End Sub

        Public Overridable Sub Delete(ByVal obj As Object) Implements IRepository.Delete
            _session.Delete(obj)
        End Sub

        Public Overridable Function GetById(ByVal objType As System.Type, ByVal objId As Object) As Object Implements IRepository.GetById

            Return _session.Load(objType, objId)

        End Function

        Public Overridable Function ToList(Of TEntity)(ByVal strHQL As String) As IQueryable(Of TEntity) Implements IRepository.ToList

            Dim myQuery = _session.CreateQuery(strHQL)

            Dim myGenItems = myQuery.List()
            Return myGenItems

        End Function


        '----------------------------------------------------------------------------------------------------
        ' Func: GetGenericItem
        ' Desc: Return a single CollectionGenericItem domain object
        '------------------------------------------------------------
        Public Overridable Function GetGenericItem(ByVal iGenericItemId As Integer) As CollectionGenericItem Implements IRepository.GetGenericItem

            Dim oGenericItem As CollectionGenericItem
            oGenericItem = _session.Get(Of CollectionGenericItem)(iGenericItemId)

            Return oGenericItem

        End Function


        '----------------------------------------------------------------------------------------------------
        ' Func: GetGenericItems
        ' Desc: Return a querablable set of CollcetionGenericItem objects ready for further processing down the line
        '------------------------------------------------------------
        Function GetGenericItems() As IQueryable(Of CollectionGenericItem) Implements IRepository.GetGenericItems

            Dim myQuery = _session.CreateQuery("from CollectionGenericItem order by GenericItemTitle")

            Dim myGenItems = myQuery.Enumerable(Of CollectionGenericItem).AsQueryable
            Return myGenItems

        End Function

        '----------------------------------------------------------------------------------------------------
        ' Func: GetCollectionItem
        ' Desc: Return a single CollectionItem domain object
        '------------------------------------------------------------
        Public Overridable Function GetCollectionItem(ByVal iCollectionItemId As Integer) As CollectionItem Implements IRepository.GetCollectionItem

            Dim oCollectionItem As CollectionItem
            oCollectionItem = _session.Get(Of CollectionItem)(iCollectionItemId)

            Return oCollectionItem

        End Function


        '----------------------------------------------------------------------------------------------------
        ' Func: GetCollectionItems
        ' Desc: Return an IQueryable set of CollectionItem objects ready for further processing down the line
        '------------------------------------------------------------
        Function GetCollectionItems() As IQueryable(Of CollectionItem) Implements IRepository.GetCollectionItems

            Dim myQuery = _session.CreateQuery("from CollectionItem order by Title, Edition, Impression")

            Dim myGenItems = myQuery.Enumerable(Of CollectionItem).AsQueryable
            Return myGenItems

        End Function

        Function GetCollectionItemsForSelectListByGenericItemID(ByVal GenericItemID) As IQueryable(Of CollectionItem)

            '---TODO - set the title to be a nice select list display with title, edition and impression-----
            Dim myQuery = _session.CreateQuery("from CollectionItem order by Title, Edition, Impression")

            Dim myGenItems = myQuery.Enumerable(Of CollectionItem).AsQueryable
            Return myGenItems


        End Function

        '----------------------------------------------------------------------------------------------------
        ' Func: GetCollectionItemsByGenericItemID
        ' Desc: Return an IQueryable set of CollectionItem objects based on a specified generic item.
        '------------------------------------------------------------
        Function GetCollectionItemsByGenericItemID(ByVal iGenericItemID As Integer) As IQueryable(Of CollectionItem) Implements IRepository.GetCollectionItemsByGenericItemID

            Dim myQuery = _session.CreateQuery("from CollectionItem where GenericItemID=" + iGenericItemID.ToString)

            Dim myGenItems = myQuery.Enumerable(Of CollectionItem).AsQueryable
            Return myGenItems

        End Function

        '----------------------------------------------------------------------------------------------------
        ' Func: GetCollectionItemInstance
        ' Desc: Return a single CollectionItemInstance domain object
        '------------------------------------------------------------
        Function GetCollectionItemInstance(ByVal iCollectionItemInstanceID As Integer) As CollectionItemInstance Implements IRepository.GetCollectionItemInstance

            Dim oCollectionItemInstance As CollectionItemInstance
            oCollectionItemInstance = _session.Get(Of CollectionItemInstance)(iCollectionItemInstanceID)

            Return oCollectionItemInstance

        End Function


        '----------------------------------------------------------------------------------------------------
        ' Func: GetInstancesByItemID
        ' Desc: Return an IQueryable set of CollectionItemInstances objects based on a specified collection item.
        '------------------------------------------------------------
        Function GetInstancesByItemID(ByVal iCollectionItemID As Integer) As IQueryable(Of CollectionItemInstance) Implements IRepository.GetInstancesByItemID

            Dim myQuery = _session.CreateQuery("from CollectionItemInstance where ItemID=" + iCollectionItemID.ToString)

            Dim myItemInstances = myQuery.Enumerable(Of CollectionItemInstance).AsQueryable
            Return myItemInstances

        End Function

        '----------------------------------------------------------------------------------------------------
        ' Func: GetMyInstances
        ' Desc: Return an IQueryable set of CollectionItemInstances objects for all instances with IWon set
        '------------------------------------------------------------
        Function GetMyInstances() As IQueryable(Of CollectionItemInstance) Implements IRepository.GetMyInstances

            Dim myQuery = _session.CreateQuery("from CollectionItemInstance where IWon=Yes")

            Dim myInstances = myQuery.Enumerable(Of CollectionItemInstance).AsQueryable
            Return myInstances

        End Function

        '----------------------------------------------------------------------------------------------------
        ' Func: GetMyBids
        ' Desc: Return an IQueryable set of CollectionItemInstances objects Return an IQueryable set of CollectionItemInstances objects for all instances with IBid set
        '------------------------------------------------------------
        Function GetMyBids() As IQueryable(Of CollectionItemInstance) Implements IRepository.GetMyBids

            Dim myQuery = _session.CreateQuery("from CollectionItemInstance where IBid=Yes order by title")

            Dim myInstances = myQuery.Enumerable(Of CollectionItemInstance).AsQueryable
            Return myInstances

        End Function

        '----------------------------------------------------------------------------------------------------
        ' Func: GetMyCollection
        ' Desc: Return an IQueryable set of CollectionItemInstances objects Return an IQueryable set of CollectionItemInstances objects for all instances with IBid set
        '------------------------------------------------------------
        Function GetMyCollection() As IQueryable(Of CollectionItemInstance) Implements IRepository.GetMyCollection

            Dim myQuery = _session.CreateQuery("from CollectionItemInstance where IWon=Yes and Resold=No order by title")

            Dim myInstances = myQuery.Enumerable(Of CollectionItemInstance).AsQueryable
            Return myInstances

        End Function

        Function CalculateCollectionValue(ByRef dInflatedTotal As Double) As Double Implements IRepository.CalculateCollectionValue

            Dim myQuery = _session.CreateQuery("from CollectionItemInstance where IWon=Yes and Resold=No order by title")

            Dim myItemInstances = myQuery.Enumerable(Of CollectionItemInstance).AsQueryable

            Dim oDictResults As New Dictionary(Of String, Double)
            Dim dTotal As Double = 0
            Dim iCount As Double = 0

            Dim iYearDifference As Integer

            For Each instance As CollectionItemInstance In myItemInstances.ToList
                dTotal += instance.Price
                iYearDifference = DateDiff(DateInterval.Year, instance.DateListed, Now)
                If iYearDifference = 0 Then
                    dInflatedTotal += instance.Price
                Else
                    dInflatedTotal += Utilities.TCHelper.CalculateInflatedValue(instance.Price, iYearDifference)
                End If
                iCount += 1
            Next

            '           Dim thevalue = myQuery.Enumerable(Of CollectionItemInstance).AsQueryable.Sum(Function(x) x.Price)
            Return dTotal

        End Function

        Function CalculateStatsOnInstanceCollection(ByVal ItemID As Integer) As Dictionary(Of String, Double) Implements IRepository.CalculateStatsOnInstanceCollection

            Dim myQuery = _session.CreateQuery("from CollectionItemInstance where ItemID=" + ItemID.ToString)

            Dim myItemInstances = myQuery.Enumerable(Of CollectionItemInstance).AsQueryable

            Dim oDictResults As New Dictionary(Of String, Double)
            Dim dTotal As Double = 0
            Dim iCount As Double = 0
            Dim dInflatedTotal As Double = 0
            Dim iYearDifference As Integer

            For Each instance As CollectionItemInstance In myItemInstances.ToList
                If Not instance.NoBid Then
                    dTotal += instance.Price
                    iYearDifference = DateDiff(DateInterval.Year, instance.DateListed, Now)
                    If iYearDifference = 0 Then
                        dInflatedTotal += instance.Price
                    Else
                        dInflatedTotal += Utilities.TCHelper.CalculateInflatedValue(instance.Price, iYearDifference)
                    End If
                    iCount += 1
                End If

            Next

            Try
                oDictResults.Add("Average", dTotal / iCount)
            Catch ex As Exception
                oDictResults.Add("Average", 0)
            End Try

            oDictResults.Add("Count", iCount)
            oDictResults.Add("InflatedTotal", dInflatedTotal)

            Try
                oDictResults.Add("InflatedAverage", dInflatedTotal / iCount)
            Catch ex As Exception
                oDictResults.Add("InflatedAverage", 0)
            End Try

            Return oDictResults

        End Function



#End Region

#Region "IDisposable Members"

        Public Sub Dispose() Implements IDisposable.Dispose
            If _transaction IsNot Nothing Then
                ' Commit transaction by default, unless user explicitly rolls it back.
                ' To rollback transaction by default, unless user explicitly commits,                // comment out the line below.
                CommitTransaction()
            End If

            If _session IsNot Nothing Then
                _session.Flush()
                ' commit session transactions
                CloseSession()
            End If
        End Sub

#End Region

    End Class


End Namespace



