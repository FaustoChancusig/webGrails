package geos

class Carrito {
    Persona usuario
    Date fechaCreacion

    static mapping = {
        table 'carrito'
        cache usage: 'read-write'
        version false
        id generator: 'identity'
        columns {
            id column: 'id_carrito'
            usuario column: 'id_usuario'
            fechaCreacion column: 'fecha_creacion'
        }
    }

    static constraints = {
        fechaCreacion(blank: true, nullable: true)
    }

    String toString() {
        "Carrito ${id}"
    }
}
