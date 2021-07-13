<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Clientes.aspx.cs" Inherits="CALL_CENTER.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="titulo">
        <h3>Clientes</h3>
    </div>

    <!--BOTON QUE EJECUTA MODAL-->
    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#modalCliente" data-whatever="@mdo">Agregar Cliente</button>

    <!--DISENO DE MODAL QUE VA A APARECER PARA CARGAR LOS DATOS Y DESPUES AL ACEPTAR HACE FUNCION DE AGREGAR A BD-->
    <div class="modal fade" id="modalCliente" tabindex="1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Nuevo Cliente</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <%--<form>--%>
                    <div class="form-group">
                        <label for="client-name" class="col-form-label">Nombre:</label>
                        <!--<input type="text" class="form-control" id="clienteName"/>-->
                        <asp:TextBox ID="clienteName" class="form-control" type="text" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="client-ape" class="col-form-label">Apellido:</label>
                        <!-- <input type="text" class="form-control" id="clientApe"/>-->
                        <asp:TextBox ID="clienteApe" class="form-control" type="text" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="client-mail" class="col-form-label">Mail:</label>
                        <!-- <input type="text" class="form-control" id="clientMail"/>-->
                        <asp:TextBox ID="clienteMail" class="form-control" type="text" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="client-tel" class="col-form-label">Telefono:</label>
                        <!--  <input type="text" class="form-control" id="clientTel"/>-->
                        <asp:TextBox ID="clienteTel" class="form-control" type="text" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="client-dni" class="col-form-label">DNI/CUIL/CUIT:</label>
                        <!--   <input type="text" class="form-control" id="clientDni"/>-->
                        <asp:TextBox ID="clienteDni" class="form-control" type="text" runat="server"></asp:TextBox>
                    </div>
                    <%-- </form>--%>
                </div>
                <div class="modal-footer">
                    <!--<button type="button" class="btn btn-primary" onclick="guardarCliente" runat="server">Guardar</button>-->
                    <asp:Button Text="Guardar" CssClass="btn btn-primary" ID="btnGuardar" OnClick="guardarCliente" runat="server" />
                </div>
            </div>
        </div>
    </div>

    <div class="tablausuario justify-content">
        <table id="example" class="display" style="width: 100%">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>DNI</th>
                    <th>Email</th>
                    <th>Teléfono</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <%-- <% foreach (dominio.Cliente item in lista)
                    {%>
                <tr>
                    <td><%=item.NroCliente %></td>
                    <td><%=item.Nombre %></td>
                    <td><%=item.Apellido %></td>
                    <td><%=item.DNI %></td>
                    <td><%=item.Email %></td>
                    <td><%=item.Telefono %></td>
    
                    <td>
                        <div class="dropdown">
                            <button class="dropbtn">Acciones</button>
                            <div class="dropdown-content">
                                <a href="#">Modificar</a>
                                <asp:Button Text="Eliminar" CssClass="btn btn-danger" ID="btnEliminar2" OnClick="btnEliminar_Click" CommandArgument='<%#Eval("NroCliente")%>' runat="server" />
 
                            </div>
                        </div>
                    </td>
                </tr>
                <% } %>--%>
                <asp:Repeater runat="server" ID="repetidor">
                    <ItemTemplate>
                        <tr>
                            <td><%#Eval("NroCliente")%></td>
                            <td><%#Eval("Nombre")%></td>
                            <td><%#Eval("Apellido")%></td>
                            <td><%#Eval("DNI")%></td>
                            <td><%#Eval("Email")%></td>
                            <td><%#Eval("Telefono")%></td>

                            <td>
                                <div class="dropdown">
                                    <button class="dropbtn">Acciones</button>
                                    <div class="dropdown-content">
<%--                                        <asp:Button Text="Modificar" CssClass="btn btn-primary" ID="Button3" OnClick="btnModificarCliente_Click" CommandArgument='<%#Eval("NroCliente")%>' runat="server" />--%>
                                        <asp:Button Text="Eliminar" CssClass="btn btn-danger" ID="btnEliminar2" OnClick="btnEliminarCliente_Click" CommandArgument='<%#Eval("NroCliente")%>' runat="server" />

                                    </div>
                                </div>
                            </td>

                        </tr>

                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </div>
</asp:Content>
