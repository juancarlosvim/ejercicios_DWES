Imports System.Data
Imports System.Data.SqlClient

Partial Class _Default
    Inherits System.Web.UI.Page

    Private Sub _Default_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim id = Request.QueryString("id")
        Dim conexion = "Data Source=(local);Initial Catalog=Telefood;Integrated Security=SSPI"
        Dim sentencia As String = "select * from productos where idCat =@idCat"
        Dim cnx As New SqlConnection(conexion)
        Dim cmd As New SqlCommand(sentencia, cnx)
        cmd.Parameters.AddWithValue("idCat", id)
        Dim adt As New SqlDataAdapter(cmd)
        Dim dt As New DataTable
        adt.Fill(dt)
        ' instalamos la extension desde administradror  de paquetes nuget
        Dim stringJson = Newtonsoft.Json.JsonConvert.SerializeObject(dt) ' devuelve un string con el formato json
        Response.Clear()
        Response.Write(stringJson)
        Response.End()
    End Sub
End Class
