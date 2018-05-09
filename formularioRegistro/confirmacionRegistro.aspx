<%@ Page Language="VB" AutoEventWireup="false" CodeFile="confirmacionRegistro.aspx.vb" Inherits="confirmacionRegistro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
       <h1>Confirmación Registro</h1>
    </div>
        
        <asp:SqlDataSource ID="sqlDsActivar" runat="server" ConnectionString="<%$ ConnectionStrings:publicacionesConnectionString %>"  SelectCommand="SELECT * FROM [autores] WHERE ([idAutor] = @idAutor)" UpdateCommand="UPDATE [autores] SET  [activado] = 1 WHERE [idAutor] = @idAutor">
            <SelectParameters>
                <asp:QueryStringParameter Name="idAutor" QueryStringField="id" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:QueryStringParameter Name="idAutor" QueryStringField="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        
    </form>
</body>
</html>
