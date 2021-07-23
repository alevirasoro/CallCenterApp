<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CALL_CENTER.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="estilos.css" rel="stylesheet" type="text/css"/>
    <title>Bienvenido!</title>

</head>
<body>
                <h2 class="logo">CALL CENTER</h2>
         <img src="images/fondologin.jpg" class="fondo" /> 
        <form id="form1" runat="server">
        <!--PENSAR UN NOMBRE CANCHERO / PODRIA SER UNA IMAGEN CON UN LOGO TAMBIEN-->

        <div class="formContainer">
                <h3 class="formTitle">Ingresa a tu cuenta</h3>
            <div>
                <asp:TextBox ID="txtUsu" class="input" type="text" runat="server" placeholder="Usuario"></asp:TextBox>
            </div>
            <div>
                <asp:TextBox ID="txtPass" class="input" type="text" runat="server" placeholder="********" TextMode="Password"></asp:TextBox>
            </div>

                <asp:Button Text="Ingresar" CssClass="btnEnviar" ID="btnLogin" OnClick="btnLoginClick" runat="server" />
        </div>
        </form>
</body>
</html>
