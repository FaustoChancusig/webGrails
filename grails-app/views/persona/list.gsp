<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Personas</title>
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
            <i class="fa fa-clipboard-list"></i> Nueva Persona
        </a>
    </div>
</div>

<div>
    <div class="col-md-12 row">
        <div class="col-md-2"></div>
        <div class="col-md-2"> Buscar por:</div>
        <div class="col-md-2"> 
            <input type=text placeHolder="Criterio" id="criterio" class= "form-control" style="width: 120px"/></div>   
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

<table class="table table-condensed table-bordered table-striped table-hover">
    <thead>
    <tr>
        <th style="width:25%">Nombre</th>
        <th style="width:25%">Apellido</th>
        <th style="width:20%">Mail</th>
        <th style="width:10%">Login</th>
        <th style="width:10%">Activo</th>
        <th style="width:10%">Acciones</th>
    </tr>
    </thead>
</table>
<div id="tabla_ajax">
   Lista de personas a buscar
</div>


<table class="table table-condensed table-bordered table-striped table-hover">
    <thead>
    <tr>
        <th>Login</th>
        <th>Apellido</th>
        <th>Nombre</th>
        <th>Mail</th>
        <th>Activo</th>
        <th>Acciones</th>
    </tr>
    </thead>
    <tbody>
    <g:if test="${personas.size() > 0}">
        <g:each in="${personas}" var="persona">
            <tr data-id="${persona?.id}">
                <td>${persona?.login}</td>
                <td>${persona?.apellido}</td>
                <td>${persona?.nombre}</td>
                <td>${persona?.mail}</td>
                <td>${persona?.activo}</td>
                <td>
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
    var id = null;

    $('#fecha').datetimepicker({
        locale: 'es',
        format: 'DD-MM-YYYY',
        sideBySide: true,
        icons: {
        }
    });

    $("#btnBuscar").click(function () {
        var criterio = $("#criterio").val();
        console.log('valor', criterio);
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'persona', action:'buscar_ajax')}",
            data: {criterio: criterio},
            success: function (msg) {
                console.log(msg)
                $("#tabla_ajax").html(msg)
            } //successJava
        });
    });

    function submitForm() {
        var $form = $("#frmPersona");
        $.ajax({
            type: "POST",
            url: $form.attr("action"),
            data: $form.serialize(),
            success: function (msg) {
                console.log('retorna', msg)
                if (msg == 'ok') {
//                    log("Persona guardada orrectamente", "success");

                    $('.alert').removeClass("hidden")
                    $('.alert').addClass("show")
                    $('.alert').alert()
                    console.log('recargar')
                    setTimeout(function () {
                        location.reload(true);
                    }, 500);
                } else {
                    log("Error al guardar la persona", "error")
                }
            }
        });
    }


    function deleteRow(itemId) {
        console.log("borra",itemId)
        bootbox.dialog({
            title: "Alerta",
            message: "<i class='fa fa-trash fa-3x pull-left text-danger text-shadow'></i><p>" +
            "¿Está seguro que desea eliminar la persona seleccionada? Esta acción no se puede deshacer.</p>",
            closeButton: false,
            buttons: {
                cancelar: {
                    label: "Cancelar",
                    className: "btn-primary",
                    callback: function () {
                    }
                },
                eliminar: {
                    label: "<i class='fa fa-trash'></i> Eliminar",
                    className: "btn-danger",
                    callback: function () {
                        $.ajax({
                            type: "POST",
                            url: '${createLink(controller: 'persona', action:'delete_ajax')}',
                            data: {
                                id: itemId
                            },
                            success: function (msg) {
                                if (msg == 'ok') {
                                    setTimeout(function () {
                                        location.reload();
                                    }, 300);
                                } else {
                                    log("Error al borrar la persona", "error")
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
            url: "${createLink(controller: 'persona', action:'form_ajax')}",
            data: data,
            success: function (msg) {
                var b = bootbox.dialog({
                    title: title + " Persona" ,
                    closeButton: false,
                    message: msg,
                    class: "modal-lg",
                    buttons : {
                        cancelar : {
                            label     : "Cancelar",
                            className : "btn-primary",
                            callback  : function () {
                            }
                        },
                        guardar  : {
                            id        : "btnSave",
                            label     : "<i class='fa fa-save'></i> Guardar",
                            className : "btn-success",
                            callback  : function () {
                                return submitForm();
                            } //callback
                        } //guardar
                    } //button
                }); //dialog
                setTimeout(function () {
                    b.find(".form-control").first().focus()
                }, 500);
            } //successJava
        });
        //location.reload()//ajax
    }

    //createEdit

    $(function () {

        $(".btnCrear").click(function () {
            createEditRow();
            return false;
        });

        $(".btn-edit").click(function () {
            var id = $(this).data("id");
            createEditRow(id);
        });

        $(".btn-borrar").click(function () {
            var id = $(this).data("id");
            deleteRow(id);
        });

        $(".btn-canton").click(function () {
            var id = $(this).data("id");
            //mostrar la lista de cantones
            location.href = "${createLink(controller: 'canton', action:'list')}/"+id
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
    });
</script>

</body>
</html>
