package geos

class Canton {
    Provincia provincia
    int numero
    String nombre
    static mapping = {
        table 'cntn'
        cache usage: 'read-write', include: 'non-lazy'
        id column: 'cntn__id'
        id generator: 'identity'
        version false
        columns {
            id column: 'cntn__id'
            provincia column: 'prov__id'
            numero column: 'cntnnmro'
            nombre column: 'cntnnmbr'
        }
    }
    static constraints = {
        nombre(size: 1..63, blank: false, nullable: false, attributes: [title: 'nombre'])
        numero(maxSize: 2, blank: false, nullable: false, attributes: [title: 'numero'])
    }

    String toString() {
        return this.nombre
    }

}
