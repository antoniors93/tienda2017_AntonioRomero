<%-- 
    Document   : bloquearProductos
    Created on : 30-ene-2017, 12:23:38
    Author     : Antonio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../INC/enlaces.jsp"></jsp:include>
            <title>Usuario</title>
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
                    pagination(20);
                });


            </script>
        </head>
        <body>
        <jsp:include page="../INC/cabecera.jsp"></jsp:include>
            <div class="container-fluid cuerpo"> 
                <div class="row">
                    <div class="col-xs-12 col-sm-offset-1 col-sm-10">
                        <div class="div-breadcrumb col-xs-12 col-sm-12">
                            <ul class="breadcrumb col-sm-8">
                                <li><a href="${contexto}/">Inicio</a></li>
                            <li><a href="${contexto}/JSP/perfilCliente.jsp">Perfil de usuario</a></li>
                            <li><a href="${contexto}/JSP/panelAdministrador.jsp">Panel de Administración</a></li>
                            <li class="active">Ofertar productos</li>

                        </ul>
                    </div>
                    <div class="cuerpo-perfil text-center col-sm-12 col-xs-12">
                        <h2>Ofertar productos</h2>
                        <table id="tabla">
                            <thead>
                            <tr>
                                <th id="usuario">Producto <i class="fa fa-sort-asc hidden"></i><i class="fa fa-sort-desc"></i></th>
                                <th>En oferta</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${productos}" var="producto">
                                <tr>
                                    <td class="producto text-left"><c:out value="${producto.denominacion}"/></td>
                                    <td><c:if test="${producto.oferta=='n'}">
                                            <input class="block" type="checkbox"/>  
                                        </c:if>
                                        <c:if test="${producto.oferta=='s'}">
                                            <input class="block" type="checkbox" checked="checked"/>  
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <div class="pagination">

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
            
            
            //icono de ascendente o descendente
            $("#usuario").click(function () {
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

            $("#usuario").click(function () {
                uno *= -1;
                var n = $(this).prevAll().length;
                sortTable(uno, n);
                pagination(20);
            });
            
            
            
            //funcion para bloquear un usuario a traves del controlador OperacionesAdmin
            $(document).ready(function() {
                $('.block').change(function(event) {
                    if($(this).prop('checked')){
                        var oferta='s';
                    } else {
                        var oferta = 'n';
                    }
                    var producto = $(this).parent().parent().find('.producto').html();
                    var ofertarProd = "";
                    $.post('${contexto}/OperacionesAdmin', {
                        oferta : oferta,
                        producto: producto,
                        ofertarProd : ofertarProd
                    }, function (responseText) {
                        $("#modalStock").modal("show");
                    });
                });
            });
    </script>
</body>
</html>