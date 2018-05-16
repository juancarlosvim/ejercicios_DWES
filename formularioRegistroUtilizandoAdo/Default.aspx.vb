Imports System.Data
Imports System.Data.Entity
Partial Class _Default
    Inherits System.Web.UI.Page

    Private Sub btnRegistrar_Click(sender As Object, e As EventArgs) Handles btnRegistrar.Click
        'RECOGEMOS LOS DATOS DEL FORMULARIO
        Dim nombreTex = txbNombre.Text
        Dim loginTex = txbLogin.Text
        Dim passwordTex = txbPassword.Text
        Dim correoTex = txbCorreo.Text
        Dim nacionalidadTex = txbNacionalidad.Text

        Using ctx As New publicacionesEntities1
            Try
                ' realizando inserción
                Dim a As New autores
                a.nombre = nombreTex
                a.login = loginTex
                a.password = passwordTex
                a.correo = correoTex
                a.nacionalidad = nacionalidadTex
                'Dim autores As New autores With {.nombre = nombreTex, .login = loginTex, .password = passowrdTex, .correo = correoTex, .nacionalidad = nacionalidadTex}

                ' añadido
                ctx.Entry(a).State = EntityState.Added
                ctx.SaveChanges()
                Response.Write("OK")


            Catch ex As Exception
                Response.Write(ex.InnerException)
            End Try
        End Using
    End Sub
End Class
