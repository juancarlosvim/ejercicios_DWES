<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Tienda.aspx.vb" Inherits="Tienda" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        
        <asp:DataList ID="DataList1" runat="server" DataSourceID="sqlDsCategorias" RepeatDirection="Horizontal">
            <ItemTemplate>
                <asp:Button ID="categoriaButton" runat="server" Text='<%# Eval("categoria") %>' />
                <br />
                <br />
            </ItemTemplate>
        </asp:DataList>
        
    </div>
        <asp:SqlDataSource ID="sqlDsCategorias" runat="server" ConnectionString="<%$ ConnectionStrings:TelefoodConnectionString %>" SelectCommand="SELECT [categoria] FROM [Categorías]"></asp:SqlDataSource>
        <p>
            <asp:Label ID="lblTienda" runat="server"></asp:Label>
        </p>
    </form>
</body>
</html>
