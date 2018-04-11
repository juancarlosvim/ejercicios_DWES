Imports Microsoft.VisualBasic
Imports System.Collections.Generic

Public Class MiClaseHashSet
    Private hash As HashSet(Of String)
    ' funcion para crear hashset
    Public Function crear(ByVal c As String()) As Object
        hash = New HashSet(Of String)(c)
        Return hash
    End Function
    Public Function insertarPalabra(ByVal palabara As String) As Object
        hash.Add(palabara)
    End Function

    Public Function eliminarPalabra(ByVal p As String) As Object
        hash.Remove(p)
    End Function

    Public Function cogerHashSet() As Object
        Return hash
    End Function
    ' funcion que reciebe un parametro y devuelve true o false al comprobar si la palabra esta dentro del hash
    Public Function buscarPalabra(ByVal b As String) As Boolean
        Dim encontrado = False
        For Each i In hash
            If i.Equals(b) Then
                encontrado = True
            End If
        Next

        Return encontrado

    End Function
    ' funcion que reciebe un parametro y devuelve true o false al comprobar si la palabra esta dentro del hash
    'Public Function posicionPalabra(ByVal b As String) As Integer
    '    Dim posicion As Integer
    '    For Each item As String In hash
    '        If Not item.IndexOf(b) = 0 Then
    '            posicion = Integer.Parse(posicion)
    '        End If
    '    Next

    '    Return posicion

    'End Function

End Class
