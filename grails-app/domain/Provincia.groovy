package geos

class Provincia {
  int numero
  String nombre
  static mapping = {
    table 'prov'
    cache usage: 'read-write', include: 'non-lazy'
    id column: 'prov__id'
    id generator: 'identity'
    version false
    columns {
      numero column: 'provnmro'
      nombre column: 'provnmbr'
    }
  }
  static constraints = {
    nombre(size:1..63, blank:false, nullable:false, attributes:[title: 'nombre'])
    numero(maxSize: 2, blank: false, nullable: false, attributes: [title: 'numero'])
  }
  String toString() {
    return this.nombre
  }
}
