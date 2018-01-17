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
    
        <asp:DataList ID="dlCategorias" runat="server" DataKeyField="idCat" DataSourceID="sqlDsCategorias" RepeatDirection="Horizontal" RepeatLayout="Flow">
            <ItemTemplate>
              <asp:Button ID="btnCategoria" runat="server" Text='<%# Eval("categoria") %>' CommandName="Select" /> 
                <%-- ponemos el command name para que ejecute el select si pusieramos un delete ejecutaria el deleteCommand --%>
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="sqlDsCategorias" runat="server" ConnectionString="<%$ ConnectionStrings:TelefoodConnectionString %>" SelectCommand="SELECT [idCat], [categoria] FROM [Categorías] ORDER BY [orden]"></asp:SqlDataSource>
    
    </div>
        <asp:ListView ID="lvCarta" runat="server" DataKeyNames="idProducto" DataSourceID="sqlDsCarta">
            <ItemTemplate>
               
                <asp:Label ID="productoLabel" runat="server" Text='<%# Eval("producto") %>' />
                <br />
                precio:
                <asp:Label ID="precioLabel" runat="server" Text='<%# Eval("precio") %>' />
                <br />
                <asp:TextBox ID="tbCantidad" runat="server"/>
                <asp:Button ID="btnPedir" runat="server" Text="Pedir" CommandName="Select" /> 
                 <%--CommandArgument='<%# Eval("precio") %> se lo ponemos al boton por si queremos pasar el precio'--%>
                imagen:
                <asp:Label ID="imagenLabel" runat="server" Text='<%# Eval("imagen") %>' />
                <br />
                <br />
<br /></span>
            </ItemTemplate>
            <LayoutTemplate>
                <div id="itemPlaceholderContainer" runat="server" style="">
                    <span runat="server" id="itemPlaceholder" />
                </div>
                <div style="">
                </div>
            </LayoutTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="sqlDsCarta" runat="server" ConnectionString="<%$ ConnectionStrings:TelefoodConnectionString %>" SelectCommand="SELECT * FROM [Productos] WHERE ([idCat] = @idCat)">
            <SelectParameters>
                <asp:ControlParameter ControlID="dlCategorias" Name="idCat" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
