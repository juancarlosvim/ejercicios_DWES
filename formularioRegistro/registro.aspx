<%@ Page Language="VB" AutoEventWireup="false" CodeFile="registro.aspx.vb" Inherits="registro" %>

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
        <asp:FormView ID="fvRegistro" runat="server" DataKeyNames="idAutor" DataSourceID="sqlDsRegistro">
            <InsertItemTemplate>
                <br />
                nombre:
                <asp:TextBox ID="nombreTextBox" runat="server" Text='<%# Bind("nombre") %>' />
                <br />
                login:
                <asp:TextBox ID="loginTextBox" runat="server" Text='<%# Bind("login") %>' />
                <br />
                password:
                <asp:TextBox ID="passwordTextBox" runat="server" Text='<%# Bind("password") %>' TextMode="Password" />
                <br />
                correo:
                <asp:TextBox ID="correoTextBox" runat="server" Text='<%# Bind("correo") %>' />
                <br />
                nacionalidad:
                <asp:TextBox ID="nacionalidadTextBox" runat="server" Text='<%# Bind("nacionalidad") %>' />
                <br />
               
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                <%-- Controles de validación --%>
                <asp:RegularExpressionValidator ID="revNombre" runat="server" ErrorMessage="error en el nombre" ValidationExpression="\w+([A-ZÁÉÍÓÚ]{1}[a-zñáéíóú]+[\s]\w+)*" ControlToValidate="nombreTextBox"></asp:RegularExpressionValidator>
                <asp:RegularExpressionValidator ID="revCorreo" runat="server" ErrorMessage="RegularExpressionValidator" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="correoTextBox"></asp:RegularExpressionValidator>
<%--                <asp:RegularExpressionValidator ID="revPassword" runat="server" ErrorMessage="Error al escribir la contraseña" ValidationExpression="/w+([a-zA-Z0-9]{8,20}\w+)*" ControlToValidate="passwordTextBox"></asp:RegularExpressionValidator>--%>
                <asp:RequiredFieldValidator ID="rqvNombre" runat="server" ErrorMessage="Campo Requerido" ControlToValidate="nombreTextBox"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="rqvCorreo" runat="server" ErrorMessage="Campo Requerido" ControlToValidate="correoTextBox"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="rqvPassword" runat="server" ErrorMessage="Campo Requerido" ControlToValidate="passwordTextBox"></asp:RequiredFieldValidator>
            </InsertItemTemplate>
           
        </asp:FormView>
        <asp:SqlDataSource ID="sqlDsRegistro" runat="server" ConnectionString="<%$ ConnectionStrings:publicacionesConnectionString %>" InsertCommand="registroAutor_sp" InsertCommandType="StoredProcedure" SelectCommand="SELECT * FROM autores">
            <InsertParameters>
                <asp:Parameter Name="nombre" Type="String" />
                <asp:Parameter Name="login" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="correo" Type="String" />
                <asp:Parameter Name="nacionalidad" Type="String" />
                <%-- devuelve el idAutor cuando realizamos en el insert --%>
                <asp:Parameter Name="idAutor" Type="Int32" Direction="ReturnValue" />
            </InsertParameters>
        </asp:SqlDataSource>
       

    </form>
</body>
</html>
