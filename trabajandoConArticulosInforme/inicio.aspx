<%@ Page Language="VB" AutoEventWireup="false" CodeFile="inicio.aspx.vb" Inherits="inicio" %>
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
        <asp:DropDownList ID="ddlAutores" runat="server" AutoPostBack="True" DataSourceID="sqlDsAutores" DataTextField="nombre" DataValueField="idAutor">
        </asp:DropDownList>
        <asp:SqlDataSource ID="sqlDsAutores" runat="server" ConnectionString="<%$ ConnectionStrings:publicacionesConnectionString %>" SelectCommand="SELECT [idAutor], [nombre] FROM [autores]"></asp:SqlDataSource>
        <asp:GridView ID="gvArticulos" runat="server" AutoGenerateColumns="False" DataKeyNames="idArticulo" DataSourceID="sqlDsArticulos">
            <Columns>
                <asp:BoundField DataField="idArticulo" HeaderText="idArticulo" ReadOnly="True" SortExpression="idArticulo" />
                <asp:BoundField DataField="titulo" HeaderText="titulo" SortExpression="titulo" />
                <asp:BoundField DataField="texto" HeaderText="texto" SortExpression="texto" />
                <asp:BoundField DataField="fecha" HeaderText="fecha" SortExpression="fecha" />
                <asp:CommandField ButtonType="Button" SelectText="Imprimir" ShowSelectButton="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="sqlDsArticulos" runat="server" ConnectionString="<%$ ConnectionStrings:publicacionesConnectionString %>" SelectCommand="SELECT [idArticulo], [titulo], [texto], [fecha] FROM [articulos] WHERE ([idAutor] = @idAutor)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlAutores" Name="idAutor" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="sqlDsInforme" runat="server" ConnectionString="<%$ ConnectionStrings:publicacionesConnectionString %>" SelectCommand="SELECT * FROM articulos JOIN autores ON articulos.idAutor = autores.idAutor WHERE idArticulo = @idArticulo">
            <SelectParameters>
                <asp:ControlParameter ControlID="gvArticulos" Name="idArticulo" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>

    </form>
</body>
</html>
