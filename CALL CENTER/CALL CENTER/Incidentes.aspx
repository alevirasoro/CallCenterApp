<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Incidentes.aspx.cs" Inherits="CALL_CENTER.Incidentes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="titulo">
        <h3>Listado de Incidentes</h3>
    </div>

    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#modalNuevoIncidente" data-whatever="@mdo">Nuevo Incidente</button>
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

    <!-- MODAL DE NUEVO INCIDENTE -->

    <div class="modal fade" id="modalNuevoIncidente" tabindex="1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Nuevo Incidente</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <%--<form>--%>
                    <div class="form-group">
                        <label for="usu-name" class="col-form-label">Telefono Cliente:</label>
                        <!--<input type="text" class="form-control" id="clienteName"/>-->
                        <asp:TextBox ID="telCliente" class="form-control" type="text" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="usu-ape" class="col-form-label">Asunto:</label>
                        <!-- <input type="text" class="form-control" id="clientApe"/>-->
                        <asp:TextBox ID="asunto" class="form-control" TextMode="MultiLine" Width="300px" Height="100px" runat="server"></asp:TextBox>
                    </div>
                    <asp:DropDownList runat="server" ID="ddlTipo" CssClass="btn btn-outline-dark dropdown-toggle"></asp:DropDownList>
                    <div class="form-group">
                        <asp:DropDownList runat="server" ID="ddlPrioridad" CssClass="btn btn-outline-dark dropdown-toggle"></asp:DropDownList>
                        <asp:DropDownList runat="server" ID="ddlEstado" CssClass="btn btn-outline-dark dropdown-toggle"></asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <!--LOS USUARIOS DEBERIAN ESTAR BLOQUEADOS PARA EL USUARIO COMUN-->
                        <asp:DropDownList runat="server" ID="ddlUsuarios" CssClass="btn btn-outline-dark dropdown-toggle"></asp:DropDownList>
                    </div>
                <div class="modal-footer">
                    <!--<button type="button" class="btn btn-primary" onclick="guardarCliente" runat="server">Guardar</button>-->
                    <asp:Button Text="Guardar" CssClass="btn btn-primary" ID="btnGuardar" OnClick="guardarIncidente" runat="server" />
                </div>
            </div>
        </div>
    </div>


</asp:Content>
