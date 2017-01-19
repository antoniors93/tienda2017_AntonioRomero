<%-- 
    Document   : registroCliente
    Created on : 18-ene-2017, 1:03:38
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
                            <li class="active">Perfil de usuario</li>
                        </ul>
                    </div>
                    <div class="cuerpo-perfil col-sm-12 col-xs-12">
                        <div class="menu-perfil col-sm-4 col-xs-12">
                            <ul>
                                <li><a href="${contexto}/JSP/registroCliente.jsp">Actualizar mis datos</a></li>
                                <li><a href="">Consultar mis compras</a></li>
                            </ul>
                        </div>
                        <div class="info-perfil col-sm-8 col-xs-12">
                            <h2>Información personal <i class="fa fa-user-circle fa-2x pull-right" aria-hidden="true"></i></h2>
                            <ul>
                                <li>Nombre: <c:out value="${cliente.nombre}"/></li>
                                <li>Apellidos: <c:out value="${cliente.apellidos}"/></li>
                                <li>NIF: <c:out value="${cliente.NIF}"/></li>
                                <li>Fecha de nacimiento: <c:out value="${cliente.fechaNacimiento}"/></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="../INC/pie.jsp"></jsp:include>
    </body>
</html>
