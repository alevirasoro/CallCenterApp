<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ModificarIncidente.aspx.cs" Inherits="CALL_CENTER.ModificarIncidente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <script>
        function validarComentario ()  {
            var comentario = document.getElementById("<% =txtComentarioCierre.ClientID %>").value;
            if(comentario === "") {
                $("#<% =txtComentarioCierre.ClientID %>").removeClass("is-valid");
                $("#<% =txtComentarioCierre.ClientID %>").addClass("is-invalid");
                        valido = false;
                    }
                    else {
                        $("#<% =txtComentarioCierre.ClientID %>").removeClass("is-invalid");
                        $("#<% =txtComentarioCierre.ClientID %>").addClass("is-valid");
                        return true;
            }
            return false;
        }
    </script>


    <%if (Session["AccionIncidente"] != null && (string)Session["AccionIncidente"] == "reasignar"){%>
        <div class="titulo">
        <h3>Reasignar Incidente</h3>

            <div class="row">
        <div class="col-2"></div>
        <div class="col">
            <div class="mb-3">
                <label for="usu" class="col-form-label">Usuario:</label>
                 <asp:DropDownList runat="server" ID="ddlEmpleados" CssClass="btn btn-outline-dark dropdown-toggle"></asp:DropDownList>
            </div>
            <div>
                <asp:Button Text="Guardar" CssClass="btn btn-primary" ID="btnGuardarIncidente" CommandArgument='47' OnClick="btnGuardarIncMod" runat="server" />
                <asp:Button Text="Cancelar" CssClass="btn btn-primary" ID="btnCancelar" CommandArgument='47' OnClick="btnCancelarModificarInc" runat="server" />
            </div>
        </div>
        </div>
    </div>
    <% } %>

    <%if (Session["AccionIncidente"] != null && (string)Session["AccionIncidente"] == "resolver"){%>
        <div class="titulo">
        <h3>Resolver Incidente</h3>
            <div class="mb-3">
                <label class="form-label">Comentarios Adicionales</label>
                <asp:TextBox runat="server" ID="txtComentarios" CssClass="form-control" />
            </div>
            <asp:Button Text="Guardar" CssClass="btn btn-primary" ID="btnGuardarResuelto" CommandArgument='47' OnClick="btnGuardarIncRes" runat="server" />
           <asp:Button Text="Cancelar" CssClass="btn btn-primary" ID="btnCancelarRes" CommandArgument='47' OnClick="btnCancelarModificarInc" runat="server" />
    </div>
    <% } %>

    <%if (Session["AccionIncidente"] != null && (string)Session["AccionIncidente"] == "cerrar"){%>
        <div class="titulo">
        <h3>Cerrar Incidente</h3>
            <div class="mb-3">
                <label class="form-label">Proporcione un Comentario de Cierre</label>
                <p>(obligatorio)</p>
                <asp:TextBox runat="server" ID="txtComentarioCierre" CssClass="form-control" />
            </div>
            <asp:Button Text="Guardar" CssClass="btn btn-primary" ID="btnGuardarCerrado" CommandArgument='47' OnClientClick="return validarComentario()" OnClick="btnGuardarIncCerrado" runat="server" />
           <asp:Button Text="Cancelar" CssClass="btn btn-primary" ID="btnCancelarCierre" CommandArgument='47' OnClick="btnCancelarModificarInc" runat="server" />

    </div>
    <% } %>
        <%if (Session["AccionIncidente"] != null && (string)Session["AccionIncidente"] == "editar"){%>
        <div class="titulo">
        <h3>Editar Incidente</h3>
            <div class="mb-3">
                <label for="numero" class="col-form-label">Numero:</label>
                <asp:TextBox runat="server" ID="txtNumero" ReadOnly="true" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="asunto" class="col-form-label">Asunto:</label>
                <asp:TextBox runat="server" TextMode="MultiLine" Width="300px" Height="100px" ID="txtAsunto" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <label for="prioridades" class="col-form-label">Prioridad:</label>
                 <asp:DropDownList runat="server" ID="ddlPrioridades" CssClass="btn btn-outline-dark dropdown-toggle"></asp:DropDownList>
            </div>
           <label for="tipos" class="col-form-label">Tipo:</label>
                 <asp:DropDownList runat="server" ID="ddlTipos" CssClass="btn btn-outline-dark dropdown-toggle"></asp:DropDownList>
            </div>
            <asp:Button Text="Guardar" CssClass="btn btn-primary" ID="btnGuardarEdicion" CommandArgument='47' OnClick="btnGuardarIncResClick" runat="server" />
           <asp:Button Text="Cancelar" CssClass="btn btn-primary" ID="btnCancelarEdicion" CommandArgument='47' OnClick="btnCancelarModificarInc" runat="server" />
    </div>
    <% } %>

</asp:Content>
