package geos

class FacturaController {

    def list() {
        def facturas = Factura.list([sort: 'fechaHora', order: 'desc'])
        return [facturas: facturas]
    }

    def form_ajax() {
        def factura

        if (params.id) {
            factura = Factura.get(params.id)
        } else {
            factura = new Factura()
        }

        return [facturaInstance: factura]
    }

    def show_ajax() {
        def factura

        if (params.id) {
            factura = Factura.get(params.id)
        }

        return [facturaInstance: factura]
    }

    def delete_ajax() {
        try {
            def factura = Factura.get(params.id)
            if (!factura) {
                render "no"
                return
            }

            factura.estado = "Cancelado"
            factura.save(flush: true)
            render "ok"
        } catch (Exception e) {
            println "Error al cancelar factura: ${e.message}"
            render "no"
        }
    }


    def save_ajax() {
        println "Guardar factura: $params"

        def factura = params.id ? Factura.get(params.id) : new Factura()

        try {
            factura.persona = Persona.get(params.persona?.id)
            factura.fechaHora = params.fechaHora ?: new Date()
            factura.metodoPago = params.metodoPago
            factura.direccion = params.direccion
            factura.subtotal = params.subtotal?.toBigDecimal()
            factura.iva = params.iva?.toBigDecimal()
            factura.total = params.total?.toBigDecimal()
            factura.estado = params.estado

            if (!factura.save(flush: true)) {
                println("Error al guardar la factura: ${factura.errors}")
                render "no"
            } else {
                render "ok"
            }
        } catch (e) {
            println("Excepción al guardar factura: ${e.message}")
            render "no"
        }
    }

    def buscar_ajax() {
        def criterio = "%${params.criterio}%"
        def facturas = Factura.createCriteria().list {
            or {
                ilike("metodoPago", criterio)
                ilike("estado", criterio)
                persona {
                    ilike("nombre", criterio)
                }
            }
        }

        render template: 'buscar_ajax', model: [facturas: facturas]
    }

}
