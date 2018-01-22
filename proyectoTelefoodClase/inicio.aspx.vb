
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


    Protected Sub rblTiendas_SelectedIndexChanged(sender As Object, e As EventArgs) Handles rblTiendas.SelectedIndexChanged
        Session("pedido") = New Dictionary(Of Int32, DetallePedido)
        Session("tienda") = rblTiendas.SelectedValue
        Session("ubicacion") = rblTiendas.SelectedItem.ToString
        Response.Redirect("tienda.aspx")
    End Sub
    Protected Sub btnBuscar_Click(sender As Object, e As EventArgs) Handles btnBuscar.Click

    End Sub
End Class
