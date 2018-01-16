
Partial Class Tienda
    Inherits System.Web.UI.Page

    Private Sub Tienda_Load(sender As Object, e As EventArgs) Handles Me.Load
        lblTienda.Text = Session("Tienda")
    End Sub
End Class
