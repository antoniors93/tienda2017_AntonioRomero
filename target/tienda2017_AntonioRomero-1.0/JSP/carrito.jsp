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
                        <table id="tabla">
                            <tr>
                                <th>Producto</th>
                                <th>Precio/€</th>
                                <th>Cantidad</th>
                                <th>Eliminar</th>
                            </tr>
                            <!--Mostramos las lineas de pedido del pedido de la sesion y mostramos los datos del producto-->
                            <c:set var="contador" value="0"/>      
                            <c:forEach var="linea" items="${pedido.lineasPedido}">
                                <c:forEach var="producto" items="${productos}">
                                    <c:if test="${linea.idProducto==producto.idProducto}">
                                        <c:set var="contador" value="${contador+1}"/>
                                        <tr class="text-left">
                                        <td><c:out value="${producto.denominacion}"/></td>
                                        <td class="precioU"><c:out value="${producto.precioUnitario}"/></td>
                                        <td>
                                            <select class="cantidad" style="width: 40px">
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
                           <c:if test="${contador!=0}">
                                <tr>
                                    <td id="precGeneral" colspan="4" style="font-size: 18px; padding-bottom: 1rem;"><p id="precTotal">Precio total:</p> <p style="font-size: 10px;">(10€ de gastos de envío incluídos)</p></td>
                                </tr>
                           </c:if>
                        </table>
                        <div class="botones-carrito text-center col-xs-12 col-sm-12">
                            <c:if test="${pedido==null}">
                                <a href="" data-toggle="modal" data-target="#modalConfirmar">Confirmar pedido</a>
                                <a href="" data-toggle="modal" data-target="#modalConfirmar">Cancelar pedido</a>
                            </c:if>
                            <c:if test="${pedido!=null}">
                                <a href="${contexto}/FinalizarCompra">Confirmar pedido</a>
                                <a href="" data-toggle="modal" data-target="#modalCancelar">Cancelar pedido</a>
                            </c:if>                             
                        </div>
                        <div id="modalConfirmar" class="modal fade" tabindex="-1" role="dialog">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h3 class="modal-title">Operación denegada</h3>
                                    </div>
                                    <div class="modal-body text-left">
                                        <h4 style="color:black">Su carrito está vacío.</h4>
                                    </div>
                                    <div class="modal-footer">
                                        <a href="#" data-dismiss="modal" class="btn btn-default">Cerrar</a>
                                    </div>
                                </div><!-- /.modal-content -->
                            </div><!-- /.modal-dialog -->
                        </div>
                        <div id="modalCancelar" class="modal fade" tabindex="-1" role="dialog">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h3 class="modal-title">Cancelar pedido</h3>
                                    </div>
                                    <div class="modal-body text-left">
                                        <h4 style="color:black">¿Está seguro de que desea cancelar su pedido?</h4>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                                        <a href="${contexto}/CerrarPedido?op=cancelar"><button type="button" class="btn btn-default">Aceptar</button></a>
                                    </div>
                                </div><!-- /.modal-content -->
                            </div><!-- /.modal-dialog -->
                        </div>
                        <div id="modalBorrar" class="modal fade" tabindex="-1" role="dialog">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h3>Pedido cancelado</h3>
                                </div>
                                <div class="modal-body">
                                    <h4 style="color:black">No hay productos en el carrito.</h4>   
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
        </div>
        <jsp:include page="../INC/pie.jsp"></jsp:include>
        
        <script>
            $('#precTotal').html("Precio total: ");
            $('#precTotal').append(calcularTotal()+"€");
            function calcularTotal(){
                var total=0;
                $('#tabla tr').each(function(){                    
                    var cant=$(this).find('td .cantidad option:selected').text();
                    var precio=$(this).find('.precioU').text();
                    total=total+cant*precio;
                });
                total=total+${general.gastosEnvio};
                return parseFloat(total).toFixed(2);
            }
            </script>
            <script> 
                $(document).ready(function() {
                    $('.btn-eliminar').click(function(event) {
                        $(this).parent().parent().remove();                      
                        var numLinea = $(this).val();
                       $.post('${contexto}/OperacionesCarrito', {
                                numLinea: numLinea                              
                            }, function(responseText) {
                                if(responseText==0){                                
                                    $('#tabla').append('<tr><td colspan="4">No hay productos añadidos</td></tr>');
                                    $('#precGeneral').remove();
                                    $('.numero-carrito').text("");        
                                    $("#modalBorrar").modal("show");
                                }else{
                                $('.numero-carrito').text(responseText);
                                $('#precTotal').html("Precio total: ");
                                $('#precTotal').append(calcularTotal()+"€");
                            }
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
                            $('#precTotal').html("Precio total: ");
                            $('#precTotal').append(calcularTotal()+"€");
                        });
                });
            });
        </script>
    </body>
</html>
