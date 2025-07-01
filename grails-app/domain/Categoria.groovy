package geos

class Categoria {
    String nombre
    String descripcion

    static mapping = {
        table 'categoria'
        cache usage: 'read-write'
        version false
        id generator: 'identity'
        columns {
            id column: 'id_categoria'
            nombre column: 'cat_nombre'
            descripcion column: 'cat_descripcion'
        }
    }

    static constraints = {
        nombre(blank: false, nullable: false)
        descripcion(blank: true, nullable: true)
    }

    String toString() {
        nombre
    }
}
