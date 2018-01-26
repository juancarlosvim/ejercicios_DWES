<%@ Page Language="VB" AutoEventWireup="false" CodeFile="tienda.aspx.vb" Inherits="tienda" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" href="public/css/tienda.css">
    <title>Tienda </title>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <div class="logo">
                <img src="public/img/logo.png" alt="">
            </div>
            <div class="categorias">
                <%-- declaramos un datakeynames para que nos muestre las categorias --%>
                <asp:ListView ID="lvCategorias" runat="server" DataSourceID="sqlDsCategorias" DataKeyNames="idCat"> 
                    <ItemTemplate>
                        <asp:Button ID="categoriaLabel" runat="server" Text='<%# Eval("categoria") %>' CommandName="Select" />
                    </ItemTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="sqlDsCategorias" runat="server" ConnectionString="<%$ ConnectionStrings:TelefoodConnectionString %>" SelectCommand="SELECT * FROM [Categorías]"></asp:SqlDataSource>
            </div>
        </header>
        <main>
            <section>
                <div class="productos">
                    
                        <asp:ListView ID="lvProductos" runat="server" DataKeyNames="idProducto" DataSourceID="sqlDsProductos">
                                
                                <EmptyDataTemplate>
                                    <span>No se han devuelto datos.</span>
                                </EmptyDataTemplate>
                            
                                <ItemTemplate>
                                    
                                     <div class="producto">
                                    <p><asp:ImageButton ID="imgButton" runat="server" ImageUrl='<%# Eval("imagen", "~/public/img/{0}") %>'/></p>
                                     <p>Producto:<asp:Label ID="productoLabel" runat="server" Text='<%# Eval("producto") %>' /></p>     
                                          <p>Precio:
                                               <asp:Label ID="precioLabel" runat="server" Text='<%# Eval("precio") %>' />
                                          </p>
                                   <p><asp:TextBox ID="txbCantidad" runat="server" Type="number" min="1" value="1"/></p>
                                    <p><asp:Button ID="btnPedir" runat="server" Text="Pedir" CommandName="Select" /></p>
                                    
                                     </div>     
                                   
                                </ItemTemplate>
                              
                                <LayoutTemplate>
                                    <div id="itemPlaceholderContainer" runat="server" style="">
                                        <span runat="server" id="itemPlaceholder" />
                                    </div>
                                    <div style="">
                                    </div>
                                </LayoutTemplate>
                            
                               
                            </asp:ListView>
                            
                            <asp:SqlDataSource ID="sqlDsProductos" runat="server" ConnectionString="<%$ ConnectionStrings:TelefoodConnectionString %>" SelectCommand="SELECT * FROM [Productos] WHERE ([idCat] = @idCat)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="lvCategorias" Name="idCat" PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                </div>
                
            </section>
            <aside>
                <p>compra</p>
                <div class="carrito">
                        <asp:GridView ID="gvCompra" runat="server">
                            </asp:GridView>
                </div>
                   
            </aside>
        </main>
        <footer>
                <p>&copy; PizzaNo</p>
        </footer>
       


       
        
    </form>
</body>
</html>
