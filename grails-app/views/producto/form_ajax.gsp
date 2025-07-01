<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="geos.Producto" %>

<g:form name="frmProducto" action="save_ajax">
    <g:hiddenField name="id" value="${productoInstance?.id}" />

    <div class="form-group">
        <label>Nombre</label>
        <g:textField name="nombre" class="form-control" value="${productoInstance?.nombre}" maxlength="50" />
    </div>

    <div class="form-group">
        <label>Descripción</label>
        <g:textArea name="descripcion" class="form-control" maxlength="255">${productoInstance?.descripcion}</g:textArea>
    </div>

    <div class="form-group">
        <label>Precio</label>
        <g:textField name="precio" class="form-control" value="${productoInstance?.precio?.setScale(2, java.math.RoundingMode.HALF_UP)}"
                     oninput="this.value = this.value.replace(/[^0-9.]/g, '').slice(0, 9);" />
    </div>

    <div class="form-group">
        <label>Stock</label>
        <g:textField name="stock" class="form-control"
                     value="${productoInstance?.stock?.toInteger()}" 
                     oninput="this.value = this.value.replace(/[^0-9]/g, '').slice(0, 5);" />
    </div>

    <div class="form-group">
        <label>Categoría</label>
        <g:select name="categoria.id" from="${geos.Categoria.list()}" optionKey="id" optionValue="nombre" class="form-control"
                  value="${productoInstance?.categoria?.id}" noSelection="['':'Seleccione una categoría...']"/>
    </div>
</g:form>
