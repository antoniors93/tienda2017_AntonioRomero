<%-- 
    Document   : actualizarCliente
    Created on : 21-ene-2017, 23:26:31
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
                            <li class="active">Actualizar mis datos</li>
                        </ul>
                    </div>
                    <div class="cuerpo-perfil col-sm-12 col-xs-12">
                        <div class="info-perfil col-sm-12 col-xs-12">
                            <div class="col-sm-offset-2 col-sm-8 col-xs-12 text-center">
                                <h2>Actualización de datos</h2>
                            </div>
                            <div class="col-sm-2 col-xs-12 text-center">
                                <i class="fa fa-user-circle fa-4x pull-right" aria-hidden="true"></i>
                            </div>
                            <div class="col-xs-12"></div>
                            <div class="lista-datos-pers col-sm-6">
                                <h4 class="text-center">Datos personales</h4>
                                <form action="${contexto}/ActualizarCliente" method="post">
                                    <ul class="lista-update-datos">
                                        <li><label>Nombre: </label><input type="text" name="nombre" value="${cliente.nombre}" pattern="^([A-Z]{1}[a-zñáéíóú]+[\s]*)+$" required/></li>
                                        <li><label>Apellidos: </label><input type="text" name="apellidos" value="${cliente.apellidos}" pattern="^([A-Z]{1}[a-zñáéíóú]+[\s]*)+$" required/></li>
                                        <li><label>NIF: </label><input type="text" name="nif" value="${cliente.NIF}" pattern="\d{8}[A-Z]$"required/></li>
                                        <li><label>Fecha de nacimiento: </label><input type="date" name="fechaNac" value="${cliente.fechaNacimiento}" required</li>
                                    </ul>
                                    <div class="btn-update-cliente col-xs-12 text-center">
                                        <input type="submit" name="datos" value="Modificar">
                                    </div>
                                </form>
                            </div>
                            <div class="col-sm-6 lista-datos-direccion">
                                <h4 class="text-center">Nueva dirección de envío:</h4>
                                <form action="${contexto}/ActualizarCliente" method="post">
                                    <ul class="lista-update-datos">                                   
                                        <li><label>Vía: </label><input type="text" name="nombreDireccion" value="${direccion.nombreDireccion}" required/></li>
                                        <li><label>Dirección: </label><input type="text" name="direccion" value="${direccion.direccion}" required/></li>    
                                        <li><label>Teléfono: <input type="tel" name="telefono" pattern="^[9|8|7|6]\d{8}$" required/></label>
                                    </ul>
                                    <div class="localizacion col-sm-12 col-xs-12 display-flex">
                                        <ul>
                                            <li><label>Provincia</label>
                                                <select name="provincia" id="provincias" required>
                                                    <option>Seleccione su provincia</option>
                                                </select>
                                            </li>
                                            <li><label>Localidad</label>
                                                <select name="pueblo" id="pueblos" required>
                                                </select>
                                            </li>
                                            <li><label>Código postal</label>
                                                <select name="codigoPostal" id="codPostal" required>
                                                </select>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="btn-update-cliente col-xs-12 text-center">
                                        <input class="btn-update-cliente" type="submit" name="direccion" value="Añadir">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div id="modalMensaje" class="modal fade" tabindex="-1" role="dialog">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h3>Aviso</h3>
                                </div>
                                <div class="modal-body">
                                    <h4 style="color:black">Facilita la siguiente información para poder realizar tus compras.</h4>   
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
            //script que muestra el modal si venimos del carrito y no estamos registrados
            $(document).ready(function() {
                if(${comprar}){                    
                    $("#modalMensaje").modal("show");
                }
            });
        </script>
            <script>
                //script que carga la select de provincias
            $(document).ready(function() {
                var provs="cargarProvs";
                $.post('${contexto}/Localidades', {
                    provs : provs
                }, function(response) {
                    var select = $('#provincias');
                        $.each(response, function (index, value) {
                            $('<option>').val(value.IdProvincia).text(value.NombreProvincia).appendTo(select);
                        });
                    });
                });
        </script>
        <script>
            //script que carga los pueblos de una provincia
            $(document).ready(function () {
                $('#provincias').change(function (event) {
                    var idProvincia = $(this).val();
                    $.post('${contexto}/Localidades', {
                        idProvincia: idProvincia
                    }, function (response) {
                        var select = $('#pueblos');
                        select.find('option').remove();
                        $.each(response, function (index, value) {
                            $('<option>').val(value.NombrePueblo).text(value.NombrePueblo).appendTo(select);
                        });
                    });
                });
            });
        </script>
        <script>
            //script que carga los cp de un pueblo
            $(document).ready(function () {

                $('#pueblos').change(function (event) {
                    var nombrePueblo = $(this).val();
                    $.post('${contexto}/Localidades', {
                        nombrePueblo: nombrePueblo
                    }, function (response) {
                        var select = $('#codPostal');
                        select.find('option').remove();
                        $.each(response, function (index, value) {
                            $('<option>').val(value.IdPueblo).text(value.CodigoPostal).appendTo(select);
                        });
                    });
                });
            });
        </script>
    </body>
</html> 
