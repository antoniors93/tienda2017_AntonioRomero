<%-- 
    Document   : index
    Created on : 07-ene-2017, 18:46:17
    Author     : Antonio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contexto" scope="session" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<head>
    <title>Inicio</title>
    <jsp:include page="INC/enlaces.jsp"></jsp:include>
    </head>
    <body>
    <jsp:include page="INC/cabecera.jsp"></jsp:include>
        <div class="container-fluid cuerpo"> 
            <div class="row">
                <div class="col-xs-12 col-sm-3">
                    <div class="menu-nav">
                        <ul class="nav-principal">
                            <li><a href="${contexto}/JSP/mostrarProductos.jsp?opcion=all">Catálogo de productos</a></li>
                        <li><a href="${contexto}/JSP/mostrarProductos.jsp?opcion=s">Productos en oferta</a></li>
                        <li><a href="${contexto}/JSP/mostrarProductos.jsp?opcion=v">Productos más vendidos</a></li>
                        <li class="categorias">Categorías
                            <ul class="nav-secundario hidden">
                                <c:forEach items="${categorias}" var="categoria">
                                    <li><a href="${contexto}/JSP/mostrarProductos.jsp?cat=${categoria.nombre}"><c:out value="${categoria.nombre}"/></a></li>
                                    </c:forEach>
                            </ul> 
                        </li>
                    </ul>
                </div>
            </div>

            <div class="col-xs-12 col-sm-9">
                <div id="carousel-example-generic" class="carousel slide text-center carousel-index" data-ride="carousel">
                    <h3 class="titulo-slide">Ofertas</h3>
                    <ol class="carousel-indicators indicators1">                        
                        <c:set var="contador" value="0"/>
                        <c:forEach items="${productos}" var="producto">
                            <c:if test="${producto.oferta=='s'}">
                                <li data-target="#carousel-example-generic" data-slide-to="${contador}"></li>
                                    <c:set var="contador" value="${contador+1}"/>                                                                
                            </c:if>
                        </c:forEach>                                                                                         
                    </ol>
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner inner1" role="listbox">
                        <c:forEach items="${productos}" var="producto">
                            <c:if test="${producto.oferta=='s'}">
                                <div class="item">
                                    <a href="${contexto}/ConsultarProducto?idProd=${producto.idProducto}&opcion=slide">
                                        <img class="imagen-idx" src="IMG/imagenesProductos/${producto.imagen}"/>
                                    </a>
                                    <div class="carousel-caption">
                                        <h4 class="titulo-producto-slide"><c:out value="${producto.denominacion}"/></h4>
                                    </div>
                                </div>
                            </c:if>
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

                <div id="myCarousel" class="carousel slide text-center carousel-index" data-ride="carousel">
                    <h3 class="titulo-slide">Más vendidos</h3>
                    <!-- Indicators -->
                    <ol class="carousel-indicators indicators2">
                        <c:set var="contadorv" value="0"/>
                        <c:forEach items="${masVendidos}" var="vendido">
                            <c:forEach items="${productos}" var="producto">
                                <c:if test="${producto.idProducto==vendido}">
                                    <li data-target="#myCarousel" data-slide-to="${contadorv}"></li>
                                    <c:set var="contadorv" value="${contadorv+1}"/> 
                                </c:if>
                            </c:forEach>
                        </c:forEach>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner inner2" role="listbox">
                        <c:forEach items="${masVendidos}" var="vendido">
                            <c:forEach items="${productos}" var="producto">
                                <c:if test="${producto.idProducto==vendido}">
                                    <div class="item">
                                        <a href="${contexto}/ConsultarProducto?idProd=${producto.idProducto}&opcion=slide">
                                            <img class="imagen-idx" src="IMG/imagenesProductos/${producto.imagen}"/>
                                        </a>
                                        <div class="carousel-caption">
                                        <h4 class="titulo-producto-slide"><c:out value="${producto.denominacion}"/></h4>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </c:forEach>
                        
                    </div>

                    <!-- Left and right controls -->
                    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev" style="background: linear-gradient(-90deg, rgba(255,255,255,0), rgba(105,193,169,0.7));">
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next" style="background: linear-gradient(-90deg, rgba(105,193,169,0.7), rgba(255,255,255,0));">
                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
                
                        <c:set var="contadorStock" value="0"/>
                        <c:forEach var="producto" items="${productos}">
                            <c:if test="${producto.stock<producto.stockMinimo}">
                                <c:set var="contadorStock" value="${contadorStock+1}"/>
                            </c:if>
                        </c:forEach>        
                <div id="modalStock" class="modal fade" tabindex="-1" role="dialog">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h3>Aviso</h3>
                                </div>
                                <div class="modal-body">
                                    <h4 style="color:black">Productos bajo stock mínimo.</h4>   
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
    <jsp:include page="INC/pie.jsp"></jsp:include>
    <script>
            $(document).ready(function() {
                if(${contadorStock>0 && login.tipo eq 'a'.charAt(0)}){                    
                    $("#modalStock").modal("show");
                }
            });
    </script>
    <script>
        $(".indicators1 li:first").addClass("active");
        $(".inner1 .item:first").addClass("active");
        $(".indicators2 li:first").addClass("active");
        $(".inner2 .item:first").addClass("active");


        $(".categorias").hover(function () {
            if ($(".nav-secundario").hasClass("hidden")) {
                $(".nav-secundario").removeClass("hidden");
            } else {
                $(this).css("border-top", "none");
                $(".nav-secundario").addClass("hidden");
            }
        });

    </script>
</body>
</html>
