<%@ Page Language="VB" AutoEventWireup="false" CodeFile="login.aspx.vb" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="miForm" runat="server">
    <div>
    
    </div>
        <asp:Login ID="oLogin" runat="server" DisplayRememberMe="false" TitleText="usuario registrados" UserNameLabelText="" PasswordLabelText=""  LoginButtonText="Empezar Pedido">
        </asp:Login>
    </form>
</body>
</html>
