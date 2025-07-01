<g:form name="frmCategoria" action="save_ajax" class="form-horizontal" role="form">
    <g:hiddenField name="id" value="${categoriaInstance?.id}"/>

    <div class="form-group">
        <label class="col-md-2 control-label text-info">
            Nombre
        </label>
        <div class="col-md-8">
            <g:textField name="nombre" maxlength="50" class="form-control required" value="${categoriaInstance?.nombre}"/>
        </div>
    </div>

    <div class="form-group">
        <label class="col-md-2 control-label text-info">
            Descripción
        </label>
        <div class="col-md-8">
            <g:textField name="descripcion" maxlength="255" class="form-control" value="${categoriaInstance?.descripcion}"/>
        </div>
    </div>
</g:form>
