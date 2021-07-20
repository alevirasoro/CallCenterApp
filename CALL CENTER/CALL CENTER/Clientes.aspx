<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Clientes.aspx.cs" Inherits="CALL_CENTER.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="titulo">
        <h3>Clientes</h3>
    </div>
    <!--BOTON QUE EJECUTA MODAL-->
    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#modalCliente" data-whatever="@mdo">Agregar Cliente</button>

    <!--DISENO DE MODAL QUE VA A APARECER PARA CARGAR LOS DATOS Y DESPUES AL ACEPTAR HACE FUNCION DE AGREGAR A BD-->
            <script>
                function validar() {
                    var nombre = document.getElementById("<% =clienteName.ClientID %>").value;
                    var apellido = document.getElementById("<% = clienteApe.ClientID %>").value;
                    var mail = document.getElementById("<% =clienteMail.ClientID %>").value;
                    var valido = true;

                    if (nombre === "") {
                        $("#<% =clienteName.ClientID %>").removeClass("is-valid");
                        $("#<% =clienteName.ClientID %>").addClass("is-invalid");
                        valido = false;
                    }
                    else {
                        $("#<% =clienteName.ClientID %>").removeClass("is-invalid");
                        $("#<% =clienteName.ClientID %>").addClass("is-valid");
                    }
<%--                    if (apellido === "") {
                        $("#<% =clienteApe.ClientID %>").removeClass("is-valid");
                        $("#<% =clienteApe.ClientID %>").addClass("is-invalid");
                        valido = false;
                    }
                    else {
                        $("#<% =clienteApe.ClientID %>").removeClass("is-invalid");
                        $("#<% =clienteApe.ClientID %>").addClass("is-valid");
                    }--%>

                    if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3,4})+$/.test(mail)) {
                        $("# <% =clienteMail.ClientID %>").removeClass("is-invalid");
                        $("# <% =clienteMail.ClientID %>").addClass("is-valid");
                    } else {
                        $("# <% =clienteMail.ClientID %>").removeClass("is-valid");
                        $("# <% =clienteMail.ClientID %>").addClass("is-invalid");
                        valido = false;
                    }

                    return false;
                }

            
            </script>

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
                    <div class="form-group">
                        <label for="client-name" class="col-form-label">Nombre:</label>
                        <asp:TextBox ID="clienteName" class="form-control" type="text" runat="server"></asp:TextBox>
                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ControlToValidate="clienteName" ErrorMessage="Este campo es obligatorio">
                        </asp:RequiredFieldValidator>--%>
                    </div>
                    <div class="form-group">
                        <label for="client-ape" class="col-form-label">Apellido:</label>
                        <asp:TextBox ID="clienteApe" class="form-control" type="text" runat="server"></asp:TextBox>
                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                            ControlToValidate="clienteApe" ErrorMessage="Este campo es obligatorio">
                        </asp:RequiredFieldValidator>--%>
                    </div>
                    <div class="form-group">
                        <label for="client-mail" class="col-form-label">Mail:</label>
                        <asp:TextBox ID="clienteMail" class="form-control" type="text" runat="server"></asp:TextBox>
                       <%-- <asp:RequiredFieldValidator ID="rfvhouse" runat="server"
                            ControlToValidate="clienteMail" ErrorMessage="Este campo es obligatorio">
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="remail" runat="server"
                            ControlToValidate="clienteMail" ErrorMessage="Ingresar un formato de mail correcto"
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                        </asp:RegularExpressionValidator>--%>
                    </div>
                    <div class="form-group">
                        <label for="client-tel" class="col-form-label">Telefono:</label>
                        <asp:TextBox ID="clienteTel" class="form-control" type="text" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="client-dni" class="col-form-label">DNI/CUIL/CUIT:</label>
                        <asp:TextBox ID="clienteDni" class="form-control" type="text" runat="server"></asp:TextBox>
                       <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                            ControlToValidate="clienteDni" ErrorMessage="Este campo es obligatorio">
                        </asp:RequiredFieldValidator>
                        <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer"
                            ControlToValidate="clienteDni" ErrorMessage="Ingresar solo números" />--%>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button Text="Guardar" CssClass="btn btn-primary" ID="btnGuardar" OnClientClick="return validar()" OnClick="guardarCliente" runat="server" />
                </div>
            </div>
        </div>
    </div>
    <!--MODAL PARA MODIFICAR CLIENTE-->
        <div class="modal fade" id="modalModificarCliente" tabindex="1" aria-labelledby="exampleModalLabe2" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel2">Modificar Cliente</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="client-name" class="col-form-label">Nombre:</label>
                        <asp:TextBox ID="clienteName2" class="form-control" type="text" runat="server"></asp:TextBox>
                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ControlToValidate="clienteName" ErrorMessage="Este campo es obligatorio">
                        </asp:RequiredFieldValidator>--%>
                    </div>
                    <div class="form-group">
                        <label for="client-ape" class="col-form-label">Apellido:</label>
                        <asp:TextBox ID="clienteApe2" class="form-control" type="text" runat="server"></asp:TextBox>
                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                            ControlToValidate="clienteApe" ErrorMessage="Este campo es obligatorio">
                        </asp:RequiredFieldValidator>--%>
                    </div>
                    <div class="form-group">
                        <label for="client-mail" class="col-form-label">Mail:</label>
                        <asp:TextBox ID="clienteMail2" class="form-control" type="text" runat="server"></asp:TextBox>
                       <%-- <asp:RequiredFieldValidator ID="rfvhouse" runat="server"
                            ControlToValidate="clienteMail" ErrorMessage="Este campo es obligatorio">
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="remail" runat="server"
                            ControlToValidate="clienteMail" ErrorMessage="Ingresar un formato de mail correcto"
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                        </asp:RegularExpressionValidator>--%>
                    </div>
                    <div class="form-group">
                        <label for="client-tel" class="col-form-label">Telefono:</label>
                        <asp:TextBox ID="clienteTel2" class="form-control" type="text" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="client-dni" class="col-form-label">DNI/CUIL/CUIT:</label>
                        <asp:TextBox ID="clienteDni2" class="form-control" type="text" runat="server"></asp:TextBox>
                       <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                            ControlToValidate="clienteDni" ErrorMessage="Este campo es obligatorio">
                        </asp:RequiredFieldValidator>
                        <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer"
                            ControlToValidate="clienteDni" ErrorMessage="Ingresar solo números" />--%>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button Text="Guardar" CssClass="btn btn-primary" ID="btnModificar"  CommandArgument='47' OnClick="btnModificarCliente_Click" runat="server" />
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
                    <th>Documento</th>
                    <th>Email</th>
                    <th>Teléfono</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>               
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
                                        <asp:Button Text="Modificar2" CssClass="btn btn-danger" ID="Button5" OnClick="AgregarNroClienteSession" CommandArgument='<%#Eval("NroCliente")%>' runat="server" />
                                        <asp:Button Text="Modificar" CssClass="btn btn-primary" data-toggle="modal" data-target="#modalModificarCliente"  data-whatever="@mdo" ID="Button1" OnClientClick="return false" runat="server" />
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
