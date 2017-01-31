<%-- 
    Document   : pedirProductos
    Created on : 29-ene-2017, 21:05:39
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
                            <ul class="breadcrumb col-sm-9">
                                <li><a href="${contexto}/">Inicio</a></li>
                            <li><a href="${contexto}/JSP/perfilCliente.jsp">Perfil de usuario</a></li>
                            <li><a href="${contexto}/JSP/panelAdministrador.jsp">Panel de Administración</a></li>
                            <li class="active">Pedido de productos bajo Stock mínimo</li>
                            
                        </ul>
                    </div>
                        <div class="cuerpo-perfil col-sm-12 col-xs-12">
                        <h2 class="text-center">Productos bajo Stock mínimo</h2>
                        <div class="cuerpo-admin col-xs-12 text-center">
                            <c:set var="contador" value="0"/>
                            <c:forEach var="producto" items="${productos}">
                            <c:if test="${producto.stock<producto.stockMinimo}">
                                <p><c:out value="${producto.denominacion}"/></p>
                                <c:set var="contador" value="${contador+1}"/>
                            </c:if>
                        </c:forEach>
                                <c:if test="${contador==0}">
                                    <p>Actualmente no hay productos bajo stock mínimo.</p>
                                </c:if>
                                    <label>Unidades por producto</label>
                                    <input id="unidades" type="number" min="0" max="30" step="5" value="1"/>
                                <button class="btn btn-default" id="pedir">Realizar pedido</button>
                        </div>
                        </div>
                        <div id="modalStock" class="modal fade" tabindex="-1" role="dialog">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h3>Mensaje</h3>
                                </div>
                                <div class="modal-body">
                                    <h4 style="color:black">Operación realizada con exito.</h4>   
                                </div>
                                <div class="modal-footer">
                                    <a href="#" data-dismiss="modal" class="btn btn-default">Cerrar</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
        <jsp:include page="../INC/pie.jsp"></jsp:include>
        <script> 
            $(document).ready(function() {
                $('#pedir').click(function(event) {
                    var unidades = $('#unidades').val();
                    var pedir = "pedir";
                    $.post('${contexto}/OperacionesAdmin', {
                            unidades : unidades,
                            pedir : pedir
                        }, function(responseText) {
                            $("#modalStock").modal("show");
                        });
                });
            });
        </script>
    </body>
</html>
