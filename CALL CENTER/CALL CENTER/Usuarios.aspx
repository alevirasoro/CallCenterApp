<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="CALL_CENTER.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="titulo">
        <h1>Usuarios</h1>
    </div>

     <button type="button" class="btn btn-success" data-toggle="modal" data-target="#modalUsuario">Nuevo Usuario</button>

    <div class="modal fade" id="modalUsuario" tabindex="1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Nuevo Usuario</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="usu-name" class="col-form-label">Nombre:</label>
                        <asp:TextBox ID="usuName" class="form-control" type="text" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="usu-ape" class="col-form-label">Apellido:</label>
                        <asp:TextBox ID="usuApe" class="form-control" type="text" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="usu-tel" class="col-form-label">Teléfono:</label>
                        <asp:TextBox ID="usuTel" class="form-control" type="text" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="usu-dni" class="col-form-label">DNI/CUIL/CUIT:</label>
                        <asp:TextBox ID="usuDni" class="form-control" type="text" runat="server"></asp:TextBox>
                    </div>
                         <div class="form-group">
                        <label for="usu-mail" class="col-form-label">Mail:</label>
                        <asp:TextBox ID="usuMail" class="form-control" type="text" runat="server"></asp:TextBox>
                    </div>
                         <div class="form-group">
                        <label for="usu-user" class="col-form-label">Usuario:</label>
                        <asp:TextBox ID="usuUser" class="form-control" type="text" runat="server"></asp:TextBox>
                    </div>
                         <div class="form-group">
                        <label for="usu-pass" class="col-form-label">Contrasena:</label>
                        <asp:TextBox ID="usuPass" class="form-control" type="text" runat="server"></asp:TextBox>
                    </div>
 <%--                   SE DEBERIA VALIDAR LA CLAVE INGRESANDO DOS VECES Y COMAPRANDO. PUEDE SER CON JS SEGURO ESTO EN TIEMPO REAL--%>
                    <label for="usu-perfil" class="col-form-label">Perfil:</label>
                    <asp:DropDownList runat="server" ID="ddlPerfilUsuario" CssClass="btn btn-outline-dark dropdown-toggle"></asp:DropDownList>
                </div>
                <div class="modal-footer">
                    <asp:Button Text="Guardar" CssClass="btn btn-primary" ID="btnGuardar" OnClick="guardarUsuario" runat="server" />
                </div>
            </div>
        </div>
    </div>


    <!--TABLA DE USUARIOS-->

    <div class="tablausuario justify-content">
        <table id="example" class="display" style="width: 100%">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Documento</th>
                    <th>Mail</th>
                    <th>Teléfono</th>
                    <th>Perfil</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <%-- <% foreach (dominio.Empleado item in lista)
                    {%>
                <tr>
                    <td id="ID"><%=item.ID %></td>
                    <td><%=item.Nombre %></td>
                    <td><%=item.Apellido %></td>
                    <td><%=item.DNI %></td>
                    <td><%=item.Email %></td>
                    <td><%=item.Telefono %></td>
                    <td><%=item.Perfil %></td>
    
                    <td>
                        <div class="dropdown">
                            <button class="dropbtn">Acciones</button>
                            <div class="dropdown-content">
                                <a href="#">Modificar</a>
                                <asp:Button Text="Eliminar" CssClass="btn btn-danger" ID="btnEliminar2" OnClick="btnEliminar2_Click" CommandArgument='<%#Eval("ID")%>' runat="server" />
                                <a href="#">Ver Detalle</a>
                            </div>
                        </div>
                    </td>
                </tr>
                <% } %>--%>
                <asp:Repeater runat="server" ID="repetidor">
                    <ItemTemplate>
                        <tr>
                            <td><%#Eval("ID")%></td>
                            <td><%#Eval("Nombre")%></td>
                            <td><%#Eval("Apellido")%></td>
                            <td><%#Eval("DNI")%></td>
                            <td><%#Eval("Email")%></td>
                            <td><%#Eval("Telefono")%></td>
                            <td><%#Eval("Perfil")%></td>
                            <td>
                                <div class="dropdown">
                                    <button class="dropbtn">Acciones</button>
                                    <div class="dropdown-content">
                                        <asp:Button Text="Modificar" CssClass="btn btn-primary" ID="ModificarEmpleado" OnClick="IrPaginaModificarEmpleado" CommandArgument='<%#Eval("ID")%>' runat="server" />
                                        <asp:Button Text="Eliminar" CssClass="btn btn-danger" ID="btnEliminar2" OnClick="btnEliminarUsuario_Click" CommandArgument='<%#Eval("ID")%>' runat="server" />
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
