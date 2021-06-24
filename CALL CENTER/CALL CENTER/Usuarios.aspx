<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="CALL_CENTER.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Nombre del usuario</h1>
    <h3>Tipo de usuario</h3>
    <h3>Información de registro</h3>
    <h3>Cambiar contraseña</h3>
    Si tiene permisos muestra todos los usurios sino solo el suyo
    <div class="container">
        <div class="row">
            <div class="col-sm border border-primary">
                Usuario
            </div>
            <div class="col-sm border border-primary">
                Permisos
            </div>
            <div class="col-sm border border-primary">
                Acciones
            </div>
        </div>
    </div> 
    <div class="container">
        <div class="row" >
            <div class="col-sm border border-primary">
                Joaquin Achaval 
            </div>
            <div class="col-sm border border-primary">
                Aministrativo
            </div>
            <div class="col-sm border border-primary">
                Acciones (MODIFICAR, ELIMINAR, ETC)
            </div>
        </div>
    </div>
</asp:Content>
