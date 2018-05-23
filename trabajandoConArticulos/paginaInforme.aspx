<%@ Page Language="VB" AutoEventWireup="false" CodeFile="paginaInforme.aspx.vb" Inherits="paginaInforme" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
         <rsweb:ReportViewer ID="rvArticulos" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">
             <LocalReport ReportPath="informeArticulo.rdlc">
                 <DataSources>
                     <rsweb:ReportDataSource DataSourceId="objetDsArticulo" Name="unArticuloParaImprimir" />
                 </DataSources>
             </LocalReport>
        </rsweb:ReportViewer>
        <asp:ObjectDataSource ID="objetDsArticulo" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DataSetArticulosTableAdapters.unArticuloTableAdapter">
            <SelectParameters>
                <asp:QueryStringParameter Name="idArticulo" QueryStringField="id" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    </form>
    
</body>
</html>
