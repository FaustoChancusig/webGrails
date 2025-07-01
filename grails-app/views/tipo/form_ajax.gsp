<g:form action="save_ajax" name="frmTipo" class="form-horizontal" role="form">
    <g:hiddenField name="id" value="${tipo?.id}"/>

    <div class="form-group">
        <label class="col-md-3 control-label text-info">Descripción</label>
        <div class="col-md-9">
            <g:textField name="descripcion" maxlength="255" class="form-control required"
                         value="${tipo?.descripcion}"/>
        </div>
    </div>
</g:form>

<script type="text/javascript">
    $("#frmTipo").submit(function () {
        var $form = $(this);
        var data = $form.serialize();

        $.ajax({
            type: "POST",
            url: $form.attr("action"),
            data: data,
            success: function (msg) {
                if (msg === "ok") {
                    log("Tipo guardado correctamente", "success");
                    cargarTabla(); // o actualizarTabla() si es que usas otro nombre
                    bootbox.hideAll();
                } else {
                    log("Error al guardar el tipo", "error");
                }
            }
        });

        return false;
    });
</script>
