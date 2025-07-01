package geos

class DetalleFacturaController {

    def list() {
        def detalles = DetalleFactura.list(sort: 'id', order: 'desc')
        return [detalleFacturaList: detalles]
    }

    def form_ajax() {
        def detalle

        if (params.id) {
            detalle = DetalleFactura.get(params.id)
        } else {
            detalle = new DetalleFactura()
        }

        return [detalleFacturaInstance: detalle]
    }

    def show_ajax() {
        def detalle

        if (params.id) {
            detalle = DetalleFactura.get(params.id)
        }

        return [detalleFacturaInstance: detalle]
    }

    def delete_ajax() {
        def detalle

        if (params.id) {
            detalle = DetalleFactura.get(params.id)
            try {
                detalle?.delete(flush: true)
                render "ok"
            } catch (e) {
                println("Error al eliminar detalle: ${e.message}")
                render "no"
            }
        } else {
            render "no"
        }
    }

    def save_ajax() {
        println "Guardar detalle de factura: $params"

        def detalle = params.id ? DetalleFactura.get(params.id) : new DetalleFactura()

        try {
            detalle.factura = Factura.get(params.factura?.id)
            detalle.producto = Producto.get(params.producto?.id)
            detalle.cantidad = params.cantidad?.toInteger()
            detalle.precioVenta = params.precioVenta?.toBigDecimal()

            if (!detalle.save(flush: true)) {
                println("❌ Error al guardar: ${detalle.errors}")
                render text: detalle.errors.allErrors*.defaultMessage.join("; "), contentType: "text/plain"
            } else {
                render text: "ok", contentType: "text/plain"
            }

        } catch (e) {
            println("❌ Excepción al guardar detalle: ${e.message}")
            render text: "Error al procesar los datos del detalle", contentType: "text/plain"
        }
    }

    def buscar_ajax() {
        def criterio = "%${params.criterio}%"

        def detalles = DetalleFactura.createCriteria().list {
            or {
                producto {
                    ilike("nombre", criterio)
                }
                factura {
                    persona {
                        ilike("nombre", criterio)
                    }
                }
            }
        }

        render(template: "buscar_ajax", model: [detalleFacturaList: detalles])
    }
}
