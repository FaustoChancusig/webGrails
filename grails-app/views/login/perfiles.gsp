<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="login">
    <title>Perfil</title>

    <style type="text/css">
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

        .container-perfil {
            background: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }

        .container-perfil h3 {
            color: #0073b1;
            margin-bottom: 15px;
        }

        .form-signin select {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
        }

        .btn-login {
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            margin-top: 20px;
            transition: background-color 0.3s;
            display: block;
        }


        .btn-login:hover {
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

        .hidden {
            visibility: hidden;
        }
    </style>
</head>

<body>

<div class="container-perfil">
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <h3>Seleccione su perfil de trabajo</h3>
    <div>
        <i class="fa fa-4x fa-users text-success"></i>
    </div>

    <g:form name="frmLogin" action="savePer" class="form-signin well" role="form" style="margin-top: 30px;">
        <g:select name="prfl" class="form-control" from="${perfilesUsr}" optionKey="id" optionValue="nombre"/>
        <div class="divBtn">
        <button type="submit" class="btn-login" id="btnPerfiles">
            <i class="fa fa-lock"></i> Entrar
        </button>
    </div>
    </g:form>

    <div id="cargando" class="text-center hidden" style="margin-top: 20px;">
        <img src="${resource(dir: 'images', file: 'spinner32.gif')}" alt='Cargando...' width="32px" height="32px"/>
    </div>
</div>

<script type="text/javascript">
    var $frm = $("#frmLogin");

    function doLogin() {
        $("#cargando").removeClass('hidden');
        $("#btnPerfiles").replaceWith($("#cargando"));
        $("#frmLogin").submit();
    }

    $(function () {
        $("#btnPerfiles").click(function () {
            doLogin();
        });
        $("input").keyup(function (ev) {
            if (ev.keyCode == 13) {
                doLogin();
            }
        })
    });
</script>

</body>
</html>
