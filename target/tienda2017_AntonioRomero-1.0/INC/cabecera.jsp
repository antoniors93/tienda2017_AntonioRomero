<%-- 
    Document   : cabecera
    Created on : 07-ene-2017, 20:07:12
    Author     : Antonio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<header>
    <div class="cabecera container-fluid">
        <div class="row">

            <div class="col-xs-12 col-sm-3">
                <a href="${contexto}/"><img class="img-responsive logo" src="${contexto}/IMG/logo.png"/></a>
            </div>

            <div class="col-xs-12 col-sm-offset-1 col-sm-4">
                <form action="${contexto}/JSP/mostrarProductos.jsp" method="post">
                    <div class="buscador input-group">
                        <input type="text" name="palabra" class="form-control">
                        <span class="input-group-btn">
                            <button class="btn btn-default" name="buscar" value="buscar" type="submit">Buscar</button>
                        </span>
                    </div>
                </form>
            </div>

            <div class="col-xs-12 col-sm-4">
                <c:if test="${login==null}">
                    <div class="log-registro pull-right text-center">                        
                        <div class="login">                           
                            <div id="signin" class="navbar-form navbar-right">
                                <div id="log-fail" style="height:2rem;"></div>
                                <div class="input-group user">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                    <input id="email-log" type="text" class="form-control" name="email-log" value="" placeholder="Email">                                        
                                </div>
                                <div class="input-group pass">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                    <input id="pass-log" type="password" class="form-control" name="pass-log" value="" placeholder="Password">                                        
                                </div>
                                <button id="log" class="btn btn-default btn-login">Login</button>
                            </div>  
                        </div>
                        <div class="registro">
                            <a href="#" data-toggle="modal" data-target="#login-modal" style="color:white;">Registrarse</a>                            
                        </div>                       
                    </div>                   
                </c:if>                
                <c:if test="${login!=null}">
                    <div class="carrito-perfil pull-right text-center">
                        <div class="enlace-perfil col-sm-10">
                            <ul class="text-left">
                                <li><i class="fa fa-address-card" aria-hidden="true"></i> <a href="${contexto}/JSP/perfilCliente.jsp"><c:out value="${login.email}"/></a><li>
                                <li><i class="fa fa-window-close" aria-hidden="true"></i> <a id="cerrar-sesion" href="${contexto}/CerrarSesion">Cerrar sesión</a></li>
                            </ul>
                        </div>
                        <div class="enlace-carrito col-sm-2">
                            <a href="#"><i class="fa fa-shopping-cart fa-3x" aria-hidden="true"><div class="fa" style="font-size: 26px;"></div></i></a>
                        </div>
                    </div>
                </c:if>
                    <div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                        <div class="modal-dialog">
                            <div class="loginmodal-container">
                                <h1>Crea tu cuenta</h1><br>
                                <div id="resultado"></div>
                                <input id="email-reg" type="text" name="email-reg" placeholder="Email" required>
                                <input id="pass-reg" type="password" name="pass-reg" placeholder="Password" required>
                                <input id="reg" type="button" name="input-reg" class="login loginmodal-submit" value="Registrarme"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</header>
    <script>
        $(document).ready(function() {
                $('#reg').click(function(event) {
                        var email = $('#email-reg').val();
                        var pass = $('#pass-reg').val();
                        $.post('${contexto}/Registro', {                           
				email : email,
				pass: pass
			}, function(responseText) {
                            if(responseText == 'SUCCESS'){
                                $('.loginmodal-container input').hide();
                                $('#resultado').hide();
                                $('.loginmodal-container h1').text("Bienvenido");
                                $('.loginmodal-container h1').append("<input type='button' class='loginmodal-submit registrarse1' value='Registrarme ahora' style='margin-top: 2rem;'/>");
                                $('.loginmodal-container h1').append("<input type='button' class='loginmodal-submit registrarse2' value='Registrarme más adelante' style='margin-top: 2rem;'/>");
                                $('.registrarse2').click(function(){
                                    location.reload();
                                });
                                $('.registrarse1').click(function(){
                                    location.href="${contexto}/JSP/perfilCliente.jsp";
                                });
                            }else if(responseText == 'FAILURE'){
                            $('#resultado').html("<font color='red'>Email no válido</font>");
                            }else if(responseText == 'INCOMPLETE'){
                            $('#resultado').html("<font color='red'>Rellene los campos</font>");    
                            }
			}); 
                });
        });
    </script>
    <script>
        $(document).ready(function() {
                $('#log').click(function(event) {
                    var email = $('#email-log').val();
                    var pass = $('#pass-log').val();
                   $.post('${contexto}/Login', {
                            email : email,
                            pass: pass
			}, function(responseText) {
                            if(responseText == 'SUCCESS'){
                                    location.reload();
                            }else if(responseText == 'FAILURE'){
                            $('#log-fail').html("<font color='red'>Login incorrecto</font>");
                            }
			});
                });
        });
    </script>
    
                    