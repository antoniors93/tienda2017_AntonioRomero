<%-- 
    Document   : panelAdministrador
    Created on : 29-ene-2017, 20:34:40
    Author     : Antonio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../INC/enlaces.jsp"></jsp:include>
            <title>Usuario</title>
        </head>
        <body>
        <jsp:include page="../INC/cabecera.jsp"></jsp:include>
            <div class="container-fluid cuerpo"> 
                <div class="row">
                    <div class="col-xs-12 col-sm-offset-1 col-sm-10">
                        <div class="div-breadcrumb col-xs-12 col-sm-12">
                            <ul class="breadcrumb col-sm-6">
                                <li><a href="${contexto}/">Inicio</a></li>
                            <li><a href="${contexto}/JSP/perfilCliente.jsp">Perfil de usuario</a></li>
                            <li class="active">Panel de Adminitración</li>
                            
                        </ul>
                    </div>
                        <div class="cuerpo-perfil col-sm-12 col-xs-12">
                        <h2 class="text-center">Panel de Administración</h2>
                        <div class="cuerpo-admin col-xs-12 text-center">
                            <p><a href="">Bloquear/Desbloquear usuarios.</a></p>
                            <p><a href="">Bloquear/Desbloquear productos.</a></p>
                            <p><a href="${contexto}/JSP/pedirProductos.jsp">Realizar pedido de productos bajo stock mínimo.</a></p>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
        <jsp:include page="../INC/pie.jsp"></jsp:include>
    </body>
</html>
