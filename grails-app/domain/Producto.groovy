package geos

class Producto {
    Categoria categoria
    String nombre
    String descripcion
    BigDecimal precio
    Integer stock  
    String imagen

    static mapping = {
        table 'producto'
        cache usage: 'read-write'
        version false
        id generator: 'identity'
        columns {
            id column: 'id_producto'
            categoria column: 'id_categoria'
            nombre column: 'prod_nombre'
            descripcion column: 'prod_desc'
            precio column: 'prod_precio'
            stock column: 'prod_stock'
            imagen column: 'prod_imagen'
        }
    }

    static constraints = {
        descripcion(blank: true, nullable: true)
        imagen(blank: true, nullable: true)
    }

    String toString() {
        nombre
    }
}
