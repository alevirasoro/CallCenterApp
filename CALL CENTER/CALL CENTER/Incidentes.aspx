<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Incidentes.aspx.cs" Inherits="CALL_CENTER.Incidentes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="titulo" >
        <h3>Listado de Incidentes</h3>
        <p>se listan todos los incidentes en una grilla aca</p>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-sm border border-primary">
                Fecha
            </div>
            <div class="col-sm border border-primary">
                Numero
            </div>
            <div class="col-sm border border-primary">
                Cliente
            </div>
             <div class="col-sm border border-primary">
                Asunto
            </div>
             <div class="col-sm border border-primary">
                Estado
            </div>
        </div>
    </div> 
    <div class="container">
         <% foreach (dominio.Incidente item in lista)
             {%>
        <div class="row" >
            <div class="col-sm border border-primary">
                <%= item.Fecha.ToString("dd/MM/yyyy") %>
            </div>
            <div class="col-sm border border-primary">
                <%=item.Numero %>
            </div>
            <div class="col-sm border border-primary">
                <%=item.Cliente %>
            </div><div class="col-sm border border-primary">
               Asunto descripcion
            </div><div class="col-sm border border-primary">
                Estado
            </div>
        </div>

            <% } %>
    </div>
    
        
</asp:Content>
