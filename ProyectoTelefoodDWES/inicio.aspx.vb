
Partial Class inicio
    Inherits System.Web.UI.Page

    Private Sub inicio_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsPostBack Then
            ' recogemos los datos del textbox
            Dim datosTextBox As String = txbCodigoPostal.Text
            ' nos quedamos con los primeros digitos para la consulta '23'
            Dim busca As String = datosTextBox(0) & datosTextBox(1)

            sqlDsTiendas.SelectParameters.Item("cPostal2").DefaultValue = busca
            ' antes de ejecutar el dataBind hay que declarar el parametro

            sqlDsTiendas.DataBind()
        End If
    End Sub


    Protected Sub obtenerRbSeleccionado(sender As Object, e As EventArgs)
        ' 
        Dim rbTienda = CType(sender, RadioButton)

        Dim idTienda = rbTienda.Attributes("value") ' idTienda de la tienda seleccionada
        Dim datosTienda = rbTienda.Text ' los datos que tiene la tienda
        'MsgBox("La clave del radioButon: " & idTienda)
        'Response.Write("La clave del radioButon: " & idTienda)
        'Response.Write("El texto del radioButon: " & datosTienda)
        Session("tienda") = idTienda
        Session("datosTienda") = datosTienda
        Session("pedido") = New Dictionary(Of Integer, DetallePedido)
        Response.Redirect("tienda.aspx")
    End Sub
End Class
