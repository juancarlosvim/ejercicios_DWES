Imports System.Data
Partial Class login
    Inherits System.Web.UI.Page

    Private Sub login_Init(sender As Object, e As EventArgs) Handles Me.Init
        CType(oLogin.FindControl("UserName"), TextBox).Attributes.Add("placeholder", "Tu nick")
        CType(oLogin.FindControl("password"), TextBox).Attributes.Add("placeholder", "Tu contraseña")
    End Sub

    Private Sub oLogin_Authenticate(sender As Object, e As AuthenticateEventArgs) Handles oLogin.Authenticate
        Session("usuario") = codigo.okUsuario(oLogin.UserName, oLogin.Password)
        If Session("usuario").rows.count = 1 Then
            e.Authenticated = True
            Response.Redirect("inicio.aspx")
        End If


    End Sub
End Class
