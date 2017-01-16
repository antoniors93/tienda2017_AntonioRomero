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
                            <button class="btn btn-default" name="buscar" value="buscar" type="submit">Search</button>
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
                                    <input id="user-log" type="text" class="form-control" name="user-log" value="" placeholder="Username">                                        
                                </div>
                                <div class="input-group pass">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                    <input id="pass-log" type="password" class="form-control" name="pass-log" value="" placeholder="Password">                                        
                                </div>
                                <button id="log" class="btn btn-default btn-login">Login</button>
                            </div>  
                        </div>
                        <div class="registro">
                            <a href="#" data-toggle="modal" data-target="#login-modal" style="color:white;">Check in</a>                            
                        </div>                       
                    </div>                   
                </c:if>                
                <c:if test="${login!=null}">
                    <div class="carrito-perfil pull-right text-center">
                        <div class="enlace-perfil col-sm-10">
                            <ul class="text-left">
                                <li><i class="fa fa-address-card" aria-hidden="true"></i> <a href="#"><c:out value="Perfil de: ${login.userName}"/></a><li>
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
                                <h1>Create Your Account</h1><br>
                                <div id="resultado"></div>
                                <input id="user-reg" type="text" name="user-reg" placeholder="Username" required>
                                <input id="pass-reg" type="password" name="pass-reg" placeholder="Password" required>
                                <input id="reg" type="button" name="input-reg" class="login loginmodal-submit" value="Sign in"/>
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
                        var user = $('#user-reg').val();
                        var pass = $('#pass-reg').val();
                        $.post('Registro', {
				user : user,
				pass: pass
			}, function(responseText) {
                            if(responseText == 'SUCCESS'){
                                $('.loginmodal-container input').hide();
                                $('#resultado').hide();
                                $('.loginmodal-container h1').text("Bienvenido "+user);
                                $('.loginmodal-container h1').append("<input type='button' class='loginmodal-submit aceptar-bienvenida' value='Aceptar' style='margin-top: 2rem;'/>");
                                $('.aceptar-bienvenida').click(function(){
                                    location.reload();
                                });
                            }else if(responseText == 'FAILURE'){
                            $('#resultado').html("<font color='red'>Username incorrecto</font>");
                            }
			});
                });
        });
    </script>
    <script>
        $(document).ready(function() {
                $('#log').click(function(event) {
                    var user = $('#user-log').val();
                    var pass = $('#pass-log').val();
                   $.post('Login', {
                            user : user,
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
    
                    