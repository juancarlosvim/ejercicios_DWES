<%@ Page Language="VB" AutoEventWireup="false" CodeFile="inicio.aspx.vb" Inherits="inicio" %>

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
        <asp:Label ID="lblCodigoPostal" runat="server" Text="Código Postal:"></asp:Label>
        <asp:TextBox ID="txbCodigoPostal" runat="server" style="margin-left: 35px"></asp:TextBox>
        <asp:Button ID="btnBuscar" runat="server" style="margin-left: 29px" Text="Buscar" />
        <asp:RadioButtonList ID="rblTiendas" runat="server" AutoPostBack="True" DataSourceID="sqlDsTiendas" DataTextField="valor" DataValueField="idTienda">
        </asp:RadioButtonList>
        <asp:SqlDataSource ID="sqlDsTiendas" runat="server" ConnectionString="<%$ ConnectionStrings:TelefoodConnectionString %>" SelectCommand="SELECT [idTienda], ([domicilio]+' '+[poblacion]+' '+[provincia]+' '+[cPostal]+' '+[telefono]) as valor FROM [Tiendas] WHERE ([cPostal] = @cPostal) UNION all SELECT [idTienda], ([domicilio]+' '+[poblacion]+' '+[provincia]+' '+[cPostal]+' '+[telefono]) as valor FROM [Tiendas] WHERE ([cPostal] LIKE @cPostal2 + '%') and not ([cPostal] = @cPostal)">
            <SelectParameters>
                <asp:ControlParameter ControlID="txbCodigoPostal" Name="cPostal" PropertyName="Text" Type="String" />
                <asp:Parameter Name="cPostal2" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
