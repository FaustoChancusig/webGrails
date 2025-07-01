<%@ page import="geos.Factura" %>

<g:if test="${!facturaInstance}">
    <elm:notFound elem="Factura" genero="a"/>
</g:if>
<g:else>
    <div class="modal-contenido">
        <div class="form-horizontal" role="form">

            <div class="form-group row">
                <div class="col-md-12">
                    <label class="col-md-3 control-label text-info">Cliente</label>
                    <div class="col-md-9">
                        <span class="form-control input-sm uneditable-input">
                            ${facturaInstance?.persona?.nombre}
                        </span>
                    </div>
                </div>
            </div>

            <div class="form-group row">
                <div class="col-md-12">
                    <label class="col-md-3 control-label text-info">Fecha y Hora</label>
                    <div class="col-md-9">
                        <span class="form-control input-sm uneditable-input">
                            ${facturaInstance?.fechaHora?.format("dd/MM/yyyy HH:mm")}
                        </span>
                    </div>
                </div>
            </div>

            <div class="form-group row">
                <div class="col-md-12">
                    <label class="col-md-3 control-label text-info">Método de Pago</label>
                    <div class="col-md-9">
                        <span class="form-control input-sm uneditable-input">
                            ${facturaInstance?.metodoPago}
                        </span>
                    </div>
                </div>
            </div>

            <div class="form-group row">
                <div class="col-md-12">
                    <label class="col-md-3 control-label text-info">Dirección</label>
                    <div class="col-md-9">
                        <span class="form-control input-sm uneditable-input">
                            ${facturaInstance?.direccion}
                        </span>
                    </div>
                </div>
            </div>

            <div class="form-group row">
                <div class="col-md-12">
                    <label class="col-md-3 control-label text-info">Subtotal</label>
                    <div class="col-md-9">
                        <span class="form-control input-sm uneditable-input">
                            \$${facturaInstance?.subtotal}
                        </span>
                    </div>
                </div>
            </div>

            <div class="form-group row">
                <div class="col-md-12">
                    <label class="col-md-3 control-label text-info">IVA</label>
                    <div class="col-md-9">
                        <span class="form-control input-sm uneditable-input">
                            \$${facturaInstance?.iva}
                        </span>
                    </div>
                </div>
            </div>

            <div class="form-group row">
                <div class="col-md-12">
                    <label class="col-md-3 control-label text-info">Total</label>
                    <div class="col-md-9">
                        <span class="form-control input-sm uneditable-input">
                            \$${facturaInstance?.total}
                        </span>
                    </div>
                </div>
            </div>

            <div class="form-group row">
                <div class="col-md-12">
                    <label class="col-md-3 control-label text-info">Estado</label>
                    <div class="col-md-9">
                        <span class="form-control input-sm uneditable-input">
                            ${facturaInstance?.estado}
                        </span>
                    </div>
                </div>
            </div>

        </div>
    </div>
</g:else>
