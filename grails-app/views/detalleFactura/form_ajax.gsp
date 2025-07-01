<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="geos.DetalleFactura" %>

<g:form name="frmDetalle" action="save_ajax">
    <g:hiddenField name="id" value="${detalleFacturaInstance?.id}" />

    <div class="form-group">
        <label>Factura</label>
        <g:select name="factura.id" from="${geos.Factura.list()}" optionKey="id" optionValue="${{ it.id + ' - ' + it.persona?.nombre }}" class="form-control"
                  value="${detalleFacturaInstance?.factura?.id}" noSelection="['':'Seleccione una factura...']"/>
    </div>

    <div class="form-group">
        <label>Producto</label>
        <g:select name="producto.id" from="${geos.Producto.list()}" optionKey="id" optionValue="nombre" class="form-control"
                  value="${detalleFacturaInstance?.producto?.id}" noSelection="['':'Seleccione un producto...']"/>
    </div>

    <div class="form-group">
        <label>Cantidad</label>
        <g:textField name="cantidad" type="number" min="1" class="form-control" value="${detalleFacturaInstance?.cantidad}" />
    </div>

    <div class="form-group">
        <label>Precio de Venta</label>
        <g:textField name="precioVenta" type="number" step="0.01" class="form-control" value="${detalleFacturaInstance?.precioVenta}" />
    </div>
</g:form>
