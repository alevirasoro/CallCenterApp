<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Incidentes.aspx.cs" Inherits="CALL_CENTER.Incidentes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="titulo" >
        <h3>Listado de Incidentes</h3>
        <p>se listan todos los incidentes en una grilla aca</p>
    </div>


    <table>
        <thead>
            <tr>
              <th data-sort="desc">Fecha</th>
              <th>Numero</th>
              <th>Cliente</th>
              <th>Mensaje</th>
              <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <% foreach (dominio.Incidente item in lista)
                {%>
            <tr>
                <td><%: DateTime.Now %></td>
                <td><%=item.ID %></td>
                <td><%=item.Cliente %></td>
            </tr>
            <% } %>
            </tbody>

        </table>
</asp:Content>
