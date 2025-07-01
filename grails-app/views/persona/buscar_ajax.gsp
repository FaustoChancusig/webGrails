<table>
    <tbody>
    <g:if test="${personas.size() > 0}">
        <g:each in="${personas}" var="persona">
            <tr data-id="${persona?.id}">
                <td style="width:25%">${persona?.nombre}</td>
                <td style="width:25%">${persona?.apellido}</td>
                <td style="width:20%">${persona?.mail}</td>
                <td style="width:10%">${persona?.login}</td>
                <td style="width:10%">${persona?.activo}</td>
                <td style="width:10%">
                    <a href="#" data-id="${persona?.id}" class="btn btn-success btn-sm btn-edit btn-ajax"
                       title="Editar">
                        <i class="fa fa-edit"></i>
                    </a>
                    <a href="#" data-id="${persona?.id}" class="btn btn-danger btn-sm btn-borrar btn-ajax"
                       title="Eliminar">
                        <i class="fa fa-trash"></i>
                    </a>
                    <a href="#" data-id="${persona?.id}" class="btn btn-info btn-sm btn-show btn-ajax"
                       title="Ver Provincia">
                        <i class="fa fa-search"></i>
                    </a>
                </td>
            </tr>
        </g:each>
    </g:if>
    <g:else>
        <tr class="danger">
            <td class="text-center" colspan="2">
                No se encontraron registros que mostrarbtnBuscar
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
            var title = "Ver Personas";
            var id = $(this).data("id");
            $.ajax({
                type: "POST",
                url: "${createLink(controller: 'persona', action:'show_ajax')}",
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
                                callback: function () {
                                }
                            }
                        },
                    }); //dialog
                    setTimeout(function () {
                        b.find(".form-control").first().focus()
                    }, 500);
                } //successJava
            });
            //location.reload()//ajax
        });

</script>

