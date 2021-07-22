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
                    <th>Tipo</th>
                    <th>Prioridad</th>
                    <th>Empleado</th>
                    <th>Estado</th>
                    <th>Acciones</th>          
                </tr>
            </thead>
            <tbody>               
                <asp:Repeater runat="server" ID="repetidor">
                    <ItemTemplate>
                        <tr>
                            <td><%#Eval("Fecha")%></td> 
                            <td><%#Eval("Numero")%></td>
                            <td><%#Eval("Cliente")%></td>
                            <td><%#Eval("Asunto")%></td>
                            <td><%#Eval("Tipo")%></td>  
                            <td><%#Eval("Prioridad")%></td>  
                            <td><%#Eval("EmpleadoLegajo")%></td>  
                            <td><%#Eval("Estado")%></td> 
<%--                            <td><%#Eval("ComentarioCierre")%></td> --%>
                            <td>
                                <div class="dropdown">
                                    <button class="dropbtn">Acciones</button>
                                    <div class="dropdown-content">  
                                        <%--<asp:Button Text="Modificar2" CssClass="btn btn-danger" ID="Button5" OnClick="AgregarNroClienteSession" CommandArgument='<%#Eval("NroCliente")%>' runat="server" />
                                        <asp:Button Text="Modificar" CssClass="btn btn-primary" data-toggle="modal" data-target="#modalModificarCliente"  data-whatever="@mdo" ID="Button1" OnClientClick="return false" runat="server" />
                                        <asp:Button Text="Eliminar" CssClass="btn btn-danger" ID="btnEliminar2" OnClick="btnEliminarCliente_Click" CommandArgument='<%#Eval("NroCliente")%>' runat="server" />--%>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
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
                        <label for="usu-name" class="col-form-label">Numero Cliente:</label>
                        <!--<input type="text" class="form-control" id="clienteName"/>-->
                        <asp:TextBox ID="idCliente" class="form-control" type="text" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="usu-ape" class="col-form-label">Asunto:</label>
                        <!-- <input type="text" class="form-control" id="clientApe"/>-->
                        <asp:TextBox ID="asunto" class="form-control" TextMode="MultiLine" Width="300px" Height="100px" runat="server"></asp:TextBox>
                    </div>
                    <label for="tipo-inc" class="col-form-label">Tipo:</label>
                    <asp:DropDownList runat="server" ID="ddlTipo" CssClass="btn btn-outline-dark dropdown-toggle"></asp:DropDownList>
                    <div class="form-group">
                        <label for="prioridad-inc" class="col-form-label">Prioridad:</label>
                        <asp:DropDownList runat="server" ID="ddlPrioridad" CssClass="btn btn-outline-dark dropdown-toggle"></asp:DropDownList>
                        </div>
                    <div class="form-group">
                        <!--LOS USUARIOS DEBERIAN ESTAR BLOQUEADOS PARA EL USUARIO COMUN-->
                        <label for="usuario-inc" class="col-form-label">Usuario:</label>
                        <asp:DropDownList runat="server" ID="ddlUsuarios" CssClass="btn btn-outline-dark dropdown-toggle"></asp:DropDownList>
                    </div>
                </div>
                <div class="modal-footer">
                    <!--<button type="button" class="btn btn-primary" onclick="guardarCliente" runat="server">Guardar</button>-->
                    <asp:Button Text="Guardar" CssClass="btn btn-primary" ID="btnGuardar" OnClick="guardarIncidente" runat="server" />
                </div>
            </div>
        </div>
    </div>


</asp:Content>
