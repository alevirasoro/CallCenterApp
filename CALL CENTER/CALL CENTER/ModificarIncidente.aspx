<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ModificarIncidente.aspx.cs" Inherits="CALL_CENTER.ModificarIncidente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

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
                <asp:Button Text="Cancelar" CssClass="btn btn-primary" ID="Button10" CommandArgument='47' OnClick="btnCancelarModificarInc" runat="server" />
            </div>
        </div>
        </div>
    </div>
    <% } %>

    <%if (Session["AccionIncidente"] != null && (string)Session["AccionIncidente"] == "resolver"){%>
        <div class="titulo">
        <h3>Resolver Incidente</h3>
    </div>
    <% } %>

    <%if (Session["AccionIncidente"] != null && (string)Session["AccionIncidente"] == "cerrar"){%>
        <div class="titulo">
        <h3>Cerrar Incidente</h3>
    </div>
    <% } %>


</asp:Content>
