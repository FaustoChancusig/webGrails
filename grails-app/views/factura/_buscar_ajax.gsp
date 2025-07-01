<%@ page contentType="text/html;charset=UTF-8" %>

<table class="table table-condensed table-bordered table-striped table-hover">
    <thead>
    <tr>
        <th style="width: 10%">ID</th>
        <th style="width: 20%">Cliente</th>
        <th style="width: 15%">Fecha</th>
        <th style="width: 15%">Método de Pago</th>
        <th style="width: 10%">Subtotal</th>
        <th style="width: 10%">IVA</th>
        <th style="width: 10%">Total</th>
        <th style="width: 10%">Estado</th>
        <th style="width: 10%">Acciones</th>
    </tr>
    </thead>
    <tbody>
    <g:if test="${facturas?.size() > 0}">
        <g:each in="${facturas}" var="factura">
            <tr data-id="${factura?.id}">
                <td>${factura?.id}</td>
                <td>${factura?.persona?.nombre}</td>
                <td>${factura?.fechaHora?.format("dd-MM-yyyy HH:mm")}</td>
                <td>${factura?.metodoPago}</td>
                <td>${factura?.subtotal}</td>
                <td>${factura?.iva}</td>
                <td>${factura?.total}</td>
                <td>${factura?.estado}</td>
                <td>
                    <a href="#" data-id="${factura?.id}" class="btn btn-success btn-sm btn-edit btn-ajax"
                       title="Editar">
                        <i class="fa fa-edit"></i>
                    </a>
                    <a href="#" data-id="${factura?.id}" class="btn btn-danger btn-sm btn-borrar btn-ajax"
                       title="Eliminar">
                        <i class="fa fa-trash"></i>
                    </a>
                    <a href="#" data-id="${factura?.id}" class="btn btn-info btn-sm btn-show btn-ajax"
                       title="Ver Detalle">
                        <i class="fa fa-search"></i>
                    </a>
                </td>
            </tr>
        </g:each>
    </g:if>
    <g:else>
        <tr class="danger">
            <td class="text-center" colspan="9">
                No se encontraron registros que mostrar
            </td>
        </tr>
    </g:else>
    </tbody>
</table>

