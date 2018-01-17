
Partial Class _Default
    Inherits System.Web.UI.Page

    Public detalle As DetallePedido

    ' crear el diccionario al cargar la página
    ' session("pedido" = new dicctionary(of))

    'Private Sub lvCarta_ItemCommand(sender As Object, e As ListViewCommandEventArgs) Handles lvCarta.ItemCommand
    '    ' que comando se esta ejecutando
    '    'If e.CommandName = "pepe" Then

    '    'End If
    '    ' coger los siguientes datos
    '    detalle.cantidad = CType(e.Item.FindControl("tbCantidad"), TextBox).Text) ' devuelve un control generico y lo transformamos en un textbox
    'End Sub

    Private Sub lvCarta_SelectedIndexChanged(sender As Object, e As EventArgs) Handles lvCarta.SelectedIndexChanged
        ' accesible a su indice
        Dim eleccion = lvCarta.Items(lvCarta.SelectedIndex)
        ' ahora podemos realizar el findControl
        detalle.cantidad = CType(eleccion.FindControl("tbCantidad"), TextBox).Text
        ' producto seleccionado
        detalle.idProducto = lvCarta.SelectedValue

    End Sub
End Class

' declaramos estructura
Public Structure DetallePedido

    Public Property idProducto As Int32
    Public Property cantidad As Int32
    Public Property pvp As Decimal
    'Public Property nombre
End Structure
