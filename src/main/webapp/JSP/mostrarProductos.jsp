<%-- 
    Document   : mostrarProductos
    Created on : 11-ene-2017, 20:54:52
    Author     : Antonio
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Productos</title>
        <jsp:include page="../INC/enlaces.jsp"></jsp:include>
            <script type="text/javascript">
                    //funcion para paginar
                function pagination(num){
                        var req_num_row=num;
                        var $tr=jQuery('tbody tr');
                        var total_num_row = $tr.length;
                        var num_pages = 0;
                    
                    if (total_num_row % req_num_row == 0) {
                        num_pages = total_num_row / req_num_row;
                    }
                    if (total_num_row % req_num_row >= 1) {
                        num_pages = total_num_row / req_num_row;
                        num_pages++;
                        num_pages = Math.floor(num_pages++);
                    }
                    jQuery('.pagination').empty();
                    for (var i = 1; i <= num_pages; i++) {
                        jQuery('.pagination').append('<a class="btn-pagina btn btn-default" href="#">' + i + '</a>');
                    }
                    $tr.each(function (i) {
                        jQuery(this).hide();
                        if (i + 1 <= req_num_row) {
                            $tr.eq(i).show();
                        }


                    });
                    jQuery('.pagination a').click(function (e) {
                        e.preventDefault();
                        $tr.hide();
                        var page = jQuery(this).text();
                        var temp = page - 1;
                        var start = temp * req_num_row;
                        for (var i = 0; i < req_num_row; i++) {
                            $tr.eq(start + i).show();
                        }
                    });
                }
                jQuery('document').ready(function () {
                    pagination(10);
                });


            </script>
        </head>
        <body>
        <jsp:include page="../INC/cabecera.jsp"></jsp:include>
            <div class="container-fluid cuerpo"> 
                <div class="row">
                    <div class="col-xs-12 col-sm-offset-1 col-sm-10">
                        <div class="div-breadcrumb col-xs-12 col-sm-12">
                            <!--migas de pan a partir del parametro que llegue(de donde vengamos)-->
                            <ul class="breadcrumb col-sm-6">
                                <li><a href="${contexto}/">Inicio</a></li>
                            <li class="active">
                                <c:if test="${param.opcion=='all'}">
                                    <c:out value="Catálogo de productos"/>
                                </c:if>
                                <c:if test="${param.opcion=='s'}">
                                    <c:out value="Productos en oferta"/>
                                </c:if>
                                <c:if test="${param.palabra!=null}">
                                    <c:out value="Búsqueda"/> 
                                </c:if>
                                <c:if test="${param.cat!=null}">
                                    <c:out value="${param.cat}"/>
                                </c:if>                               
                            </li>
                        </ul>
                    </div>
                    <div class="cuerpo-tabla-prods col-sm-12 col-xs-12">
                        <div class="cabecera-tabla-productos">
                            <div class="num_registros_pagina col-sm-2 col-xs-6">
                                <p>Nº de registros</p>
                                <select class="form-control registros_pagina btn btn-default" onchange="pagination(value);">
                                    <option value="10">10</option>
                                    <option value="20">20</option>
                                    <option value="30">30</option>
                                    <option value="50">50</option>
                                </select>
                            </div>
                            <h2 class="titulo-tabla-productos text-center col-sm-8 col-xs-6">
                                <c:if test="${param.opcion=='all'}">
                                    <c:out value="Catálogo de productos"/>
                                </c:if>
                                <c:if test="${param.opcion=='s'}">
                                    <c:out value="Productos en oferta"/>
                                </c:if>
                                <c:if test="${param.palabra!=null}">
                                    <c:out value='"${param.palabra}"'/> 
                                </c:if>
                                <c:out value="${param.cat}"/>
                            </h2>
                            <p class="visible-xs text-center" style="font-size: 1.3rem">Scroll <i class="fa fa-arrows-h"></i></p>
                        </div>

                        <table id="tabla" class="tabla-productos">
                            <thead>
                                <tr>
                                    <th>
                                    </th>
                                    <th id="nombre">Producto <i class="fa fa-sort-asc hidden"></i><i class="fa fa-sort-desc"></i></th>
                                    <th id="marca">Marca <i class="fa fa-sort-asc hidden"></i><i class="fa fa-sort-desc"></i></th>
                                    <th id="precio">Precio/€ <i class="fa fa-sort-asc hidden"></i><i class="fa fa-sort-desc"></i></th>
                                    <th>Disponibilidad</th>
                                </tr>
                            </thead>
                            <tbody id="cuerpo">
                                <c:set var="contador" value="0"/>
                                <c:forEach var="producto" items="${productos}">
                                    <!--comprobamos segun los parametros que nos llegan, que productos debemos mostrar-->
                                        <c:if test="${param.opcion=='all'||producto.oferta==param.opcion||producto.categoria==param.cat||(param.palabra!=null&&(fn:contains(fn:toLowerCase(producto.denominacion), fn:toLowerCase(param.palabra))||fn:contains(fn:toLowerCase(producto.categoria), fn:toLowerCase(param.palabra))))}">
                                            <c:set var="contador" value="${contador+1}"/>
                                            <tr id="fila">
                                                <td> 
                                                    <c:if test="${param.opcion=='all'}">
                                                        <a href="${contexto}/ConsultarProducto?idProd=${producto.idProducto}&opcion=all">
                                                            <div style="min-height:150px; min-width:150px; background-image: url('${contexto}/IMG/imagenesProductos/${producto.imagen}');background-size: contain; background-position: center center; background-repeat: no-repeat;">
                                                            </div>
                                                        </a>
                                                    </c:if>
                                                    <c:if test="${param.opcion=='s'}">
                                                        <a href="${contexto}/ConsultarProducto?idProd=${producto.idProducto}&opcion=s">
                                                            <div style="min-height:150px; min-width:150px; background-image: url('${contexto}/IMG/imagenesProductos/${producto.imagen}');background-size: contain; background-position: center center; background-repeat: no-repeat;">
                                                            </div>
                                                        </a>
                                                    </c:if>
                                                    <c:if test="${param.palabra!=null}">
                                                        <a href="${contexto}/ConsultarProducto?idProd=${producto.idProducto}&palabra=${param.palabra}">
                                                            <div style="min-height:150px; min-width:150px; background-image: url('${contexto}/IMG/imagenesProductos/${producto.imagen}');background-size: contain; background-position: center center; background-repeat: no-repeat;">
                                                            </div>
                                                        </a> 
                                                    </c:if>
                                                    <c:if test="${param.cat!=null}">
                                                        <a href="${contexto}/ConsultarProducto?idProd=${producto.idProducto}&cat=${param.cat}">
                                                            <div style="min-height:150px; min-width:150px; background-image: url('${contexto}/IMG/imagenesProductos/${producto.imagen}');background-size: contain; background-position: center center; background-repeat: no-repeat;">
                                                            </div>
                                                        </a>
                                                    </c:if> 
                                                </td>
                                                <td><c:out value="${producto.denominacion}"/></td>
                                                <td><c:out value="${producto.marca}"/></td>
                                                <td><c:out value="${producto.precioUnitario}"/></td>
                                                <td><c:out value="${producto.stock}"/></td>
                                            </tr>
                                        </c:if>
                                </c:forEach>
                                <c:if test="${contador==0}">
                                    <tr>
                                        <td colspan="5">No hay productos disponibles</td>
                                    </tr>
                                </c:if>
                            </tbody>
                        </table>
                        <div class="pagination">

                        </div>
                    </div>
                </div>                           
            </div>
        </div>
        <jsp:include page="../INC/pie.jsp"></jsp:include>
        <script>

            //icono de ascendente o descendente
            $("#nombre, #marca, #precio").click(function () {
                if ($(this).find(".fa-sort-asc").hasClass("hidden")) {
                    $(this).find(".fa-sort-asc").removeClass("hidden");
                    $(this).find(".fa-sort-desc").addClass("hidden");
                } else {
                    $(this).find(".fa-sort-asc").addClass("hidden");
                    $(this).find(".fa-sort-desc").removeClass("hidden");
                }
            });



            //funciones para ordenar la tabla
            function sortTable(f, n) {
                var rows = $('#tabla tbody  tr').get();

                rows.sort(function (a, b) {

                    var A = getVal(a);
                    var B = getVal(b);

                    if (A < B) {
                        return -1 * f;
                    }
                    if (A > B) {
                        return 1 * f;
                    }
                    return 0;
                });

                function getVal(elm) {
                    var v = $(elm).children('td').eq(n).text().toUpperCase();
                    if ($.isNumeric(v)) {
                        v = parseFloat(v, 10);
                    }
                    return v;
                }

                $.each(rows, function (index, row) {
                    $('#tabla').children('tbody').append(row);
                });
            }
            var uno = 1;
            var dos = 1;
            var tres = 1;
            $("#nombre").click(function () {
                uno *= -1;
                var n = $(this).prevAll().length;
                sortTable(uno, n);
                pagination(10);
            });
            $("#marca").click(function () {
                dos *= -1;
                var n = $(this).prevAll().length;
                sortTable(dos, n);
                pagination(10);
            });
            $("#precio").click(function () {
                tres *= -1;
                var n = $(this).prevAll().length;
                sortTable(tres, n);
                pagination(10);
            });

        </script>        
    </body>
</html>
