<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CALL_CENTER._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Listado de Incidentes</h3>
    <p>se listan todos los incidentes en una grilla aca</p>

    <div class="row">
            <% foreach (dominio.Incidente item in lista)
                {%>
                <div class="col mb-3 col-md-4 ">
                    <div class="card1" style="width: 18rem;">
                        <img src="<% = item.ID %>" class="card-img-top" style="margin-left: 10%" alt="...">
                        <div class="card-body1">
                            <h5><% = item.EmpleadoLegajo %></h5>
                            <%--<p><% = item.Precio.ToString("C",new System.Globalization.CultureInfo("en-US")) %></p>
                            <a href="Carrito.aspx?id=<% = item.Id %>" class="btn btn-primary">Agregar al Carrito</a>
                            <%--<a href="Carrito.aspx?id=<% = item.Id %>&e=t"><i class="fas fa-heart"></i></a>--%>--%>      
                        </div>
                    </div>
                </div>
            <% } %>
        </div>
    </div>
</asp:Content>
