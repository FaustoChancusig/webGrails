<%@ page contentType="text/html;charset=UTF-8" %>

<table class="table table-condensed table-bordered table-striped table-hover">
    <thead>
    <tr>
        <th style="width: 10%">ID</th>
        <th style="width: 20%">Factura</th>
        <th style="width: 20%">Producto</th>
        <th style="width: 10%">Cantidad</th>
        <th style="width: 15%">Precio Venta</th>
        <th style="width: 25%">Acciones</th>
    </tr>
    </thead>
    <tbody>
    <g:if test="${detalleFacturaList?.size() > 0}">
        <g:each in="${detalleFacturaList}" var="detalle">
            <tr data-id="${detalle?.id}">
                <td>${detalle?.id}</td>
                <td>${detalle?.factura?.id} - ${detalle?.factura?.persona?.nombre}</td>
                <td>${detalle?.producto?.nombre}</td>
                <td>${detalle?.cantidad}</td>
                <td>$${detalle?.precioVenta}</td>
                <td>
                    <a href="#" data-id="${detalle?.id}" class="btn btn-success btn-sm btn-edit btn-ajax"
                       title="Editar">
                        <i class="fa fa-edit"></i>
                    </a>
                    <a href="#" data-id="${detalle?.id}" class="btn btn-danger btn-sm btn-borrar btn-ajax"
                       title="Eliminar">
                        <i class="fa fa-trash"></i>
                    </a>
                    <a href="#" data-id="${detalle?.id}" class="btn btn-info btn-sm btn-show btn-ajax"
                       title="Ver Detalle">
                        <i class="fa fa-search"></i>
                    </a>
                </td>
            </tr>
        </g:each>
    </g:if>
    <g:else>
        <tr class="danger">
            <td class="text-center" colspan="6">
                No se encontraron registros que mostrar
            </td>
        </tr>
    </g:else>
    </tbody>
</table>
