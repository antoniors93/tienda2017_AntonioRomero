<%-- 
    Document   : cambiarPassword
    Created on : 27-ene-2017, 11:58:22
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
                            <li class="active">Cambiar contraseña</li>
                        </ul>
                    </div>
                    <div class="cuerpo-perfil col-sm-12 col-xs-12">
                        <div class="info-perfil col-sm-12 col-xs-12">
                            <div class="text-center">
                                <h2>Actualización de contraseña</h2>
                            </div>
                            <div class="lista-datos-pers col-sm-offset-3 col-sm-6">
                                    <ul class="lista-update-datos">
                                        <li><label>Nueva contraseña: </label><input type="password" id="pass1" required/></li>
                                        <li><label>Repita nueva contrseña: </label><input type="password" id="pass2" required/></li>                                       
                                    </ul>
                                    <div class="btn-update-cliente col-xs-12 text-center">
                                        <input type="button" id="pass" value="Modificar">
                                    </div>
                            </div>
                        </div>
                    </div>
                    <div id="modalMensaje" class="modal fade" tabindex="-1" role="dialog">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h3>Mensaje</h3>
                                </div>
                                <div class="modal-body">
                                    <h4 style="color:black">Las contraseñas deben coincidir.</h4>   
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
                //script que comprueba si las password coinciden y llama al servlet que actualiza la password en la bd
                $(document).ready(function () {

                    $('#pass').click(function (event) {
                        var pass1 = $('#pass1').val();
                        var pass2 = $('#pass2').val();
                    if(pass1==pass2){
                        $.post('${contexto}/ActualizarCliente', {
                            pass1 : pass1
                        }, function (responseText) {
                            $('.modal-body h4').html('Contraseña modificada correctamente.');
                            $('#modalMensaje').modal("show");
                        });
                    }else{
                        $('#modalMensaje').modal("show");
                    }
                    });
                });
        </script>
    </body>
</html>
