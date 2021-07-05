<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Incidentes.aspx.cs" Inherits="CALL_CENTER.Incidentes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="titulo">
        <h3>Listado de Incidentes</h3>
        <p>se listan todos los incidentes en una grilla aca</p>
    </div>

    <button type="button" class="btn btn-primary">Nuevo Indicente</button>
    
    <div class="container">
        <div class="row">
            <div class="col-sm border border-primary">
                Fecha
            </div>
            <div class="col-sm border border-primary">
                Número
            </div>
            <div class="col-sm border border-primary">
                Cliente
            </div>
            <div class="col-sm border border-primary">
                Asunto
            </div>
            <div class="col-sm border border-primary">
                Estado
            </div>
            <div class="col-sm border border-primary">
                Acciones
            </div>
        </div>
    </div>
    <div class="container">
        <% foreach (dominio.Incidente item in lista)
            {%>
        <div class="row">
            <div class="col-sm border border-primary">
                <%= item.Fecha.ToString("dd/MM/yyyy") %>
            </div>
            <div class="col-sm border border-primary">
                <%=item.Numero %>
            </div>
            <div class="col-sm border border-primary">
                <%=item.Cliente %>
            </div>
            <div class="col-sm border border-primary">
                Asunto descripcion
            </div>
            <div class="col-sm border border-primary">
                Estado
            </div>
            <div class="col-sm border border-primary">
                <div class="dropdown">
                    <button class="dropbtn">Acciones</button>
                    <div class="dropdown-content">
                        <a href="#">Modificar</a>
                        <a href="#">Eliminar</a>
                        <a href="#">Ver Detalle</a>
                    </div>
                </div>

            </div>
        </div>

        <% } %>
    </div>


</asp:Content>
