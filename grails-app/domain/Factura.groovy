package geos

class Factura {

    Persona persona
    Date fechaHora
    String metodoPago
    String direccion
    BigDecimal subtotal
    BigDecimal iva
    BigDecimal total
    String estado

    static mapping = {
        table 'factura'
        cache usage: 'read-write'
        version false
        id generator: 'identity'
        columns {
            id column: 'id_factura'
            persona column: 'id_usuario'          // clave foránea a tabla prsn
            fechaHora column: 'fac_fechahora'
            metodoPago column: 'fac_metodo_pago'
            direccion column: 'fac_direccion'
            subtotal column: 'fac_subtotal'
            iva column: 'fac_iva'
            total column: 'fac_total'
            estado column: 'fac_estado'
        }
    }

    static constraints = {
        fechaHora nullable: false
        metodoPago blank: false
        direccion nullable: true
        subtotal nullable: false, scale: 2
        iva nullable: false, scale: 2
        total nullable: false, scale: 2
        estado blank: false
    }

    String toString() {
        "Factura ${id} - ${persona?.nombre} - ${fechaHora?.format('dd/MM/yyyy')}"
    }
}
