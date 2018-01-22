<%@ Page Language="VB" AutoEventWireup="false" CodeFile="tienda.aspx.vb" Inherits="Tienda" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" href="/public/css/estilo.css">
    <title></title>
</head>
<body>
        <form id="form1" runat="server">
    <header>
            <div class="logo">
                <img src="public/img/logo.png" alt="">
                <asp:Label ID="lblTienda" runat="server"></asp:Label>
                
            </div>

            <div class="categorias">
                <asp:ListView runat="server" ID="lvCategorias" DataSourceID="sqlDsCategorias" DataKeyNames="idCat">
                    <ItemTemplate>
                            <asp:Button ID="categoriaLabel" runat="server" Text='<%# Eval("categoria") %>' CommandName="Select" />
                        </ItemTemplate>
                </asp:ListView>  
                <%--<asp:DataList ID="dlCategorias" runat="server" DataSourceID="sqlDsCategorias" RepeatDirection="Horizontal" DataKeyField="idCat" Height="34px" style="margin-top: 16px" >
                        <ItemTemplate>
                            <asp:Button ID="categoriaLabel" runat="server" Text='<%# Eval("categoria") %>' CommandName="Select" />
                        </ItemTemplate>
                    </asp:DataList>--%>
                    
                </div>
        <asp:SqlDataSource ID="sqlDsCategorias" runat="server" ConnectionString="<%$ ConnectionStrings:TelefoodConnectionString %>" SelectCommand="SELECT * FROM [Categorías]"></asp:SqlDataSource>
            
    </header>
   <main>

   
    
        <section>
            <asp:ListView ID="lvProductos" runat="server" DataKeyNames="idProducto" DataSourceID="sqlDsProductos">
                <EmptyDataTemplate>
                    <h3>No hay productos en esta categoría</h3>
                </EmptyDataTemplate>
                <EmptyItemTemplate>
    <td runat="server" />
                </EmptyItemTemplate>
               
                <ItemTemplate>
                        nombre:
                         <asp:Label ID="nombreProducto" runat="server" Text='<%# Eval("producto") %>' />
                        precio:
                        <asp:Label ID="precioLabel" runat="server" Text='<%# Eval("precio") %>' />
                        <asp:TextBox ID="txbCantidad" runat="server" Type="number" min="1" value="1"/>
                        <asp:Button ID="btnPedir" runat="server" Text="Pedir" CommandName="Select" />
                        <asp:ImageButton ID="imgButton" runat="server" ImageUrl='<%# Eval("imagen", "~/public/img/{0}") %>'/>
                       
                </ItemTemplate>
                
            </asp:ListView>
            <asp:Button ID="Button1" runat="server" Text="Button" />
            <asp:GridView ID="gvCompra" runat="server" >

            </asp:GridView>
            <asp:SqlDataSource ID="sqlDsProductos" runat="server" ConnectionString="<%$ ConnectionStrings:TelefoodConnectionString %>" SelectCommand="SELECT * FROM [Productos] WHERE ([idCat] = @idCat)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lvCategorias" Name="idCat" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </section>        

    </main>
        <footer>

        </footer>
    </form>
</body>
</html>
