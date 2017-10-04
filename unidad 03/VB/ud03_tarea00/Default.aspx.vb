
Partial Class _Default
    Inherits System.Web.UI.Page

    Private Sub _Default_Load(sender As Object, e As EventArgs) Handles Me.Load

        Dim frase As String = "Hola mundo"

        Response.Write(pasarFrase("Esto es una prueba"))
        Response.Write("<br/>")
        Response.Write(pasarFrase("Esto es un ejemplo", "o"))
    End Sub

    Private Function pasarFrase(ByRef frase As String, Optional ByVal vocal As Char = Nothing) As Object
        Dim encontrado As Object
        Response.Write("La frase es => " & frase)
        Response.Write("<br/>")
        Response.Write("La vocal es => " & vocal)
        Response.Write("<br/>")
        Response.Write("La [  " & vocal & " ] se repite => " & encontrado)

        If vocal = Nothing Then
            encontrado = False
            For i = 0 To frase.Length - 1

                For j = i + 1 To frase.Length - 1

                    If frase(i) = frase(j) Then
                        encontrado = True
                        GoTo salir
                    End If
                Next
            Next

            Return encontrado
        Else
            encontrado = 0

            For i = 0 To frase.Length - 1
                If vocal = frase(i) Then
                    encontrado = encontrado + 1
                End If
            Next
            Return encontrado

        End If

salir:
    End Function



End Class
