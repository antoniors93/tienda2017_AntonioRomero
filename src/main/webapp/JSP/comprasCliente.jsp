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
                        <h3>Compras realizadas</h3>
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
