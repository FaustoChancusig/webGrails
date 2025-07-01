<style type="text/css">

option[selected] {
    background-color: yellow;
}

</style>

    <div class="modal-contenido">
        <g:form class="form-horizontal" name="frmCargo" role="form" controller="cargo"
                action="save_ajax" method="POST">
            <g:hiddenField name="id" value="${cargoInstance?.id}"/>    
            <div class="form-group row ${hasErrors(bean: cargoInstance, field: 'nombre', 'error')} ${hasErrors(bean: cargoInstance, field: 'apellido', 'error')} required">
                <div class="col-md-12">
                    <span class="grupo">
                        <label for="nombre" class="col-md-4 control-label">
                            Nombre
                        </label>

                        <div class="col-md-12">
                            <g:textField name="nombre" maxlength="40" minlength="3"
                                         class="form-control input-sm required"
                                         value="${cargoInstance?.nombre}"/>
                        </div>
                    </span>
                </div>
        </g:form>
    </div>

 

