<%-- 
    Document   : carrito
    Created on : 20-ene-2017, 1:28:55
    Author     : Antonio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../INC/enlaces.jsp"></jsp:include>
            <title>Carrito</title>
        </head>
        <body>
        <jsp:include page="../INC/cabecera.jsp"></jsp:include>
            <div class="container-fluid cuerpo"> 
                <div class="row">
                    <div class="col-xs-12 col-sm-offset-1 col-sm-10">
                        <div class="div-breadcrumb col-xs-12 col-sm-12">
                            <ul class="breadcrumb col-sm-6">
                                <li><a href="${contexto}/">Inicio</a></li>
                            <li class="active">Carrito</li>
                        </ul>
                    </div>
                    <div class="cuerpo-carrito col-sm-12 col-xs-12">
                        <h2 class="text-center">Carrito de la compra</h2>
                        <table>
                            <tr>
                                <th>Producto</th>
                                <th>Precio</th>
                                <th>Cantidad</th>
                            </tr>
                            <c:forEach var="linea" items="${pedido.lineasPedido}">
                                <c:forEach var="producto" items="${productos}">
                                    <c:if test="${linea.idProducto==producto.idProducto}">
                                        <tr class="text-left">
                                        <td><c:out value="${producto.denominacion}"/></td>
                                        <td><c:out value="${producto.precioUnitario}"/></td>
                                        <td><c:out value="${linea.cantidad}"/></td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="../INC/pie.jsp"></jsp:include>
    </body>
</html>
