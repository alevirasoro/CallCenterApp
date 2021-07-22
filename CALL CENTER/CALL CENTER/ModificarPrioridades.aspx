<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ModificarPrioridades.aspx.cs" Inherits="CALL_CENTER.ModificarPrioridades" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="titulo">
        <h3>Modificar Prioridades</h3>
    </div>
    <script>
                function validar() {
                    var nombre = document.getElementById("<% =txtPrioridad2.ClientID %>").value;

                    var valido = true;

                    if (nombre === "") {
                        $("#<% =txtPrioridad2.ClientID %>").removeClass("is-valid");
                        $("#<% =txtPrioridad2.ClientID %>").addClass("is-invalid");
                        valido = false;
                    }
                    else {
                        $("#<% =txtPrioridad2.ClientID %>").removeClass("is-invalid");
                        $("#<% =txtPrioridad2.ClientID %>").addClass("is-valid");
                    }    
                    return valido;
                }         
    </script>
    <div class="row">
        <div class="col-2"></div>
        <div class="col">
            <div class="mb-3">
                <label class="form-label">Prioridad Incidente</label>
                <asp:TextBox runat="server" ID="txtPrioridad2" CssClass="form-control" />
            </div>
            <div>
                <asp:Button Text="Guardar" CssClass="btn btn-primary" ID="btnGuardarPrioridad" CommandArgument='47' OnClientClick="return validar()" OnClick="btnGuardarModificarPrioridad_Click" runat="server" />
                <asp:Button Text="Cancelar" CssClass="btn btn-primary" ID="Button10" CommandArgument='47' OnClick="btnCancelarModificarPrioridad" runat="server" />
            </div>
        </div>
        <div class="col"></div>
    </div>
</asp:Content>
