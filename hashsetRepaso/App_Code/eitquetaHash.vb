Public Class eitquetaHash

    ' metodo compartido
    ' utiliozar sortedSet
    Public Shared Function getEtiquetas() As SortedSet(Of String)
        Dim et As New SortedSet(Of String)
        et.Add("leon")
        et.Add("mono")
        et.Add("elefante")
        et.Add("gato")
        et.Add("perro")
        Return et
    End Function
End Class
