
Partial Class confirmacionRegistro
    Inherits System.Web.UI.Page

    Private Sub confirmacionRegistro_Load(sender As Object, e As EventArgs) Handles Me.Load
        'Dim idAutorRegistrado = Request.QueryString("id")
        'MsgBox(idAutorRegistrado)
        '' cambiar la tabla autores para que el usuario este activado
        'sqDsActivarAutor.UpdateCommand = "UPDATE autores Set activado = 1 WHERE idAutor = " & idAutorRegistrado
        sqlDsActivar.Update()

    End Sub
End Class
