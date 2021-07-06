<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Configuraciones.aspx.cs" Inherits="CALL_CENTER.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!--NUEVO TIPO-->
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalTipo">Agregar Tipo</button>
    
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
            <form>
              <div class="form-group">
                <label for="nombreTipo" class="col-form-label">Tipo:</label>
                <asp:TextBox ID="nombreTipo" class="form-control" type="text" runat="server"></asp:TextBox>
              </div>
            </form>
          </div>
          <div class="modal-footer">
              <asp:Button Text="Guardar" CssClass="btn btn-primary" ID="btnGuardarTipo" OnClick="guardarTipo" runat="server" />
          </div>
            </div>
        </div>
      </div>

    <!--NUEVA PRIORIDAD-->
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalPrioridad">Agregar Prioridad</button>
    
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
            <form>
              <div class="form-group">
                <label for="nombrePrioridad" class="col-form-label">Prioridad:</label>
                <asp:TextBox ID="nombrePrioridad" class="form-control" type="text" runat="server"></asp:TextBox>
              </div>
            </form>
          </div>
          <div class="modal-footer">
              <asp:Button Text="Guardar" CssClass="btn btn-primary" ID="btnGuardarPrioridad" OnClick="guardarPrioridad" runat="server" />
          </div>
            </div>
        </div>
      </div>
</asp:Content>
