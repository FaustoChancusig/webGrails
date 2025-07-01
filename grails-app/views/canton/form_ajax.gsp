
    <div class="modal-contenido">
        <g:form class="form-horizontal" name="frmCanton" role="form" action="save_ajax" method="POST">
            <g:hiddenField name="id" value="${canton?.id}"/>
            <g:hiddenField name="prov" value="${provincia}"/>

            <div class="form-group keeptogether ${hasErrors(bean: canton, field: 'nombre', 'error')} col-md-12">
                <span class="row">
                    <label for="numero" class="col-md-2 control-label">
                        Número
                    </label>

                    <div class="col-md-3">
                        <g:textField name="numero" maxlength="4"
                                     class="form-control input-sm required"
                                     value="${canton?.numero}"/>
                    </div>

                    <label for="nombre" class="col-md-1 control-label">
                        Nombre
                    </label>

                    <div class="col-md-5" style="margin-left: 20px">
                        <g:textField name="nombre" maxlength="63" class="form-control input-sm required"
                                     value="${canton?.nombre}"/>
                    </div>
                </span>
            </div>
        </g:form>
        <div class="col-md-12" style="text-align: end">
            <button id="cerrar" class="btn btn-primary"> Cancelar</button>
            <button id="grabar" class="btn btn-info"> Grabar</button>
        </div>
    </div>

    <script type="text/javascript">


        $(".form-control").keydown(function (ev) {
            if (ev.keyCode == 13) {
                console.log("Llama a validar")
                $("#grabar").click()
                return false;
            }
            return true;
        });


        $("#grabar").click(function () {
            var numero = $("#numero").val();
            var nombre = $("#nombre").val();
            var url = "${createLink(controller: 'canton', action:'list')}"
            console.log("validando...", numero)
            var num = parseInt(numero)


//            if(numero >25 || numero<1){
//                bootbox.alert("<i class='fa fa-exclamation-triangle fa-3x pull-left text-warning text-shadow'></i>" +
//                    " Ingrese el número del cantón")
//            }
//            else if (nombre == ''){
//                bootbox.alert("<i class='fa fa-exclamation-triangle fa-3x pull-left text-warning text-shadow'></i>" +
//                    " Ingrese el nombre del cantón")
//            }else{
//                submitForm();
//                setTimeout(function () {
//                    location.reload(true)
//                }, 300);
//            }

            submitForm();
            setTimeout(function () {
                location.reload(true)
            }, 300);

        });

        $("#cerrar").click(function () {
            //location.href("${createLink(controller: 'canton', action:'list')}")
            location.reload(true)
        });
    </script>
