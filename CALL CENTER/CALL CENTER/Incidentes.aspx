<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Incidentes.aspx.cs" Inherits="CALL_CENTER.Incidentes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="titulo">
        <h3>Listado de Incidentes</h3>
    </div>

    <button type="button" class="btn btn-primary">Nuevo Indicente</button>
    <button type="button" class="btn btn-primary">Resolver Indicente</button>
    <button type="button" class="btn btn-primary">Cerrar Incidente</button>

    <div class="tablausuario justify-content">
        <table id="example" class="display" style="width: 100%">
            <thead class="table-dark">
                <tr>
                    <th>Fecha</th>
                    <th>Número</th>
                    <th>Cliente</th>
                    <th>Asunto</th>
                    <th>Estado</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <% foreach (dominio.Incidente item in lista)
                    {%>
                <tr>
                    <td><%= item.Fecha.ToString("dd/MM/yyyy") %></td>
                    <td><%=item.Numero %></td>
                    <td><%=item.Cliente %></td>
                    <td>Asunto descripcion</td>
                    <td>Estado</td>
                    <td>
                        <div class="dropdown">
                            <button class="dropbtn">Acciones</button>
                            <div class="dropdown-content">
                                <a href="#">Modificar</a>
                                <a href="#">Eliminar</a>
                                <a href="#">Ver Detalle</a>
                            </div>
                        </div>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>


</asp:Content>
