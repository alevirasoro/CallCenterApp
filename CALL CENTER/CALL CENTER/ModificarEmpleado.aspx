<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ModificarEmpleado.aspx.cs" Inherits="CALL_CENTER.ModificarEmpleado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="titulo">
        <h3>Modificar Empleado</h3>
    </div>
    <div class="row">
        <div class="col-2"></div>
        <div class="col">
            <div class="mb-3">
                <label class="form-label">Nombre</label>
                <asp:TextBox runat="server" ID="txtNombre2" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label class="form-label">Apellido</label>
                <asp:TextBox runat="server" ID="txtApellido2" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label class="form-label">DNI</label>
                <asp:TextBox runat="server" ID="txtDNI2" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label class="form-label">Email</label>
                <asp:TextBox runat="server" ID="txtEmail2" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label class="form-label">Teléfono</label>
                <asp:TextBox runat="server" ID="txtTelono2" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="usu-perfil" class="col-form-label">Perfil:</label>
                 <asp:DropDownList runat="server" ID="ddlPerfilUsuario" CssClass="btn btn-outline-dark dropdown-toggle"></asp:DropDownList>
            </div>
            <div>
                <asp:Button Text="Guardar" CssClass="btn btn-primary" ID="btnGuardarEmpleado" CommandArgument='47' OnClick="btnGuardarModificarEmpleado_Click" runat="server" />
                <asp:Button Text="Cancelar" CssClass="btn btn-primary" ID="Button10" CommandArgument='47' OnClick="btnCancelarModificarEmpleado" runat="server" />
            </div>
        </div>
        <div class="col"></div>
    </div>
</asp:Content>
