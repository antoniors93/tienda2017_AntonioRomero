<%-- 
    Document   : pie
    Created on : 15-ene-2017, 3:04:39
    Author     : Antonio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<footer>
    <div class="pie container-fluid">
        <div class="row">
            <div class="info-pie text-center col-xs-12 col-sm-12">
                <div class="col-xs-12 col-sm-3">
                    <h4>Quiénes somos</h4>
                    <a href="#">Nuestra tienda</a>
                    <br/>
                    <a href="#">Aviso legal</a>
                </div>
                <div class="col-xs-12 col-sm-3">
                    <h4>Contactar</h4>
                    <a href="mailto:antonio.93.rs@gmail.com">Envianos un e-mail.</a>
                    <p>620 15 78 42</p>
                </div>
                <div class="col-xs-12 col-sm-3">
                    <h4>Trabaja con nosotros</h4>
                    <a id="curriculum" href="" data-toggle="modal" data-target="#myModal">Envianos tu curriculum.</a>
                </div>

                <div id="myModal" class="modal fade" tabindex="-1" role="dialog">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h3 class="modal-title">Trabaja con nosotros</h3>
                            </div>
                            <form>
                                <div class="modal-body text-left" style="margin-left: 2rem;">
                                    <label>Email:</label>
                                    <input type="email" required/>
                                    <br/><br/>
                                    <label>Nombre:</label>
                                    <input type="text" pattern="^([A-Z]{1}[a-zñáéíóú]+[\s]*)+$" required/>
                                    <br/><br/>
                                    <label>Apellidos:</label>
                                    <input type="text" pattern="^([A-Z]{1}[a-zñáéíóú]+[\s]*)+$" required/>
                                    <br/><br/>
                                    <label>Edad:</label>
                                    <input type="number" min="18" max="80" step="1" value="18" required/>
                                    <br/><br/>
                                    <label>Adjunta tu curriculum:</label>
                                    <input type="file" required/>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                    <button type="submit" class="btn btn-default">Guardar cambios</button>
                                </div>
                            </form>

                        </div><!-- /.modal-content -->
                    </div><!-- /.modal-dialog -->
                </div>

                <div class="col-xs-12 col-sm-3">
                    <h4>Síguenos</h4>
                    <p><a target="_blank" href="https://www.facebook.com"><i class="fa fa-facebook-square fa-3x social"></i></a>  
                        <a target="_blank" href="https://twitter.com"><i class="fa fa-twitter-square fa-3x social"></i></a>  
                        <a target="_blank" href="https://plus.google.com"><i class="fa fa-google-plus-square fa-3x social"></i></a>  
                        <a href="mailto:antonio.93.rs@gmail.com"><i class="fa fa-envelope-square fa-3x social"></i></a> 
                    <p>
                </div>
            </div>
        </div>                  
    </div>
</footer>
