<%@ Page Language="VB" AutoEventWireup="false" CodeFile="inicio.aspx.vb" Inherits="inicio" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

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
        <asp:DropDownList ID="ddlAutores" runat="server" DataSourceID="sqlDsAutores" DataTextField="nombre" DataValueField="idAutor" AutoPostBack="True">
        </asp:DropDownList>
        <asp:SqlDataSource ID="sqlDsAutores" runat="server" ConnectionString="<%$ ConnectionStrings:publicacionesConnectionString %>" SelectCommand="SELECT [idAutor], [nombre] FROM [autores]"></asp:SqlDataSource>
        <asp:GridView ID="gvArticulos" runat="server" AutoGenerateColumns="False" DataKeyNames="idArticulo" DataSourceID="sqlDsArticulos">
            <Columns>
               
               <asp:BoundField DataField="idArticulo" HeaderText="idArticulo" ReadOnly="True" SortExpression="idArticulo" />
                <asp:BoundField DataField="fecha" HeaderText="fecha" SortExpression="fecha" />
                <asp:BoundField DataField="titulo" HeaderText="titulo" SortExpression="titulo" />
                <asp:BoundField DataField="texto" HeaderText="texto" SortExpression="texto" />
                <asp:CommandField ButtonType="Button" SelectText="Imprimir" ShowSelectButton="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="sqlDsArticulos" runat="server" ConnectionString="<%$ ConnectionStrings:publicacionesConnectionString %>" SelectCommand="SELECT [idArticulo], [fecha], [titulo], [texto] FROM [articulos] WHERE ([idAutor] = @idAutor)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlAutores" Name="idAutor" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
      
    </form>
</body>
</html>

