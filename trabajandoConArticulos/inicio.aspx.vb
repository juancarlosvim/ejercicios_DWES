
Partial Class inicio
    Inherits System.Web.UI.Page

    Private Sub gvArticulos_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gvArticulos.SelectedIndexChanged
        Dim idArticulo = gvArticulos.SelectedValue

        Response.Redirect("paginaInforme.aspx?id=" & idArticulo)


    End Sub
End Class
