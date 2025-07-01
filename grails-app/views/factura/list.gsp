<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Facturas</title>
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
            <i class="fa fa-file-invoice"></i> Nueva Factura
        </a>
    </div>
</div>

<div>
    <div class="col-md-12 row">
        <div class="col-md-2"></div>
        <div class="col-md-2">Buscar por:</div>
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
    <strong>Se han guardado los datos correctamente.</strong>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>

<div id="tabla_ajax">
    <g:render template="buscar_ajax" model="[facturas: facturas]" />
</div>

<script type="text/javascript">
    function submitForm() {
        var $form = $("#frmFactura");
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
                    log("Error al guardar la factura", "error");
                }
            }
        });
    }


    function deleteRow(itemId) {
        bootbox.dialog({
            title: "Alerta",
            message: "<i class='fa fa-trash fa-3x pull-left text-danger'></i><p>¿Está seguro que desea eliminar la factura seleccionada?</p>",
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
                            url: '${createLink(controller: 'factura', action:'delete_ajax')}',
                            data: {id: itemId},
                            success: function (msg) {
                                if (msg === 'ok') {
                                    setTimeout(function () {
                                        location.reload();
                                    }, 300);
                                } else {
                                    log("Error al borrar la factura", "error")
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
            url: "${createLink(controller: 'factura', action:'form_ajax')}",
            data: data,
            success: function (msg) {
                var b = bootbox.dialog({
                    title: title + " Factura",
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

    function bindActions() {
        $(document).off("click", ".btn-edit").on("click", ".btn-edit", function () {
            createEditRow($(this).data("id"));
        });

        $(document).off("click", ".btn-borrar").on("click", ".btn-borrar", function () {
            deleteRow($(this).data("id"));
        });

        $(document).off("click", ".btn-show").on("click", ".btn-show", function () {
            $.ajax({
                type: "POST",
                url: "${createLink(controller: 'factura', action:'show_ajax')}",
                data: {id: $(this).data("id")},
                success: function (msg) {
                    bootbox.dialog({
                        title: "Ver Factura",
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
    }

    $(function () {
        bindActions();

        $(".btnCrear").click(function () {
            createEditRow();
            return false;
        });

        $("#btnBuscar").click(function () {
            var criterio = $("#criterio").val();
            $.ajax({
                type: "POST",
                url: "${createLink(controller: 'factura', action:'buscar_ajax')}",
                data: {criterio: criterio},
                success: function (msg) {
                    $("#tabla_ajax").html(msg);
                    bindActions();
                }
            });
        });
    });
</script>

</body>
</html>
