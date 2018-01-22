
Partial Class Tienda
    Inherits System.Web.UI.Page

    Private d As DetallePedido

    Private Sub Tienda_Load(sender As Object, e As EventArgs) Handles Me.Load
        lvCategorias.SelectedIndex = 0 ' Para que cargue con el indice 0 y muestre las pizzas por defecto es -1
        lblTienda.Text = Session("Tienda")
    End Sub

    Private Sub lvProductos_SelectedIndexChanged(sender As Object, e As EventArgs) Handles lvProductos.SelectedIndexChanged
        Response.Write("Estoy aqui")
        Dim indice = lvProductos.SelectedIndex 'indice del listView
        ' obtener la clave 
        Dim clave = lvProductos.SelectedDataKey.Value 'valor del idProducto
        Dim cantidad = CType(lvProductos.Items.Item(indice).FindControl("txbCantidad"), TextBox).Text
        Dim precio = CType(lvProductos.Items.Item(indice).FindControl("precioLabel"), Label).Text
        Dim nombreProducto = CType(lvProductos.Items.Item(indice).FindControl("nombreProducto"), Label).Text
        Response.Write("nombreProducto => " & nombreProducto)
        Response.Write("precio => " & precio)
        Response.Write("cantidad => " & cantidad)


        'guardamos los datos seleccionados a la estructura  
        d.idProducto = clave
        d.cantidad = cantidad
        d.pvp = precio
        d.nombre = nombreProducto

        Response.Write("idProducto => " & d.idProducto)
        Response.Write("cantidad => " & d.cantidad)
        Response.Write("Precio => " & d.pvp)
        Response.Write("nombre => " & d.nombre)

        'If Session("pedido").ContainsKey(d.idProducto) Then
        '    ' actual
        '    Dim vigente = Session("pedido")(d.idProducto)
        '    d.cantidad += vigente.cantidad
        'Else
        '    Response.Write("no esta!!!")

        'End If
        ''ahora metemos los datos al diccionario 
        'Session("pedido")(d.idProducto) = d
        'gvCompra.DataSource = Session("pedido").Values
        'gvCompra.DataBind()

    End Sub
End Class
