<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

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
        <asp:Label ID="lblNombre" runat="server" Text="Nombre"></asp:Label>
        <asp:TextBox ID="txbNombre" runat="server" style="margin-left: 31px"></asp:TextBox>
        <br />
         <asp:Label ID="lblLogin" runat="server" Text="Login"></asp:Label>
        <asp:TextBox ID="txbLogin" runat="server" style="margin-left: 31px"></asp:TextBox>
         <br />
         <asp:Label ID="lblPassword" runat="server" Text="Contraseña"></asp:Label>
        <asp:TextBox ID="txbPassword" runat="server" style="margin-left: 31px" TextMode="Password"></asp:TextBox>
         <br />
        <asp:Label ID="lblCorreo" runat="server" Text="Correo"></asp:Label>
        <asp:TextBox ID="txbCorreo" runat="server" style="margin-left: 31px"></asp:TextBox>
         <br />
        <asp:Label ID="lblNacionalidad" runat="server" Text="Nacionalidad"></asp:Label>
        <asp:TextBox ID="txbNacionalidad" runat="server" style="margin-left: 31px"></asp:TextBox>
         <br />
        <asp:Button ID="btnRegistrar" runat="server" Text="Registrar"/>

    </form>
</body>
</html>
