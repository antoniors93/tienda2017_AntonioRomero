<%-- 
    Document   : comprasCliente
    Created on : 26-ene-2017, 12:30:21
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
                            <li class="active">Consultar compras</li>
                            
                        </ul>
                    </div>
                            <div class="cuerpo-perfil col-sm-12 col-xs-12">
                        <h2 class="text-center">Compras realizadas</h2>
                        <ul class="lista-compras">
                        <c:forEach var="pedido" items="${pedidos}">
                            <li>Pedido <c:out value="${pedido.idPedido}"/> (<c:out value="${pedido.fecha}"/>)</li>
                            <ul>
                                <li>
                                    <c:if test="${pedido.estado eq 'p'.charAt(0)}">Estado: pendiente.</c:if>
                                    <c:if test="${pedido.estado eq 'r'.charAt(0)}">Estado: remitido.</c:if>
                                </li>
                            <li>Importe: <c:out value="${pedido.baseImponible}"/>€</li>
                            <li>Productos:</li>
                            <ul>
                               <c:forEach var="linea" items="${pedido.lineasPedido}">
                                   <c:forEach var="producto" items="${productos}">
                                       <c:if test="${producto.idProducto==linea.idProducto}">
                                           <li>x<c:out value="${linea.cantidad}"/> <c:out value="${producto.denominacion}"/></li>
                                       </c:if>
                                   </c:forEach>
                               </c:forEach>
                            </ul>
                            </ul>
                        </c:forEach>
                        </ul>
                    </div>
                    <div id="modalMensaje" class="modal fade" tabindex="-1" role="dialog">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h3>Disculpe las molestias</h3>
                                </div>
                                <div class="modal-body">
                                    <h4 style="color:black">Su pedido ha quedado pendiente por falta de existencias. Le haremos llegar su pedido lo antes posible.</h4>   
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
                if(${estado=='p'}){                    
                    $("#modalMensaje").modal("show");
                }
            });
        </script>
    </body>
</html>
