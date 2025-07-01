package geos

class DetalleFactura {

    Factura factura
    Producto producto
    Integer cantidad
    BigDecimal precioVenta

    static mapping = {
        table 'detalle_factura'
        cache usage: 'read-write'
        version false
        id generator: 'identity'
        columns {
            id column: 'id_det_fac'
            factura column: 'id_factura'
            producto column: 'id_producto'
            cantidad column: 'df_cant'
            precioVenta column: 'df_precio_venta'
        }
    }

    static constraints = {
        cantidad min: 1, nullable: false
        precioVenta nullable: false, scale: 2
    }

    String toString() {
        "${producto?.nombre} x ${cantidad} - \$${precioVenta}"
    }
}