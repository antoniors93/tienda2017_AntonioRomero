<%-- 
    Document   : bloquearUsuarios
    Created on : 30-ene-2017, 12:18:35
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
                            <ul class="breadcrumb col-sm-8">
                                <li><a href="${contexto}/">Inicio</a></li>
                            <li><a href="${contexto}/JSP/perfilCliente.jsp">Perfil de usuario</a></li>
                            <li><a href="${contexto}/JSP/panelAdministrador.jsp">Panel de Administración</a></li>
                            <li class="active">Bloquear usuarios</li>

                        </ul>
                    </div>
                    <div class="cuerpo-perfil text-center col-sm-12 col-xs-12">
                        <h2>Bloquear usuarios</h2>
                        <table>
                            <tr>
                                <th>Usuario</th>
                                <th>Bloqueado</th>
                            </tr>
                            <c:forEach items="${usuarios}" var="usuario">
                                <tr>
                                    <td class="email"><c:out value="${usuario.email}"/></td>
                                    <td><c:if test="${usuario.bloqueado=='n'.charAt(0)}">
                                            <input class="block" type="checkbox"/>  
                                        </c:if>
                                        <c:if test="${usuario.bloqueado=='s'.charAt(0)}">
                                            <input class="block" type="checkbox" checked="checked"/>  
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
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
            $(document).ready(function() {
                $('.block').change(function(event) {
                    if($(this).prop('checked')){
                        var bloqueado='s';
                    } else {
                        var bloqueado = 'n';
                    }
                    var email = $(this).parent().parent().find('.email').html();
                    var blockUser = "";
                    $.post('${contexto}/OperacionesAdmin', {
                        bloqueado: bloqueado,
                        email: email,
                        blockUser: blockUser
                    }, function (responseText) {
                        $("#modalStock").modal("show");
                    });
                });
            });
    </script>
</body>
</html>
