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
        <asp:ListView ID="lvEtiquetasOriginales" runat="server">
            <ItemTemplate>
                <span style="">
                    <%-- añadimos el commandname d --%>
                <asp:Button ID="btnDato" runat="server" Text='<%# Container.DataItem.ToString %>' CommandName="elegir" CommandArgument='<%# Container.DataItem.ToString %>' />

                </span>
            </ItemTemplate>
            <LayoutTemplate>
                <div id="itemPlaceholderContainer" runat="server" style="">
                    <span runat="server" id="itemPlaceholder" />
                </div>
                <div style="">
                </div>
            </LayoutTemplate>
            
        </asp:ListView>
        
        <br />
        <asp:ListView ID="lvEtiquetasSeleccionadas" runat="server">
              <ItemTemplate>
                <span style="">
                    <%-- añadimos el commandname d --%>
                <asp:Button ID="btnDato" runat="server" Text='<%# Container.DataItem.ToString %>' CommandName="elegir" CommandArgument='<%# Container.DataItem.ToString %>' />

                </span>
            </ItemTemplate>
            <LayoutTemplate>
                <div id="itemPlaceholderContainer" runat="server" style="">
                    <span runat="server" id="itemPlaceholder" />
                </div>
                <div style="">
                </div>
            </LayoutTemplate>
        </asp:ListView>
        <asp:Button ID="btnConsultar" runat="server" Text="Consultar" />
    </form>
</body>
</html>
