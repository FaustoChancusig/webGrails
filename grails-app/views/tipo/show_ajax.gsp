<%@ page import="geos.Tipo" %>

<g:if test="${!tipoInstance}">
    <elm:notFound elem="Tipo" genero="o"/>
</g:if>
<g:else>
    <div class="modal-contenido">
        <div class="form-horizontal" role="form">

            <!-- Eliminado el bloque de Código -->

            <div class="form-group row">
                <div class="col-md-12">
                    <label class="col-md-2 control-label text-info">
                        Descripción
                    </label>
                    <div class="col-md-10">
                        <span class="form-control input-sm uneditable-input">
                            ${tipoInstance?.descripcion}
                        </span>
                    </div>
                </div>
            </div>

        </div>
    </div>
</g:else>
