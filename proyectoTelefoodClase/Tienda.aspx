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
        
            <asp:Label ID="lblTienda" runat="server"></asp:Label>
        
        <asp:DataList ID="dlCategorias" runat="server" DataSourceID="sqlDsCategorias" RepeatDirection="Horizontal" DataKeyField="idCat" Height="34px" style="margin-top: 16px" >
            <ItemTemplate>
                <asp:Button ID="categoriaLabel" runat="server" Text='<%# Eval("categoria") %>' CommandName="Select" />
            </ItemTemplate>
        </asp:DataList>
        
    </div>
        <asp:SqlDataSource ID="sqlDsCategorias" runat="server" ConnectionString="<%$ ConnectionStrings:TelefoodConnectionString %>" SelectCommand="SELECT * FROM [Categorías]"></asp:SqlDataSource>
        <p>
            &nbsp;</p>
        <asp:ListView ID="lvProductos" runat="server" DataKeyNames="idProducto" DataSourceID="sqlDsProductos" GroupItemCount="3">
            
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>No se han devuelto datos.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <EmptyItemTemplate>
<td runat="server" />
            </EmptyItemTemplate>
            <GroupTemplate>
                <tr id="itemPlaceholderContainer" runat="server">
                    <td id="itemPlaceholder" runat="server"></td>
                </tr>
            </GroupTemplate>
            
            <ItemTemplate>
                <td runat="server" style="">
                   <%-- <asp:Label ID="idProductoLabel" runat="server" Text='<%# Eval("idProducto") %>' />--%>
                    <br />producto:
                    <asp:Label ID="productoLabel" runat="server" Text='<%# Eval("producto") %>' />
                    <br />precio:
                    <asp:Label ID="precioLabel" runat="server" Text='<%# Eval("precio") %>' />
                    <br />imagen:
                    <asp:TextBox ID="txbPedir" runat="server" Type="number" min="1" value="1"/>
                    <asp:Button ID="btnPedir" runat="server" Text="Pedir" />
                    <asp:ImageButton ID="imgButton" runat="server" ImageUrl='<%# Eval("imagen", "~/public/img/{0}") %>'/>
                    
                    <br />idCat:
                    <asp:Label ID="idCatLabel" runat="server" Text='<%# Eval("idCat") %>' />
                    <br /></td>
            </ItemTemplate>
            
        </asp:ListView>
        <asp:SqlDataSource ID="sqlDsProductos" runat="server" ConnectionString="<%$ ConnectionStrings:TelefoodConnectionString %>" SelectCommand="SELECT * FROM [Productos] WHERE ([idCat] = @idCat)">
            <SelectParameters>
                <asp:ControlParameter ControlID="dlCategorias" Name="idCat" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
