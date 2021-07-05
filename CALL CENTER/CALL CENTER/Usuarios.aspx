<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="CALL_CENTER.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="titulo">
        <h1>Nombre del usuario</h1>
    </div>


    <h3>Tipo de usuario</h3>
    <h3>Información de registro</h3>
    <h3>Cambiar contraseña</h3>
    Si tiene permisos muestra todos los usurios sino solo el suyo
    <button type="button" class="btn btn-primary">Administrar</button>

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
