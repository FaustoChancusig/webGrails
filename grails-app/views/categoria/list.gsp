<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Categorías</title>
</head>

<body>

<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>

<!-- botones -->
<div class="btn-toolbar toolbar">
    <div class="btn-group">
        <g:link controller="inicio" action="index" class="btn btn-secondary">
            <i class="fa fa-arrow-left"></i> Regresar
        </g:link>
    </div>

    <div class="btn-group">
        <a href="#" class="btn btn-primary btnCrear">
            <i class="fa fa-tags"></i> Nueva Categoría
        </a>
    </div>
</div>

<div>
    <div class="col-md-12 row">
        <div class="col-md-2"></div>
        <div class="col-md-2"> Buscar por:</div>
        <div class="col-md-2"> 
            <input type="text" placeholder="Criterio" id="criterio" class="form-control" style="width: 120px"/>
        </div>   
        <div class="btn-group col-md-3">
            <a href="#" class="btn btn-primary" id="btnBuscar">
                <i class="fa fa-search-plus"></i> Buscar
            </a>
        </div>
    </div>
</div>

<div class="col-md-12 alert alert-warning alert-dismissible fade hidden" role="alert">
    <strong>Se han guardado los datos correctamente.
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
</div>

<div id="tabla_ajax">
    <table class="table table-condensed table-bordered table-striped table-hover">
        <thead>
        <tr>
            <th>Nombre</th>
            <th>Descripción</th>
            <th>Acciones</th>
        </tr>
        </thead>
        <tbody>
        <g:if test="${categorias.size() > 0}">
            <g:each in="${categorias}" var="categoria">
                <tr data-id="${categoria?.id}">
                    <td>${categoria?.nombre}</td>
                    <td>${categoria?.descripcion}</td>
                    <td>
                        <a href="#" data-id="${categoria?.id}" class="btn btn-success btn-sm btn-edit btn-ajax" title="Editar">
                            <i class="fa fa-edit"></i>
                        </a>
                        <a href="#" data-id="${categoria?.id}" class="btn btn-danger btn-sm btn-borrar btn-ajax" title="Eliminar">
                            <i class="fa fa-trash"></i>
                        </a>
                        <a href="#" data-id="${categoria?.id}" class="btn btn-info btn-sm btn-show btn-ajax" title="Ver Categoría">
                            <i class="fa fa-search"></i>
                        </a>
                    </td>
                </tr>
            </g:each>
        </g:if>
        <g:else>
            <tr class="danger">
                <td class="text-center" colspan="3">No se encontraron registros que mostrar</td>
            </tr>
        </g:else>
        </tbody>
    </table>
</div>

<script type="text/javascript">
    function submitForm() {
        var $form = $("#frmCategoria");
        $.ajax({
            type: "POST",
            url: $form.attr("action"),
            data: $form.serialize(),
            success: function (msg) {
                if (msg === 'ok') {
                    $('.alert').removeClass("hidden").addClass("show").alert();
                    setTimeout(function () {
                        location.reload(true);
                    }, 500);
                } else {
                    log("Error al guardar la categoría", "error")
                }
            }
        });
    }

    function deleteRow(itemId) {
        bootbox.dialog({
            title: "Alerta",
            message: "<i class='fa fa-trash fa-3x pull-left text-danger'></i><p>¿Está seguro que desea eliminar la categoría seleccionada?</p>",
            closeButton: false,
            buttons: {
                cancelar: {
                    label: "Cancelar",
                    className: "btn-primary"
                },
                eliminar: {
                    label: "<i class='fa fa-trash'></i> Eliminar",
                    className: "btn-danger",
                    callback: function () {
                        $.ajax({
                            type: "POST",
                            url: '${createLink(controller: 'categoria', action:'delete_ajax')}',
                            data: {id: itemId},
                            success: function (msg) {
                                if (msg === 'ok') {
                                    setTimeout(function () {
                                        location.reload();
                                    }, 300);
                                } else {
                                    log("Error al borrar la categoría", "error")
                                }
                            }
                        });
                    }
                }
            }
        });
    }

    function createEditRow(id) {
        var title = id ? "Editar" : "Crear";
        var data = id ? {id: id} : {};
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'categoria', action:'form_ajax')}",
            data: data,
            success: function (msg) {
                var b = bootbox.dialog({
                    title: title + " Categoría",
                    closeButton: false,
                    message: msg,
                    buttons: {
                        cancelar: {
                            label: "Cancelar",
                            className: "btn-primary"
                        },
                        guardar: {
                            id: "btnSave",
                            label: "<i class='fa fa-save'></i> Guardar",
                            className: "btn-success",
                            callback: function () {
                                return submitForm();
                            }
                        }
                    }
                });
                setTimeout(function () {
                    b.find(".form-control").first().focus();
                }, 500);
            }
        });
    }

    $("#btnBuscar").click(function () {
        var criterio = $("#criterio").val();
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'categoria', action:'buscar_ajax')}",
            data: {criterio: criterio},
            success: function (msg) {
                $("#tabla_ajax").html(msg);
            }
        });
    });

    $(function () {
        $(".btnCrear").click(function () {
            createEditRow();
            return false;
        });

        $(".btn-edit").click(function () {
            createEditRow($(this).data("id"));
        });

        $(".btn-borrar").click(function () {
            deleteRow($(this).data("id"));
        });

        $(".btn-show").click(function () {
            $.ajax({
                type: "POST",
                url: "${createLink(controller: 'categoria', action:'show_ajax')}",
                data: {id: $(this).data("id")},
                success: function (msg) {
                    bootbox.dialog({
                        title: "Ver Categoría",
                        closeButton: false,
                        message: msg,
                        buttons: {
                            aceptar: {
                                label: "Aceptar",
                                className: "btn-primary"
                            }
                        }
                    });
                }
            });
        });
    });
</script>

</body>
</html>
