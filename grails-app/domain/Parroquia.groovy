package geos

class Parroquia {
    Canton canton
    String nombre
    static mapping = {
        table 'parr'
        cache usage: 'read-write', include: 'non-lazy'
        id column: 'parr__id'
        id generator: 'identity'
        version false
        columns {
            id column: 'parr__id'
            canton column: 'cntn__id'
            nombre column: 'parrnmbr'
        }
    }
    static constraints = {
        nombre(size: 1..63, blank: false, nullable: false, attributes: [title: 'nombre'])
    }

}
