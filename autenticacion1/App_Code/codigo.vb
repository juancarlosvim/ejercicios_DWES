Imports System.Data.SqlClient
Imports System.Data
Imports Microsoft.VisualBasic

Public Class codigo
    Public Shared Function okUsuario(ByVal usuario As String, ByVal password As String) As DataTable
        Dim dt As New DataTable
        Dim cnx As New SqlConnection("Data Source=(local);Initial Catalog=Telefood;Integrated security=SSPI;")
        Dim sentencia As String = "select * from clientes Where nick=@u and password=@p"
        Dim cmd As New SqlCommand(sentencia, cnx)
        cmd.Parameters.Add("@u", SqlDbType.Char, 20).Value = usuario
        cmd.Parameters.Add("@p", SqlDbType.Char, 15).Value = password
        Try
            Dim adt As New SqlDataAdapter(cmd)
            adt.Fill(dt)

        Catch ex As Exception
        Finally
            cnx.Dispose()
        End Try
        Return dt
    End Function
End Class
