<%@ page import="geos.Categoria" %>

<g:if test="${!categoriaInstance}">
    <elm:notFound elem="Categoría" genero="a"/>
</g:if>
<g:else>
    <div class="modal-contenido">
        <div class="form-horizontal" role="form">

            <div class="form-group row">
                <div class="col-md-12">
                    <label class="col-md-2 control-label text-info">
                        Nombre
                    </label>
                    <div class="col-md-10">
                        <span class="form-control input-sm uneditable-input">
                            ${categoriaInstance?.nombre}
                        </span>
                    </div>
                </div>
            </div>

            <div class="form-group row">
                <div class="col-md-12">
                    <label class="col-md-2 control-label text-info">
                        Descripción
                    </label>
                    <div class="col-md-10">
                        <span class="form-control input-sm uneditable-input">
                            ${categoriaInstance?.descripcion}
                        </span>
                    </div>
                </div>
            </div>

        </div>
    </div>
</g:else>
