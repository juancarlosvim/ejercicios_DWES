
Partial Class tienda
    Inherits System.Web.UI.Page

    Private detalle As DetallePedido

    Private Sub tienda_Load(sender As Object, e As EventArgs) Handles Me.Load
        ' hacemos que cargue por defecto las pizzas ya que si no nos muestra por defecto -1
        lvCategorias.SelectedIndex = 0
        lblTienda.Text = Session("datosTienda")


    End Sub

    Protected Sub lvProductos_SelectedIndexChanged(sender As Object, e As EventArgs) Handles lvProductos.SelectedIndexChanged
        Dim indice = lvProductos.SelectedIndex ' indice del listView

        Dim clave = lvProductos.SelectedDataKey.Value ' obtener la clave
        Dim cantidad = CType(lvProductos.Items.Item(indice).FindControl("txbCantidad"), TextBox).Text
        Dim nombreProducto = CType(lvProductos.Items.Item(indice).FindControl("productoLabel"), Label).Text
        Dim precio = CType(lvProductos.Items.Item(indice).FindControl("precioLabel"), Label).Text
        'Response.Write("nombreProducto => " & nombreProducto)
        'Response.Write("precio => " & precio)
        'Response.Write("cantidad => " & cantidad)

        detalle.idProducto = clave
        detalle.cantidad = cantidad
        detalle.pvp = precio
        detalle.nombre = nombreProducto

        'Response.Write("idProducto => " & detalle.idProducto)
        'Response.Write("cantidad => " & detalle.cantidad)
        'Response.Write("precio => " & detalle.pvp)
        'Response.Write("nombre => " & detalle.nombre)

        'If Session("pedido").ContainsKey(detalle.idProducto) Then
        '    Dim vigente = Session("pedido")(detalle.idProducto)
        '    detalle.cantidad += vigente.cantidad
        'End If
        Session("pedido")(detalle.idProducto) = detalle

        gvCompra.DataSource = Session("pedido").values
        gvCompra.DataBind()



    End Sub

    Private Sub tienda_Init(sender As Object, e As EventArgs) Handles Me.Init
        If Session("tienda") Is Nothing Then
            Response.Redirect("inicio.aspx")
        End If
    End Sub
End Class
