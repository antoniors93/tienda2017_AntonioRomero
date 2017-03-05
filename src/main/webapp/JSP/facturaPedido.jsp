<%-- 
    Document   : facturaPedido
    Created on : 28-ene-2017, 12:24:30
    Author     : Antonio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                        <div class="cuerpo-carrito col-sm-12 col-xs-12">
                            <div class="cabecera-factura col-xs-12 col-sm-12">
                                <div class="col-xs-12 col-sm-4">
                                    <br/>
                                    <p><c:out value="${cliente.nombre} ${cliente.apellidos}"/></p>
                                <p><c:out value="${cliente.NIF}"/></p>
                                <c:forEach items="${cliente.direcciones}" var="direccion">
                                    <c:if test="${direccion.idDireccion==param.id}">
                                        <p><c:out value="${direccion.nombreDireccion} ${direccion.direccion}"/></p>
                                        <p><c:out value="${direccion.codigoPostal}  ${direccion.localidad} / ${direccion.provincia}"/></p>
                                    </c:if>
                                </c:forEach>
                            </div>
                            <div class="col-xs-12 col-sm-offset-5 col-sm-3">
                                <img class="img-responsive logo" src="${contexto}/IMG/logo1.png"/>
                                <br/>
                                <p>Polígono Industrial El Prado, Calle Almería, 3, 06800 Mérida/Badajoz</p>
                            </div>
                        </div>
                        <h2 class="text-center">Factura</h2>
                        <table id="tabla">
                            <tr>
                                <th>Producto</th>
                                <th>Cantidad</th>
                                <th>Precio</th>                                
                                <th>Importe</th>
                            </tr>
                            <c:forEach var="linea" items="${pedido.lineasPedido}">
                                <c:forEach var="producto" items="${productos}">
                                    <c:if test="${linea.idProducto==producto.idProducto}">
                                        <tr class="text-left">
                                            <td><c:out value="${producto.denominacion}"/></td>
                                            <td><c:out value="${linea.cantidad}"/></td>
                                            <td><fmt:formatNumber value="${producto.precioUnitario-producto.precioUnitario*general.iva/100}" maxFractionDigits="2"/></td>
                                            <td><fmt:formatNumber value="${(producto.precioUnitario-producto.precioUnitario*general.iva/100)*linea.cantidad}" maxFractionDigits="2"/></td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                            </c:forEach>
                        </table>
                        <div>
                            <table id="tabla">
                                <tr class="text-left">
                                    <td><strong>Total sin IVA:</strong></td>
                                    <td><fmt:formatNumber value="${((pedido.baseImponible-general.gastosEnvio)-(pedido.baseImponible-general.gastosEnvio)*general.iva/100)}" maxFractionDigits="2"/></td>
                                </tr>
                                <tr class="text-left">
                                    <td>
                                        <strong>IVA</strong> (<c:out value="${general.iva}"/>% de <fmt:formatNumber value="${((pedido.baseImponible-general.gastosEnvio)-(pedido.baseImponible-general.gastosEnvio)*general.iva/100)}" maxFractionDigits="2"/>):
                                    </td>
                                    <td>
                                        <fmt:formatNumber value="${(pedido.baseImponible-general.gastosEnvio)*general.iva/100}" maxFractionDigits="2"/>
                                    </td>
                                </tr>
                                <tr class="text-left">
                                    <td><strong>Gastos de envío:</strong></td>
                                    <td><fmt:formatNumber value="${general.gastosEnvio}" minFractionDigits="2"/></td>
                                </tr>    
                                <tr class="text-left" style="font-size: 18px; background: #ebeced">
                                    <td><strong>Total:</strong></td>
                                    <td><fmt:formatNumber value="${pedido.baseImponible}" type="currency"/></td>
                                </tr> 
                            </table>
                        </div>
                        <div class="botones-carrito text-center col-xs-12 col-sm-12">
                            <a href="${contexto}/FinFactura?estado=${pedido.estado}">Aceptar</a>
                        </div>
                        <c:set var="pedido" scope="session" value="${null}"/>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="../INC/pie.jsp"></jsp:include>
    </body>
</html>
