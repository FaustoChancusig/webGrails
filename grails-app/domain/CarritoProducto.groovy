package geos

class CarritoProducto {

    Carrito carrito
    Producto producto
    Integer cantidad

    static mapping = {
        table 'carrito_producto'
        cache usage: 'read-write'
        version false
        id generator: 'identity'
        columns {
            id column: 'id_carrito_prod'
            carrito column: 'id_carrito'
            producto column: 'id_producto'
            cantidad column: 'cantidad'
        }
    }

    static constraints = {
        cantidad min: 1, nullable: false
    }

    String toString() {
        "${producto?.nombre} x ${cantidad}"
    }
}
