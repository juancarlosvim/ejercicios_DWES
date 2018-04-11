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
        <asp:ListView ID="lvPalabras" runat="server">
            <%--<asp:Button runat="server" Text="<%# Container.DataItem.ToString %>"/>--%>
        </asp:ListView>
        <asp:ListView ID="lvPalabrasAbajo" runat="server">

        </asp:ListView>
    </div>
    </form>
</body>
</html>
