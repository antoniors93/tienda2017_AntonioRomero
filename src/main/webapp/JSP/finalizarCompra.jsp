<%-- 
    Document   : finalizarCompra
    Created on : 25-ene-2017, 11:25:42
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
                        <div class="cuerpo-final col-sm-12 col-xs-12">
                            <h2 class="text-center">Finalizar compra.</h2>                            
                            <form method="post" action="${contexto}/RealizarPago">
                            <div class="col-sm-6 col-xs-12" >
                                <h4 class="text-center">Datos personales:</h4>
                                <div class="datos">
                                    <ul>
                                        <li>Nombre: <c:out value="${cliente.nombre}"/></li>
                                        <li>Apellidos: <c:out value="${cliente.apellidos}"/></li>
                                        <li>NIF: <c:out value="${cliente.NIF}"/></li>
                                        <li>Fecha de nacimiento: <c:out value="${cliente.fechaNacimiento}"/></li>
                                        <li>Dirección de envío:<br/><br/>
                                            <select><vr/>
                                                <c:forEach var="direccion" items="${cliente.direcciones}">
                                                    <option><c:out value="${direccion.nombreDireccion}"/> 
                                                        <c:out value="${direccion.direccion}"/> 
                                                        <c:out value="${direccion.localidad}"/>/<c:out value="${direccion.provincia}"/> 
                                                        <c:out value="${direccion.codigoPostal}"/> 
                                                        Tlf: <c:out value="${direccion.telefono}"/>
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div id="tarjeta" class="col-sm-6 col-xs-12">
                                <h4 class="text-center">Datos de pago:</h4>
                                <div class="datos">
                                    <label>Titular de la tarjeta:</label>
                                    <input type="text" required/>
                                    <label>Número de la tarjeta:</label>
                                    <input type="text" required/>
                                    <label>Código de seguridad:</label>
                                    <input type="text" required/>
                                    <label>Fecha de caducidad</label>
                                    <input type="date" required/>
                                </div>
                            </div>

                            <div class="botones-carrito text-center col-sm-12 col-xs-12">
                                <a href="${contexto}/JSP/carrito.jsp">Atrás</a>
                                <a href=""  data-toggle="modal" data-target="#modalConfirmar">Confirmar</a>
                            </div>
                            <div id="modalConfirmar" class="modal fade" tabindex="-1" role="dialog">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            <h3 class="modal-title">Finzalizar compra.</h3>
                                        </div>
                                        <div class="modal-body text-left">
                                            <h4 style="color:black">¿Desea realizar el pedido?</h4>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                                            <a href="${contexto}/RealizarPago"><button type="submit" class="btn btn-default">Aceptar</button></a>
                                        </div>
                                    </div><!-- /.modal-content -->
                                </div><!-- /.modal-dialog -->
                            </div>
                        </form>                       
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="../INC/pie.jsp"></jsp:include>
    </body>
</html>
