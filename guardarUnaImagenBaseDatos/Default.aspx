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
    
        <asp:Label ID="lblNickTelefono" runat="server" Text="Introduce un nick  o telefono"></asp:Label>
    
        <asp:TextBox ID="txbCliente" runat="server" style="margin-left: 24px"></asp:TextBox>
    
    </div>
        <asp:FormView ID="fvCliente" runat="server" DataKeyNames="telefono" DataSourceID="sqlDsCliente">
            <EditItemTemplate>
                avatar:
                <asp:Image ID="imgAvatar" runat="server" />
                Cambiar avatar:
                <asp:FileUpload ID="fuAvatar" runat="server" />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
            </EditItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="sqlDsCliente" runat="server" ConnectionString="<%$ ConnectionStrings:TelefoodConnectionString %>"  SelectCommand="SELECT [telefono], [nick], [avatar] FROM [Clientes] WHERE (([nick] = @pista) or ([telefono] = @pista))" UpdateCommand="UPDATE [Clientes] SET  [avatar] = @avatar WHERE [telefono] = @telefono or nick=@nick">
            
            <SelectParameters>
                <asp:ControlParameter ControlID="txbCliente" Name="pista" PropertyName="Text" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="nick" Type="String" />
                <asp:Parameter Name="avatar" />
                <asp:Parameter Name="telefono" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
