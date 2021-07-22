<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ModificarTipos.aspx.cs" Inherits="CALL_CENTER.ModificarTipos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="titulo">
        <h3>Modificar Tipos</h3>
    </div>



    <script>
                function validar() {
                    var nombre = document.getElementById("<% =txtTipo2.ClientID %>").value;

                    var valido = true;

                    if (nombre === "") {
                        $("#<% =txtTipo2.ClientID %>").removeClass("is-valid");
                        $("#<% =txtTipo2.ClientID %>").addClass("is-invalid");
                        valido = false;
                    }
                    else {
                        $("#<% =txtTipo2.ClientID %>").removeClass("is-invalid");
                        $("#<% =txtTipo2.ClientID %>").addClass("is-valid");
                    }    
                    return valido;
                }         
    </script>

    <div class="row">
        <div class="col-2"></div>
        <div class="col">
            <div class="mb-3">
                <label class="form-label">Tipo Incidente</label>
                <asp:TextBox runat="server" ID="txtTipo2" CssClass="form-control" />
            </div>
            <div>
                <asp:Button Text="Guardar" CssClass="btn btn-primary" ID="btnGuardarTipo" OnClientClick="return validar()" CommandArgument='47' OnClick="btnGuardarModificarTipo_Click" runat="server" />
                <asp:Button Text="Cancelar" CssClass="btn btn-primary" ID="Button10" CommandArgument='47' OnClick="btnCancelarModificarTipo" runat="server" />
            </div>
        </div>
        <div class="col"></div>
    </div>
</asp:Content>
