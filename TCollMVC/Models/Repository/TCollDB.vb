Imports NHibernate
Imports NHibernate.Cfg
Imports FluentNHibernate.Cfg
Imports FluentNHibernate.Cfg.Db
Imports System.Reflection

Namespace Repository

    Public NotInheritable Class TCollDB

        Private Sub New()
        End Sub

        Private Shared _sessionFactory As ISessionFactory

        Private Shared ReadOnly Property SessionFactory() As ISessionFactory
            Get
                If _sessionFactory Is Nothing Then

                    Dim prop As New Dictionary(Of String, String)
                    prop.Add("show_sql", "True")
                    Dim cfg As New NHibernate.Cfg.Configuration
                    cfg.AddProperties(prop)

                    '-----This is the code used in pre-MVC environment--------------------
                    '_sessionFactory = Fluently.Configure(cfg).Database(FluentNHibernate.Cfg.Db.JetDriverConfiguration.Standard.ConnectionString("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\DEV\Tcoll\valdb.mdb")) _
                    '  .Mappings(Function(m) m.FluentMappings.AddFromAssemblyOf(Of _Default)()) _
                    ' .BuildSessionFactory()

                    '----In the MVC environment, couldn't figure out which class to specify, so specified assembly file explicitly------
                    Dim assembly As Assembly = assembly.LoadFrom(System.Web.HttpContext.Current.Server.MapPath("~/bin/TCollMVC.dll"))

                    _sessionFactory = Fluently.Configure(cfg).Database(FluentNHibernate.Cfg.Db.JetDriverConfiguration.Standard.ConnectionString("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\DEV\Tcoll\valdb.mdb")) _
                      .Mappings(Function(m) m.FluentMappings.AddFromAssembly(assembly)) _
                     .BuildSessionFactory()

                End If

                Return _sessionFactory
            End Get
        End Property

        Public Shared Function OpenSession() As ISession

            Return SessionFactory.OpenSession
        End Function
    End Class
End Namespace




