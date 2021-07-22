<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ModificarCliente.aspx.cs" Inherits="CALL_CENTER._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="titulo">
        <h3>Modificar Cliente</h3>
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
            <div>
                <asp:Button Text="Guardar" CssClass="btn btn-primary" ID="btnGuardarCliente" CommandArgument='47' OnClick="btnGuardarCliente_Click" runat="server" />
                <asp:Button Text="Cancelar" CssClass="btn btn-primary" ID="Button7" CommandArgument='47' OnClick="btnCancelarModificar" runat="server" />
            </div>
        </div>
        <div class="col"></div>
    </div>

</asp:Content>
