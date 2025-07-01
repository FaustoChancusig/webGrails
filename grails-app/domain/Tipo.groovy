package geos

class Tipo {
    String descripcion

    static mapping = {
        table 'tipo'
        cache usage: 'read-write'
        version false
        id generator: 'identity'
        columns {
            id column: 'id_tipo'
            descripcion column: 'descripcion'
        }
    }

    static constraints = {
        descripcion(blank: false, nullable: false)
    }

    String toString() {
        descripcion
    }
}
