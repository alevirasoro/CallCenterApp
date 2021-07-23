<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Configuraciones.aspx.cs" Inherits="CALL_CENTER.WebForm4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div>
    <h2>Tipos</h2>
    
    <!--DROPDOWN-->
    <asp:DropDownList runat="server" ID="ddlTipos" CssClass="btn btn-outline-dark dropdown-toggle"></asp:DropDownList>
        </div>
    <!--NUEVO TIPO-->
<div>
    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#modalTipo">Agregar Tipo</button>

    <asp:Button Text="Modificar" CssClass="btn btn-primary" ID="Button2" OnClick="btnModificar1_Click" runat="server" />
    
    <asp:Button Text="Eliminar" CssClass="btn btn-danger" ID="Button1" OnClick="btnEliminar1_Click" runat="server" />
    </div>
    <div class="modal fade" id="modalTipo" tabindex="1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="labelTipo">Nuevo Tipo de Incidente</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <!--      <form>-->
                    <div class="form-group">
                        <label for="nombreTipo" class="col-form-label">Tipo:</label>
                        <asp:TextBox ID="nombreTipo" class="form-control" type="text" runat="server"></asp:TextBox>
                    </div>
                    <!--       </form>-->
                </div>
                <div class="modal-footer">
                    <asp:Button Text="Guardar" CssClass="btn btn-primary" ID="btnGuardarTipo" OnClick="guardarTipo" runat="server" />
                </div>
            </div>
        </div>
    </div>

    <div>
    <h2>Prioridades</h2>
        <asp:DropDownList runat="server" ID="ddlPrioridades" CssClass="btn btn-outline-dark dropdown-toggle"></asp:DropDownList>
        </div>
    <div></div>
    <div></div>
    <div></div>
    
    <!--NUEVA PRIORIDAD-->
    <div>
    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#modalPrioridad">Agregar Prioridad</button>

    <asp:Button Text="Modificar" CssClass="btn btn-primary" ID="Button3" OnClick="btnModificar2_Click" runat="server" />

    <asp:Button Text="Eliminar" CssClass="btn btn-danger" ID="btnEliminar2" OnClick="btnEliminar2_Click" runat="server" />
</div>
    <div class="modal fade" id="modalPrioridad" tabindex="1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="labelPrioridad">Nuevo Nivel de Prioridad</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                  <%--  <form>--%>
                        <div class="form-group">
                            <label for="nombrePrioridad" class="col-form-label">Prioridad:</label>
                            <asp:TextBox ID="nombrePrioridad" class="form-control" type="text" runat="server"></asp:TextBox>
                        </div>
                   <%-- </form>--%>
                </div>
                <div class="modal-footer">
                    <asp:Button Text="Guardar" CssClass="btn btn-primary" ID="btnGuardarPrioridad" OnClick="guardarPrioridad" runat="server" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
