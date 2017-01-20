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
                    <div class="col-xs-12 col-sm-offset-1 col-sm-10">
                        <div class="div-breadcrumb col-xs-12 col-sm-12">
                            <ul class="breadcrumb col-sm-6">
                                <li><a href="${contexto}/">Inicio</a></li>
                                <c:if test="${param.opcion!='slide'}">
                                <li>
                                    <c:if test="${param.opcion=='all'}">
                                        <a href="${contexto}/JSP/mostrarProductos.jsp?opcion=all"><c:out value="Catálogo de productos"/></a>
                                    </c:if>
                                    <c:if test="${param.opcion=='s'}">
                                        <a href="${contexto}/JSP/mostrarProductos.jsp?opcion=s"><c:out value="Productos en oferta"/></a>
                                    </c:if>
                                    <c:if test="${param.palabra!=null}">
                                        <a href="${contexto}/JSP/mostrarProductos.jsp?palabra=${param.palabra}"><c:out value="Búsqueda"/></a>
                                    </c:if>
                                    <c:if test="${param.cat!=null}">
                                        <a href="${contexto}/JSP/mostrarProductos.jsp?cat=${param.cat}"><c:out value="${param.cat}"/></a>
                                    </c:if>                               
                                </li>
                            </c:if>
                            <li class="active">ConsultarProducto</li>                           
                        </ul>
                    </div>
                    <div class="cuerpo-prod col-xs-12 col-sm-12">                       
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
                                <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev" style="background: linear-gradient(-90deg, rgba(255,255,255,0), rgba(105,193,169,0.7));">
                                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next" style="background: linear-gradient(-90deg, rgba(105,193,169,0.7), rgba(255,255,255,0));">
                                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>
                            <div class="btn-comprar text-center">
                                <c:if test="${login!=null}">
                                    <button id="añadir-producto" class="enlace-btn-comprar">Añadir al carrito</button>
                                </c:if>
                            </div>
                        </div>
                        <div class="prod-info col-xs-12 col-sm-6" >
                            <h3 class="titulo-prod-info"><c:out value="${producto.denominacion}"/></h3>
                            <p>Descripción: <c:out value="${producto.descripcion}"/><p>
                            <p>Marca: <c:out value="${producto.marca}"/></p>
                            <p>Características:<p>
                            <ul class="lista-caracts">
                                <c:forEach items="${producto.caractsProd}" var="caract">
                                    <li><c:out value="${caract.nombre}"/>: <c:out value="${caract.descripcion}"/></li>
                                    </c:forEach>
                            </ul>
                            <p class="precio"><c:out value="${producto.precioUnitario} €"/></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="../INC/pie.jsp"></jsp:include>                        
        <script>            
            $(".carousel-indicators li:first").addClass("active");
            $(".carousel-inner .item:first").addClass("active");
        </script>
        <script>
        $(document).ready(function() {
                $('#añadir-producto').click(function(event) {
                    var idProducto = ${producto.idProducto};
                   $.post('${contexto}/Compra', {
                            idProducto : idProducto
			}, function(responseText) {
                            $('.numero-carrito').text(responseText);
			});
                });
        });
    </script>
    </body>
</html>
