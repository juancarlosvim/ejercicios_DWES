
Partial Class _Default
    Inherits System.Web.UI.Page
    ' TODO
    ' necesito que al pulser la palabra elimine desde el listView de arriba y se ponga el de abajo
    ' falta que cuando pulse dos palabras se vaya añadiendo, ahora mismo solo funciona con una palabra
    ' Fin TODO
    ' creamos un haset vacio para añadir las palabras que están seleccionadas
    Private palabrasVacias As HashSet(Of String) = New HashSet(Of String)

    Private Sub _Default_Load(sender As Object, e As EventArgs) Handles Me.Load
        ' creamos un contenido con las palabras 
        Dim claseHash = New MiClaseHashSet()
        Dim contenido As String() = {"gato", "perro", "elefante", "tigre"}
        Dim crearHas = claseHash.crear(contenido)
        claseHash.insertarPalabra("leon")
        claseHash.insertarPalabra("mono")
        claseHash.eliminarPalabra("leon")
        claseHash.insertarPalabra("serpiente")

        'lvPalabras.DataSource = claseHash.cogerHashSet

        'Response.Write(String.Join(" ", claseHash.cogerHashSet))
        'Response.Write(claseHash.buscarPalabra("leon"))
        'Response.Write(claseHash.posicionPalabra("mono"))
        ' crear boton

        'crear botones desde el hashset
        For Each i In claseHash.cogerHashSet
            Dim btnPalabra As Button = New Button()
            With btnPalabra
                .ID = i & " "
                .Text = i & " "
                .CommandName = "elegir"
                .CommandArgument = i
            End With
            Response.Write(i & " ")
            'añadir el boton
            lvPalabras.Controls.Add(btnPalabra)
        Next
        '' creamos un hashset string que tenga las palabras
        'Dim hash As HashSet(Of String) = New HashSet(Of String)(contenido)
        '' añadimos un elemento al hashset
        'hash.Add("leon")
        'hash.Add("mono")
        '' intento de eleiminar una palabra dentro del hash
        'hash.Remove("leon")
        'contenido = hash.ToArray()
        '' imprimo el array 
        'Response.Write(String.Join(" ", contenido))

    End Sub

    Private Sub lvPalabras_Init(sender As Object, e As EventArgs) Handles lvPalabras.Init

    End Sub

    Private Sub lvPalabras_ItemCommand(sender As Object, e As ListViewCommandEventArgs) Handles lvPalabras.ItemCommand
        ' Obtengo el valor cuando pulso en el botón
        Response.Write(e.CommandArgument)
        Dim palabra As String = e.CommandArgument
        palabrasVacias.Add(e.CommandArgument)
        If (palabra.Contains(e.CommandArgument)) Then

        End If

        For Each t In palabrasVacias
            Dim btnPalabrasVac As Button = New Button()
            With btnPalabrasVac
                .ID = t & " "
                .Text = t & " "
                lvPalabrasAbajo.Controls.Add(btnPalabrasVac)
            End With
            Response.Write(t)
        Next


    End Sub
End Class
