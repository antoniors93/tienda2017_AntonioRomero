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
                            <form id="signin" class="navbar-form navbar-right" role="form" method="post">
                                <div class="input-group user">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                    <input id="email" type="text" class="form-control" name="user" value="" placeholder="Username">                                        
                                </div>
                                <div class="input-group pass">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                    <input id="password" type="password" class="form-control" name="pass" value="" placeholder="Password">                                        
                                </div>
                                <button type="submit" class="btn btn-default btn-login">Login</button>
                            </form>  
                        </div>
                        <div class="registro">
                            <a href="#" style="color:#e2e2e2;">Check in</a>
                        </div>                                 
                    </div>                   
                </c:if>
            </div>
        </div>
    </div>
</header>