<table class="table table-condensed table-bordered table-striped table-hover">
    <thead>
    <tr>
        <th style="width: 90%">Descripción</th>
        <th style="width: 10%">Acciones</th>
    </tr>
    </thead>
    <tbody>
    <g:if test="${tipos?.size() > 0}">
        <g:each in="${tipos}" var="tipo">
            <tr data-id="${tipo?.id}">
                <td>${tipo?.descripcion}</td>
                <td>
                    <a href="#" data-id="${tipo?.id}" class="btn btn-success btn-sm btn-edit btn-ajax"
                       title="Editar">
                        <i class="fa fa-edit"></i>
                    </a>
                    <a href="#" data-id="${tipo?.id}" class="btn btn-danger btn-sm btn-borrar btn-ajax"
                       title="Eliminar">
                        <i class="fa fa-trash"></i>
                    </a>
                    <a href="#" data-id="${tipo?.id}" class="btn btn-info btn-sm btn-show btn-ajax"
                       title="Ver Detalle">
                        <i class="fa fa-search"></i>
                    </a>
                </td>
            </tr>
        </g:each>
    </g:if>
    <g:else>
        <tr class="danger">
            <td class="text-center" colspan="2">
                No se encontraron registros que mostrar
            </td>
        </tr>
    </g:else>
    </tbody>
</table>

<script type="text/javascript">
    $(".btn-edit").click(function () {
        var id = $(this).data("id");
        createEditRow(id);
    });

    $(".btn-borrar").click(function () {
        var id = $(this).data("id");
        deleteRow(id);
    });

    $(".btn-show").click(function () {
        var title = "Ver Tipo";
        var id = $(this).data("id");
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'tipo', action:'show_ajax')}",
            data: {id: id},
            success: function (msg) {
                var b = bootbox.dialog({
                    title: title,
                    closeButton: false,
                    message: msg,
                    buttons: {
                        aceptar: {
                            label: "Aceptar",
                            className: "btn-primary",
                            callback: function () {}
                        }
                    }
                });
                setTimeout(function () {
                    b.find(".form-control").first().focus()
                }, 500);
            }
        });
    });
</script>
