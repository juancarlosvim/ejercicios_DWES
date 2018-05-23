Imports System.Data
Imports Microsoft.Reporting.WebForms


Partial Class inicio
    Inherits System.Web.UI.Page
    Dim avisos As Warning() = Nothing
    Dim streamids As String() = Nothing
    Dim mimeType As String = Nothing
    Dim encoding As String = Nothing
    Dim extension As String = Nothing
    Dim bytes As Byte()
    Dim deviceInfo As String = "<DeviceInfo>" &
    " <OutputFormat>PDF</OutputFormat>" &
    " <PageWidth>8.5in</PageWidth>" &
    " <PageHeight>11in</PageHeight>" &
    " <MarginTop>0.5in</MarginTop>" &
    " <MarginLeft>0.4in</MarginLeft>" &
    " <MarginRight>0.4in</MarginRight>" &
    " <MarginBottom>0.5in</MarginBottom>" &
    "<SimplePageHeaders>True</SimplePageHeaders>" &
    "</DeviceInfo>"

    Private Sub gvArticulos_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gvArticulos.SelectedIndexChanged
        ' tengo la id del articulo que he pulsado cuando le doy a imprimir
        'Dim idArticulo = gvArticulos.SelectedValue
        ' cremos el objeto localRepor para poder descargar directamente el informe
        Dim informe As New LocalReport()
        ' le añadimos donde se situa el informe
        informe.ReportPath = "informeArticulo.rdlc"

        ' le indicamos el nombre con que va a cargar los datos
        Dim origenDatos As New ReportDataSource("datosInforme", sqlDsInforme)
        informe.DataSources.Add(origenDatos)

        bytes = informe.Render("PDF", deviceInfo, mimeType, encoding, extension, streamids, avisos)

        Response.ContentType = mimeType
        Response.AddHeader("content-disposition", "attachment; filename=articulo" + "." + extension)

        Response.BinaryWrite(bytes)
        Response.End()


    End Sub
End Class
