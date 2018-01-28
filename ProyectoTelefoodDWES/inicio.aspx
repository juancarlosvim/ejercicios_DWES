<%@ Page Language="VB" AutoEventWireup="false" CodeFile="inicio.aspx.vb" Inherits="inicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" href="public/font-awesome-4.7.0/css/font-awesome.css"/>
<link rel="stylesheet" href="public/css/estilo.css">
    <title>PizzaNo </title>
</head>
<body>
    <form id="form1" runat="server">
        <header>
                <div class="logo">
                    <img src="public/img/logo.png" alt="">
                </div>
        
                <div class="nombreRestaurante">
                    <h1>PizzaNo</h1>
                </div>
        </header>
        <section>
            <div class="buscarTienda">
                    <asp:Label ID="lblCodigoPostal" runat="server" Text="Introduce un código postal:"></asp:Label>
                    <asp:TextBox ID="txbCodigoPostal" runat="server"></asp:TextBox>
                    <asp:Button ID="btnBuscar" runat="server" Text="Buscar" />
                    
                    <div class="nombreTienda">
                        <asp:ListView ID="lvTiendas" runat="server" DataSourceID="sqlDsTiendas">
                            <EmptyDataTemplate>
                                <p>No se ha encontrado ninguna tienda.</p>                
                            </EmptyDataTemplate>     
                            <ItemTemplate>
                                <p>
                                    <asp:RadioButton ID="rbTiendas" runat="server" Text='<%# Eval("valor") %>' onCheckedChanged="obtenerRbSeleccionado" value='<%# Eval("idTienda") %>' AutoPostBack="True">
                               </asp:RadioButton>
                                </p>
                            </ItemTemplate>
                            
                             </asp:ListView>
                            
                    </div>
                   
                    <asp:SqlDataSource ID="sqlDsTiendas" runat="server" ConnectionString="<%$ ConnectionStrings:TelefoodConnectionString %>" SelectCommand="SELECT [idTienda], ([domicilio]+' '+[poblacion]+' '+[provincia]+' '+[cPostal]+' '+[telefono]) as valor FROM [Tiendas] WHERE ([cPostal] = @cPostal) UNION all SELECT [idTienda], ([domicilio]+' '+[poblacion]+' '+[provincia]+' '+[cPostal]+' '+[telefono]) as valor FROM [Tiendas] WHERE ([cPostal] LIKE @cPostal2 + '%') and not ([cPostal] = @cPostal)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txbCodigoPostal" Name="cPostal" PropertyName="Text" Type="String" />
                            <asp:Parameter Name="cPostal2" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
             
            </div>
        </section>
    
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
