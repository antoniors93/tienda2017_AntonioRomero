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
                            <li><a href="">Productos más vendidos</a></li>
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
                    <ol class="carousel-indicators">                        
                        <c:set var="contador" value="0"/>
                        <c:forEach items="${productos}" var="producto">
                            <c:if test="${producto.oferta=='s'}">
                                <li data-target="#carousel-example-generic" data-slide-to="${contador}"></li>
                                    <c:set var="contador" value="${contador+1}"/>                                                                
                                </c:if>

                        </c:forEach>                                                                                         
                    </ol>
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner " role="listbox">
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
            </div>               

        </div>
    </div>
    <jsp:include page="INC/pie.jsp"></jsp:include>
    <script>
        $(".carousel-indicators li:first").addClass("active");
        $(".carousel-inner .item:first").addClass("active");
        
        
        $(".categorias").hover(function () {
            if ($(".nav-secundario").hasClass("hidden")) {
                $(".nav-secundario").removeClass("hidden");
            } else {
                $(this).css("border-top","none");
                $(".nav-secundario").addClass("hidden");
            }
        });

    </script>                   
</body>
</html>
