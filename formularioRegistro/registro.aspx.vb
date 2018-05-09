
Partial Class registro
    Inherits System.Web.UI.Page



    Private Sub registro_Load(sender As Object, e As EventArgs) Handles Me.Load
        ' CAMBIAR EL MODO DE REGISTRO EN INSERT
        fvRegistro.ChangeMode(FormViewMode.Insert)
    End Sub

    Private Sub sqlDsRegistro_Inserted(sender As Object, e As SqlDataSourceStatusEventArgs) Handles sqlDsRegistro.Inserted
        ' obtenemos el idAutor
        Dim idAutor = e.Command.Parameters("@idAutor").Value
        If idAutor <> 0 Then
            Response.Redirect("confirmacionRegistro.aspx?id=" & idAutor)
        End If
        'MsgBox(e.Command.Parameters("@idAutor").Value)
    End Sub
End Class
