
Partial Class _Default
    Inherits System.Web.UI.Page
    ' declaramos dos hashset


    Private Sub _Default_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

            lvEtiquetasOriginales.DataSource = eitquetaHash.getEtiquetas
            lvEtiquetasOriginales.DataBind()
            lvEtiquetasSeleccionadas.DataSource = New HashSet(Of String)
            lvEtiquetasSeleccionadas.DataBind()

            'Session("originales") = 
            'Session("seleccionadas") = 
            'lvEtiquetasOriginales.DataSource = eitquetaHash.getEtiquetas ' ponemos en el orgine de datos las palabras del hasset
            'lvEtiquetasOriginales.DataBind()
        End If

    End Sub

    ' al final de la página el prerender
    Private Sub _Default_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender


    End Sub

    Private Sub btnConsultar_Click(sender As Object, e As EventArgs) Handles btnConsultar.Click
        ' Imprimir los datos del formulario
        'MsgBox(Request.Form("datos"))
        ' utilizo una variable para trabajar con los datos del formulario
        Dim datoRecuperados As String = Request.Form("datos")
        Dim sepDatos = datoRecuperados.Split(":")
        For Each i In sepDatos
            Response.Write(i)
        Next




    End Sub
End Class
