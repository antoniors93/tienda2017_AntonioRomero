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
                        <p class="visible-xs text-center" style="font-size: 1.3rem">Scroll <i class="fa fa-arrows-h"></i></p>
                        <table>
                            <tr>
                                <th>Producto</th>
                                <th>Precio/€</th>
                                <th>Cantidad</th>
                                <th>Eliminar</th>
                            </tr>
                            <c:set var="contador" value="0"/>      
                            <c:forEach var="linea" items="${pedido.lineasPedido}">
                                <c:forEach var="producto" items="${productos}">
                                    <c:if test="${linea.idProducto==producto.idProducto}">
                                        <c:set var="contador" value="${contador+1}"/>
                                        <tr class="text-left">
                                        <td><c:out value="${producto.denominacion}"/></td>
                                        <td><c:out value="${producto.precioUnitario}"/></td>
                                        <td>
                                            <select  class="cantidad" style="width: 40px">
                                                <c:forEach begin="1" step="1" var="valor" end="${producto.stock}">
                                                    <option value="${valor}"><c:out value="${valor}"/></option>
                                                    <c:if test="${linea.cantidad==valor}">
                                                        <option value="${valor}" selected=""><c:out value="${valor}"/></option>
                                                    </c:if>
                                                    
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <td><button class="btn-eliminar" value="${linea.numeroLinea}"><i class="fa fa-trash-o" aria-hidden="true"></i></button></td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                            </c:forEach>
                            <c:if test="${contador==0}">
                                    <tr>
                                        <td colspan="4">No hay productos añadidos</td>
                                    </tr>
                                </c:if>
                        </table>
                        <div class="botones-carrito text-center col-xs-12 col-sm-12">
                            <a href="">Confirmar pedido</a>
                            <a href="${contexto}/CerrarPedido?op=cancelar" >Cancelar pedido</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="../INC/pie.jsp"></jsp:include>
            <script> 
                $(document).ready(function() {
                    $('.btn-eliminar').click(function(event) {
                        $(this).parent().parent().hide();
                        var numLinea = $(this).val();
                       $.post('${contexto}/OperacionesCarrito', {
                                numLinea: numLinea                              
                            }, function(responseText) {
                                $('.numero-carrito').text(responseText);
                            });
                    });
                });
        </script>
        <script> 
            $(document).ready(function() {
                $('.cantidad').change(function(event) {
                    var cantidad = $(this).val();
                    var numLinea = $(this).parent().parent().find('td .btn-eliminar').val();
                    var opcion = "actualizar";
                    $.post('${contexto}/OperacionesCarrito', {
                            cantidad : cantidad,
                            numLinea : numLinea,
                            opcion : opcion
                        }, function(responseText) {
                        });
                });
            });
        </script>
    </body>
</html>
