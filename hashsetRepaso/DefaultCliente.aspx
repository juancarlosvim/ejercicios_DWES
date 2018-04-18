<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DefaultCliente.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
</head>
<body>
    <form id="form1" runat="server">
   
        <asp:ListView ID="lvEtiquetasOriginales" runat="server">
            <ItemTemplate>
                <span style="">
               <%# Container.DataItem.ToString %>
                </span>
            </ItemTemplate>
            <LayoutTemplate>
                <div id="div" runat="server" style="width: 300px; height: 200px; border: 1px solid #000000; line-height: 30px;">
                    <span runat="server" id="itemPlaceholder" />
                </div>
                <div style="">
                </div>
            </LayoutTemplate>
        </asp:ListView>
        <br />
        <asp:ListView ID="lvEtiquetasSeleccionadas" runat="server">
            <EmptyDataTemplate>
                  <div id="div" runat="server" style="width: 300px; height: 200px; border: 1px solid #000000; line-height: 30px;">
                    <span runat="server" id="itemPlaceholder" />
                </div>
            </EmptyDataTemplate>
            <ItemTemplate>
                <span style="">
                    <%-- añadimos el commandname d --%>
                <asp:Button ID="btnDato" runat="server" Text='<%# Container.DataItem.ToString %>' CommandName="elegir" CommandArgument='<%# Container.DataItem.ToString %>' />

                </span>
            </ItemTemplate>
            <LayoutTemplate>
                <div id="itemPlaceholderContainer" runat="server" style="width: 300px; height: 200px; border: 1px solid #000000; line-height: 30px;">
                    <span runat="server" id="itemPlaceholder" />
                </div>
                <div style="">
                </div>
            </LayoutTemplate>
        </asp:ListView>
        <asp:Button ID="btnConsultar" runat="server" Text="Consultar" />
    </form>
</body>
 <script src="js/main.js"></script>
</html>
