<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="geos.Factura" %>

<g:form name="frmFactura" action="save_ajax">
    <g:hiddenField name="id" value="${facturaInstance?.id}" />

    <div class="form-group">
        <label>Cliente</label>
        <g:select name="persona.id" from="${geos.Persona.list()}" optionKey="id" optionValue="nombre" class="form-control"
                  value="${facturaInstance?.persona?.id}" noSelection="['':'Seleccione un cliente...']"/>
    </div>

    <div class="form-group">
        <label>Método de Pago</label>
        <g:textField name="metodoPago" class="form-control" value="${facturaInstance?.metodoPago}" />
    </div>

    <div class="form-group">
        <label>Dirección</label>
        <g:textArea name="direccion" class="form-control">${facturaInstance?.direccion}</g:textArea>
    </div>

    <div class="form-group">
        <label>Subtotal</label>
        <g:textField name="subtotal" type="number" step="0.01" class="form-control" value="${facturaInstance?.subtotal}" />
    </div>

    <div class="form-group">
        <label>IVA</label>
        <g:textField name="iva" type="number" step="0.01" class="form-control" value="${facturaInstance?.iva}" />
    </div>

    <div class="form-group">
        <label>Total</label>
        <g:textField name="total" type="number" step="0.01" class="form-control" value="${facturaInstance?.total}" />
    </div>

    <div class="form-group">
        <label>Estado</label>
        <g:textField name="estado" class="form-control" value="${facturaInstance?.estado}" />
    </div>
</g:form>
