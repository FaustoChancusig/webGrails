<%@ page contentType="text/html;charset=UTF-8" %>

<table class="table table-condensed table-bordered table-striped table-hover">
    <thead>
    <tr>
        <th style="width: 20%">Categoría</th>
        <th style="width: 20%">Nombre</th>
        <th style="width: 25%">Descripción</th>
        <th style="width: 10%">Precio</th>
        <th style="width: 10%">Stock</th>
        <th style="width: 15%">Acciones</th>
    </tr>
    </thead>
    <tbody>
    <g:if test="${productos?.size() > 0}">
        <g:each in="${productos}" var="producto">
            <tr data-id="${producto?.id}">
                <td>${producto?.categoria?.nombre}</td>
                <td>${producto?.nombre}</td>
                <td>${producto?.descripcion}</td>
                <td>${producto?.precio}</td>
                <td>${producto?.stock}</td>
                <td>
                    <a href="#" data-id="${producto?.id}" class="btn btn-success btn-sm btn-edit btn-ajax"
                       title="Editar">
                        <i class="fa fa-edit"></i>
                    </a>
                    <a href="#" data-id="${producto?.id}" class="btn btn-danger btn-sm btn-borrar btn-ajax"
                       title="Eliminar">
                        <i class="fa fa-trash"></i>
                    </a>
                    <a href="#" data-id="${producto?.id}" class="btn btn-info btn-sm btn-show btn-ajax"
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
