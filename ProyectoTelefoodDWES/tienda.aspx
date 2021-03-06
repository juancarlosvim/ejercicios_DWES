﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="tienda.aspx.vb" Inherits="tienda" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" href="public/font-awesome-4.7.0/css/font-awesome.css"/>
<link rel="stylesheet" href="public/css/tienda.css">
    <title>PizzaNo | Tienda </title>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <div class="logo">
                <img src="public/img/logo.png" alt="">
                 <div class="nombreRestaurante"><h1>PizzaNo</h1>
                  <p><asp:Label ID="lblTienda" runat="server"/></p></div>
                
            </div>
            
            <input type="checkbox" id="checkMenu">
            <label for="checkMenu" class="fa fa-bars fa-3x icono" id="menuMovil" ></label>
            
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
               
                   

                   
                        <asp:ListView ID="lvProductos" runat="server" DataKeyNames="idProducto" DataSourceID="sqlDsProductos">
                                
                                <EmptyDataTemplate>
                                    <div class="sinProductos">
                                            <span>No hay productos de esta categoría.</span>
                                    </div>
                                    
                                </EmptyDataTemplate>
                            
                                <ItemTemplate>
                                    
                                     <div class="producto">
                                    <p><asp:ImageButton ID="imgButton" runat="server" ImageUrl='<%# Eval("imagen", "~/public/img/{0}") %>'/></p>
                                     <p>Producto:<asp:Label ID="productoLabel" runat="server" Text='<%# Eval("producto") %>' /></p>     
                                          <p>Precio:  <asp:Label ID="precioLabel" runat="server" Text='<%# Eval("precio") %>' /> €</p>
                                   <p><asp:TextBox ID="txbCantidad" runat="server" Type="number" min="1" value="1"/></p>
                                    <p><asp:Button ID="btnPedir" runat="server" Text="Pedir" CommandName="Select" /></p>
                                    
                                     </div>     
                                   
                                </ItemTemplate>
                              
                               
                            
                               
                            </asp:ListView>
                            
                            <asp:SqlDataSource ID="sqlDsProductos" runat="server" ConnectionString="<%$ ConnectionStrings:TelefoodConnectionString %>" SelectCommand="SELECT * FROM [Productos] WHERE ([idCat] = @idCat)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="lvCategorias" Name="idCat" PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
              
                
            </section>
            <aside>
                    <h3><i class="fa fa-shopping-cart" aria-hidden="true"></i>Tu pedido:</h3>
                       
                       
               
               
                <div class="carrito">
                        
                        <asp:GridView ID="gvCompra" runat="server" AutoGenerateColumns="false" DataKey="idProducto" ShowHeaderWhenEmpty="True" Visible="true" ShowHeader="true">

                            </asp:GridView>
                </div>
                   
            </aside>
        </main>
        <footer>
                <div class="derechos">
                        <p>&copy; PizzaNo</p>
                </div>
                <div class="social">
                    <a target="_blank" href="#" title="facebook"><i class="fa fa-facebook-official fa-3x" aria-hidden="true"></i></a>
                    <a target="_blank" href="#" title="twitter"><i class="fa fa-twitter fa-3x" aria-hidden="true"></i></a>
                    <a target="_blank" href="#" title="instagram"><i class="fa fa-instagram fa-3x" aria-hidden="true"></i></a>
                
                </div>
                
        </footer>
       


       
        
    </form>
</body>
</html>
