Imports System.Data.SqlClient
Imports System.Data

Partial Class _Default
    Inherits System.Web.UI.Page



    Private Sub fvCliente_Load(sender As Object, e As EventArgs) Handles fvCliente.Load
        fvCliente.ChangeMode(FormViewMode.Edit)
    End Sub

    Private Sub fvCliente_DataBound(sender As Object, e As EventArgs) Handles fvCliente.DataBound
        If IsPostBack Then
            If fvCliente.CurrentMode > 0 AndAlso FormViewMode.Edit Then
                Dim cliente = CType(fvCliente.DataItem, DataRowView)
                If DBNull.Value.Equals(cliente("avatar")) Then
                    CType(fvCliente.FindControl("imgAvatar"), Image).ImageUrl = "ico/person.png"
                Else
                    CType(fvCliente.FindControl("imgAvatar"), Image).ImageUrl = "data:image/jpg;base64," & Convert.ToBase64String(CType(cliente("avatar"), Byte()))
                End If
            End If
            End If
    End Sub
    Private Sub sqlDsCliente_Updating(sender As Object, e As SqlDataSourceCommandEventArgs) Handles sqlDsCliente.Updating
        Dim avatar = CType(fvCliente.FindControl("fuAvatar"), FileUpload)
        If avatar.HasFile Then
            e.Command.Parameters("@avatar").Value = avatar.FileBytes  ' cargar el parametro
        Else
            Dim s As New SqlParameter With {.SqlDbType = Data.SqlDbType.Image, .Value = DBNull.Value}
            e.Command.Parameters("@avatar").Value = s.SqlValue

        End If
    End Sub
End Class
