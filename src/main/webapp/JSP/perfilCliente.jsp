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
                        <div class="menu-perfil col-sm-5 col-xs-12">
                            <ul>
                                <li><a href="${contexto}/JSP/actualizarCliente.jsp">Actualizar mis datos</a></li>
                                <li><a href="${contexto}/PedidosCliente">Consultar mis compras</a></li>
                                <li><a href="${contexto}/JSP/cambiarPassword.jsp">Cambiar mi contraseña</a></li>
                            </ul>
                        </div>
                        <div class="info-perfil col-sm-7 col-xs-12">
                            <div class="col-sm-offset-2 col-sm-8 col-xs-12">
                                <h2>Información personal</h2>
                            </div>
                            <div class="col-sm-2 col-xs-12 text-center">
                                <i class="fa fa-user-circle fa-4x pull-right" aria-hidden="true"></i>
                            </div>
                            <div class="col-sm-12 col-xs-12">
                            <ul>
                                <li>Nombre: <c:out value="${cliente.nombre}"/></li>
                                <li>Apellidos: <c:out value="${cliente.apellidos}"/></li>
                                <li>NIF: <c:out value="${cliente.NIF}"/></li>
                                <li>Fecha de nacimiento: <c:out value="${cliente.fechaNacimiento}"/></li>
                                <li>
                                    Direcciones de envío:
                                    <ul style="font-size: 14px; padding: 1rem 0 0 2rem;">
                                        <c:if test="${cliente.direcciones==null}">
                                            <li>No existen direcciones de envío</li>
                                        </c:if>
                                        <c:forEach var="direccion" items="${cliente.direcciones}">
                                            <li><c:out value="${direccion.nombreDireccion}"/> 
                                                <c:out value="${direccion.direccion}"/> 
                                                <c:out value="${direccion.localidad}"/>/<c:out value="${direccion.provincia}"/> 
                                                <c:out value="${direccion.codigoPostal}"/> 
                                                Tlf: <c:out value="${direccion.telefono}"/>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </li>
                            </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="../INC/pie.jsp"></jsp:include>
    </body>
</html>
