<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="layout" content="main">
    <title>Pantalla de Inicio</title>

    <style>
        body {
            background: url("${resource(dir: 'images', file: 'apli/cosedora.png')}") no-repeat center center fixed;
            background-size: cover;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        .inicio-container {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 40px;
            border-radius: 16px;
            text-align: center;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        }

        h1 {
            color: #333;
            font-size: 32px;
            margin-bottom: 30px;
        }

        .btn-group a {
            margin: 6px;
            min-width: 140px;
        }
    </style>
</head>
<body>

<div class="inicio-container">
    <h1>Pantalla de inicio del Sistema</h1>

    <div class="btn-group d-flex flex-wrap justify-content-center">
        <a href="${createLink(controller: 'persona', action: 'list')}" class="btn btn-warning">Usuario</a>
        <a href="${createLink(controller: 'producto', action: 'list')}" class="btn btn-success">Producto</a>
        <a href="${createLink(controller: 'categoria', action: 'list')}" class="btn btn-success">Categoría</a>
        <a href="${createLink(controller: 'factura', action: 'list')}" class="btn btn-success">Facturas</a>
        <a href="${createLink(controller: 'detalleFactura', action: 'list')}" class="btn btn-success">Detalle Facturas</a>
        <a href="${createLink(controller: 'login', action: 'logout')}" class="btn btn-info">Salir del Sistema</a>
    </div>
</div>

</body>
</html>
