﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="CALL_CENTER.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="titulo">
        <h1>Usuarios</h1>
    </div>

    Si tiene permisos muestra todos los usurios sino solo el suyo

     <button type="button" class="btn btn-success" data-toggle="modal" data-target="#modalUsuario">Nuevo USuario</button>
    
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
                    <%--<form>--%>
                    <div class="form-group">
                        <label for="usu-name" class="col-form-label">Nombre:</label>
                        <!--<input type="text" class="form-control" id="clienteName"/>-->
                        <asp:TextBox ID="usuName" class="form-control" type="text" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="usu-ape" class="col-form-label">Apellido:</label>
                        <!-- <input type="text" class="form-control" id="clientApe"/>-->
                        <asp:TextBox ID="usuApe" class="form-control" type="text" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="usu-mail" class="col-form-label">Mail:</label>
                        <!-- <input type="text" class="form-control" id="clientMail"/>-->
                        <asp:TextBox ID="usuMail" class="form-control" type="text" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="usu-tel" class="col-form-label">Telefono:</label>
                        <!--  <input type="text" class="form-control" id="clientTel"/>-->
                        <asp:TextBox ID="usuTel" class="form-control" type="text" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="usu-dni" class="col-form-label">DNI/CUIL/CUIT:</label>
                        <!--   <input type="text" class="form-control" id="clientDni"/>-->
                        <asp:TextBox ID="usuDni" class="form-control" type="text" runat="server"></asp:TextBox>
                    </div>
                    <asp:DropDownList runat="server" ID="ddlPerfilUsuario" CssClass="btn btn-outline-dark dropdown-toggle"></asp:DropDownList>
                    <%-- </form>--%>
                </div>
                <div class="modal-footer">
                    <!--<button type="button" class="btn btn-primary" onclick="guardarCliente" runat="server">Guardar</button>-->
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
                    <th>Fecha de Nacimiento</th>
                    <th>Teléfono</th>
                    <th>Mail</th>
                    <th>Perfil</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>5152</td>
                    <td>alejandro</td>
                    <td>virasoro</td>
                    <td>351352</td>
                    <td>2011/04/25</td>
                    <td>4534532-1232-3</td>
                    <td>mail@maidfasdf.com</td>
                    <td>CLIENTE</td>
                    <td><div class="dropdown">
                            <button class="dropbtn">Acciones</button>
                            <div class="dropdown-content">
                                <a href="#">Modificar</a>
                                <a href="#">Eliminar</a>
                                <a href="#">Ver Detalle</a>
                            </div>
                        </div></td>
                </tr>
                <tr>
                    <td>1234</td>
                    <td>joaquin</td>
                    <td>achaval</td>
                    <td>431235</td>
                    <td>2011/04/25</td>
                    <td>423231-123421</td>
                    <td>mail@mail.com</td>
                    <td>administrador</td>
                    <td><div class="dropdown">
                            <button class="dropbtn">Acciones</button>
                            <div class="dropdown-content">
                                <a href="#">Modificar</a>
                                <a href="#">Eliminar</a>
                                <a href="#">Ver Detalle</a>
                            </div>
                        </div></td>
                </tr>
            </tbody>
        </table>
    </div>

</asp:Content>
