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
         <asp:Label ID="lblGenerador" runat="server" Text="Generador de Contraseña"></asp:Label>
        <br />
        <br />
        <asp:DropDownList ID="ddlTamaño" runat="server">
            <asp:ListItem Value="6">Contraseña de 6 caracteres</asp:ListItem>
            <asp:ListItem>7</asp:ListItem>
            <asp:ListItem>8</asp:ListItem>
            <asp:ListItem>9</asp:ListItem>
            <asp:ListItem>10</asp:ListItem>
            <asp:ListItem>11</asp:ListItem>
            <asp:ListItem>12</asp:ListItem>
            <asp:ListItem>13</asp:ListItem>
            <asp:ListItem>14</asp:ListItem>
            <asp:ListItem>15</asp:ListItem>
        </asp:DropDownList>
        <p>
            <asp:Button ID="btnObtener" runat="server" Text="Obtener" OnClick="btnObtener_Click" />
        </p>
        <p>
            <asp:TextBox ID="txbValidar" runat="server" MaxLength="15"></asp:TextBox>
            <asp:Button ID="btnValidar" runat="server" Text="Validar" OnClick="btnValidar_Click" />
        </p>
        <p>
            <asp:Label ID="lblResultado" runat="server"></asp:Label>
        </p>
    </div>
    </form>
</body>
</html>
