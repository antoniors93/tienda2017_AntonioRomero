<%-- 
    Document   : consultarProducto
    Created on : 13-ene-2017, 2:27:17
    Author     : Antonio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../INC/enlaces.jsp"></jsp:include>
            <title>Producto</title>
        </head>
        <body>
        <jsp:include page="../INC/cabecera.jsp"></jsp:include>
            <div class="container-fluid cuerpo"> 
                <div class="row">
                    <div class="cuerpo-prod col-xs-12 col-sm-offset-1 col-sm-10">
                        <div class="col-xs-12 col-sm-6" >

                            <div id="carousel-example-generic" class="carousel slide text-center carousel-prod" data-ride="carousel">
                                <ol class="carousel-indicators">
                                <c:set var="contador" value="0"/>
                                <c:forEach items="${producto.imagenes}" var="imagen">
                                    <li data-target="#carousel-example-generic" data-slide-to="${contador}"></li>
                                    <c:set var="contador" value="${contador+1}"/>
                                </c:forEach>   
                            </ol>
                            <!-- Wrapper for slides -->
                            <div class="carousel-inner " role="listbox">
                                <c:forEach items="${producto.imagenes}" var="imagen">
                                    <div class="item">
                                        <img class="imagen-prod" src="IMG/imagenesProductos/${imagen}"/>
                                    </div>
                                </c:forEach>    
                            </div>
                            <!-- Controls -->
                            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>        

                    </div>
                    <div class="prod-info col-xs-12 col-sm-6" >
                        <p>Producto: <c:out value="${producto.denominacion}"/><p>
                        <p>Descripción: <c:out value="${producto.descripcion}"/><p>
                        <p>Marca: <c:out value="${producto.marca}"/></p>
                        <p>Características:<p>
                        <ul class="lista-caracts">
                            <c:forEach items="${producto.caractsProd}" var="caract">
                                <li><c:out value="${caract.nombre}"/>: <c:out value="${caract.descripcion}"/></li>
                            </c:forEach>
                        </ul>
                        <p>Precio: <c:out value="${producto.precioUnitario} €"/></p>
                    </div>
                </div>
            </div>
        </div>
                                
<script>
    $(".carousel-indicators li:first").addClass("active");
    $(".carousel-inner .item:first").addClass("active");
</script>
    </body>
</html>
