<%@ page import="geos.DetalleFactura" %>

<g:if test="${!detalleFacturaInstance}">
    <elm:notFound elem="Detalle de Factura" genero="o"/>
</g:if>
<g:else>
    <div class="modal-contenido">
        <div class="form-horizontal" role="form">

            <div class="form-group row">
                <div class="col-md-12">
                    <label class="col-md-3 control-label text-info">Factura</label>
                    <div class="col-md-9">
                        <span class="form-control input-sm uneditable-input">
                            #${detalleFacturaInstance?.factura?.id} - ${detalleFacturaInstance?.factura?.persona?.nombre}
                        </span>
                    </div>
                </div>
            </div>

            <div class="form-group row">
                <div class="col-md-12">
                    <label class="col-md-3 control-label text-info">Producto</label>
                    <div class="col-md-9">
                        <span class="form-control input-sm uneditable-input">
                            ${detalleFacturaInstance?.producto?.nombre}
                        </span>
                    </div>
                </div>
            </div>

            <div class="form-group row">
                <div class="col-md-12">
                    <label class="col-md-3 control-label text-info">Cantidad</label>
                    <div class="col-md-9">
                        <span class="form-control input-sm uneditable-input">
                            ${detalleFacturaInstance?.cantidad}
                        </span>
                    </div>
                </div>
            </div>

            <div class="form-group row">
                <div class="col-md-12">
                    <label class="col-md-3 control-label text-info">Precio Venta</label>
                    <div class="col-md-9">
                        <span class="form-control input-sm uneditable-input">
                            \$${detalleFacturaInstance?.precioVenta}
                        </span>
                    </div>
                </div>
            </div>

        </div>
    </div>
</g:else>
