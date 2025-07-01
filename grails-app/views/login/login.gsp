<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="login">

    <title>Login</title>

    <style>
    body {
        margin: 0;
        padding: 0;
        background: linear-gradient(to right, #e0ecf8, #f2f6ff);
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .login-container {
        background: white;
        padding: 40px;
        border-radius: 12px;
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
        width: 100%;
        max-width: 400px;
        text-align: center;
    }

    .login-container h2 {
        color: #0073b1;
        margin-bottom: 20px;
    }

    .login-container img {
        max-width: 120px;
        margin-bottom: 20px;
    }

    .form-group {
        margin-bottom: 20px;
        text-align: left;
    }

    .form-group label {
        display: block;
        margin-bottom: 6px;
        color: #333;
        font-weight: 600;
    }

    .form-group input {
        width: 100%;
        padding: 10px 12px;
        border: 1px solid #ccc;
        border-radius: 8px;
        font-size: 15px;
    }

    .btn-submit {
        width: 100%;
        padding: 12px;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 8px;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    .btn-submit:hover {
        background-color: #0056b3;
    }

    .message {
        margin-bottom: 20px;
        background-color: #ffe6e6;
        color: #d8000c;
        padding: 10px;
        border-radius: 8px;
        font-weight: bold;
    }
</style>


</head>

<body>

<div style="text-align: center; margin-top: 22px; height: ${(flash.message) ? '640' : '570'}px;" class="well">

    <h1 class="titl" style="font-size: 24px; color: #06a">Sistema de Administrador</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <div class="dialog ui-corner-all" style="height: 160px;padding: 10px;width: 910px;margin: auto;margin-top: 5px">
            <div>
                <asset:image src="apli/cosedora.png" style="padding: 30px; height: 180px"/>
            </div>
</div>
    <div id="cargando" class="text-center hidden">
        %{--<img src="${resource(dir: 'images', file: 'spinner32.gif')}" width="32px" height="32px"/>--}%
    </div>

    <div style="border-style: solid; border-width: thin; margin-top: 20px; width: 400px; margin-left: auto; margin-right: auto;">
                %{--<g:form name="frmLogin" action="validar" style="padding: 10px">--}%
                    %{--<div class="row">--}%
                        %{--<div class="col-md-5" style="text-align: right">--}%
                            %{--<label class="col-md-5" for="login">Usuario</label>--}%
                        %{--</div>--}%

                        %{--<div class="col-md-5 controls">--}%
                            %{--<input name="login" id="login" type="text" class="form-control required"--}%
                                   %{--placeholder="Usuario" required autofocus >--}%
                        %{--</div>--}%
                    %{--</div>--}%

                    %{--<div class="row" style="margin-top: 20px">--}%
                        %{--<label class="col-md-5" for="pass">Contraseña</label>--}%

                        %{--<div class="controls col-md-5">--}%
                            %{--<input name="pass" id="pass" type="password" class="form-control required"--}%
                                   %{--placeholder="Contraseña" required style="width: 160px;">--}%
                        %{--</div>--}%
                    %{--</div>--}%

                    %{--<div class="divBtn" style="width: 100%; margin-top: 20px">--}%
                        %{--<a href="#" class="btn btn-primary btn-lg btn-block" id="btn-login"--}%
                           %{--style="width: 140px; margin: auto">--}%
                            %{--<i class="fa fa-lock"></i> Validar--}%
                        %{--</a>--}%
                    %{--</div>--}%

                %{--</g:form>--}%
    </div>


    <div style="width: 100%;height: 60px;float: left; margin-bottom:5px; margin-top: 30px; text-align: center">
            <a href="#" id="ingresar" class="btn btn-info"
               style="width: 120px; margin: auto">
                Ingresar <i class="fas fa-user-times"></i></a>
        </div>
    </div>


    <!-- Modal -->
    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>

                </div>
            <h4 class="modal-title" style="text-align: center">Ingresar al Sistema</h4>
                <div class="modal-body">

                    <g:form name="frmLogin" action="validar" style="padding: 10px">
                        <div class="row">
                            <div class="col-md-5" style="text-align: right">
                                <label class="col-md-5" for="login">Usuario</label>
                            </div>

                            <div class="col-md-5 controls">
                                <input name="login" id="login" type="text" class="form-control required"
                                       placeholder="Usuario" required autofocus >
                            </div>
                        </div>

                        <div class="row" style="margin-top: 20px; text-align: right">
                            <label class="col-md-5" for="pass">Contraseña</label>

                            <div class="controls col-md-5">
                                <input name="pass" id="pass" type="password" class="form-control required"
                                       placeholder="Contraseña" required style="width: 160px;">
                            </div>
                        </div>

                        <div class="divBtn" style="width: 100%; margin-top: 20px">
                            <a href="#" class="btn btn-primary btn-lg btn-block" id="btn-login"
                               style="width: 140px; margin: auto">
                                <i class="fa fa-lock"></i> Validar
                            </a>
                        </div>

                    </g:form>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" id="btnCerrar">Cerrar</button>
                </div>
            </div>

        </div>
    </div>



<script type="text/javascript">
    var $frm = $("#frmLogin");
    var recargar = true

    function doLogin() {
        var usuario = $("#login").val();
        console.log('usuario', usuario);
        if (usuario) {
            $("#cargando").removeClass('hidden');
            $(".btn-login").replaceWith($("#cargando"));
            $("#frmLogin").submit();
        }
    }


    $(function () {

        $("#ingresar").click(function () {
            var initModalHeight = $('#modal-ingreso').outerHeight();
            $("#modalBody").css({'margin-top': ($(document).height() / 2 - 135)}, {'margin-left': $(window).width() / 2});
            $("#modal-ingreso").modal('show');
            setTimeout(function () {
                $("#login").focus();
            }, 500);

        });

        $("#btnOlvidoPass").click(function () {
            $("#recuperarPass-dialog").modal("show");
            $("#modal-ingreso").modal("hide");
        });

        // $frm.validate();
        $("#btn-login").click(function () {
            console.log('hace Login');
            doLogin();
        });

        $("#btn-pass").click(function () {
            doPass();
        });

        $("input").keyup(function (ev) {
            if (ev.keyCode == 13) {
                doLogin();
            }
        })

        // window.onload = timedRefresh(5000);
        $('#ingresar').on( "click", function() {
            $('#myModal').modal('show');
        });

        $('#btnCerrar').on( "click", function() {
            console.log('cerrar');
        });


    });

</script>

</body>
</html>