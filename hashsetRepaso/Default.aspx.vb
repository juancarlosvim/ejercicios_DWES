
Partial Class _Default
    Inherits System.Web.UI.Page
    ' declaramos dos hashset


    Private Sub _Default_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Session("originales") = eitquetaHash.getEtiquetas
            Session("seleccionadas") = New SortedSet(Of String)
            'lvEtiquetasOriginales.DataSource = eitquetaHash.getEtiquetas ' ponemos en el orgine de datos las palabras del hasset
            'lvEtiquetasOriginales.DataBind()
        End If

    End Sub
    ' al final de la página el prerender
    Private Sub _Default_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        lvEtiquetasOriginales.DataSource = Session("originales")
        lvEtiquetasOriginales.DataBind()
        lvEtiquetasSeleccionadas.DataSource = Session("seleccionadas")
        lvEtiquetasSeleccionadas.DataBind()

    End Sub

    Private Sub lvEtiquetasOriginales_ItemCommand(sender As Object, e As ListViewCommandEventArgs) Handles lvEtiquetasOriginales.ItemCommand
        If e.CommandName = "elegir" Then
            Session("seleccionadas").add(e.CommandArgument)
            Session("originales").remove(e.CommandArgument)
        End If
    End Sub

    Private Sub lvEtiquetasSeleccionadas_ItemCommand(sender As Object, e As ListViewCommandEventArgs) Handles lvEtiquetasSeleccionadas.ItemCommand
        If e.CommandName = "elegir" Then
            Session("seleccionadas").remove(e.CommandArgument)
            Session("originales").add(e.CommandArgument)
        End If
    End Sub
    Protected Sub btnConsultar_Click(sender As Object, e As EventArgs) Handles btnConsultar.Click
        For Each item In Session("seleccionadas")
            MsgBox(item)
        Next
    End Sub
End Class
