<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="geos.Producto" %>

<g:if test="${!productoInstance}">
    <elm:notFound elem="Producto" genero="o"/>
</g:if>
<g:else>
    <div class="modal-contenido">
        <div class="form-horizontal" role="form">

            <div class="form-group row">
                <label class="col-md-2 control-label text-info">Categoría</label>
                <div class="col-md-10">
                    <span class="form-control input-sm uneditable-input">
                        ${productoInstance?.categoria?.nombre}
                    </span>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-md-2 control-label text-info">Nombre</label>
                <div class="col-md-10">
                    <span class="form-control input-sm uneditable-input">
                        ${productoInstance?.nombre}
                    </span>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-md-2 control-label text-info">Descripción</label>
                <div class="col-md-10">
                    <span class="form-control input-sm uneditable-input">
                        ${productoInstance?.descripcion}
                    </span>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-md-2 control-label text-info">Precio</label>
                <div class="col-md-10">
                    <span class="form-control input-sm uneditable-input">
                        ${productoInstance?.precio}
                    </span>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-md-2 control-label text-info">Stock</label>
                <div class="col-md-10">
                    <span class="form-control input-sm uneditable-input">
                        ${productoInstance?.stock}
                    </span>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-md-2 control-label text-info">Imagen</label>
                <div class="col-md-10">
                    <span class="form-control input-sm uneditable-input">
                        ${productoInstance?.imagen}
                    </span>
                </div>
            </div>

        </div>
    </div>
</g:else>
