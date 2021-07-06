<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Clientes.aspx.cs" Inherits="CALL_CENTER.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="titulo">
        <h3> Buscar cliente</h3>
    </div>
     <input class="form-control form-control-dark w-100" type="text" placeholder="Search" aria-label="Search">

    
    <!--BOTON QUE EJECUTA MODAL-->
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalCliente" data-whatever="@mdo">Agregar Cliente</button>
    
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
            <form>
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
            </form>
          </div>
          <div class="modal-footer">
            <!--<button type="button" class="btn btn-primary" onclick="guardarCliente" runat="server">Guardar</button>-->
              <asp:Button Text="Guardar" CssClass="btn btn-primary" ID="btnGuardar" OnClick="guardarCliente" runat="server" />
          </div>
        </div>
      </div>
</asp:Content>
