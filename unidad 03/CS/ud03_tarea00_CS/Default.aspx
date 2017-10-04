<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="lblFrase" runat="server" Text="Introduce la frase"></asp:Label>
        <asp:TextBox ID="txbFrase" runat="server" style="margin-left: 18px"></asp:TextBox>
        <asp:Label ID="lblLetra" runat="server" Text="Letra"></asp:Label>
        <asp:TextBox ID="txbLetra" runat="server" MaxLength="1" style="margin-left: 17px" ToolTip="Introduce una letra max1"></asp:TextBox>
        <asp:Button ID="btnCalcular" runat="server" OnClick="btnCalcular_Click" Text="Calcular" />
    
    </div>
        <asp:Label ID="lblResultado" runat="server" Text="Label"></asp:Label>
    </form>
</body>
</html>
