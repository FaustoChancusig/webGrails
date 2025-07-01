package geos

class ProductoController {

    def list() {
        def productos = Producto.list([sort: 'nombre'])
        return [productos: productos]
    }

    def form_ajax() {
        def producto = params.id ? Producto.get(params.id) : new Producto()
        return [productoInstance: producto]
    }

    def show_ajax() {
        def producto = params.id ? Producto.get(params.id) : null
        return [productoInstance: producto]
    }

    def delete_ajax() {
        def producto = params.id ? Producto.get(params.id) : null
        if (producto) {
            try {
                producto.delete(flush: true)
                render "ok"
            } catch (Exception e) {
                render "no"
            }
        } else {
            render "no"
        }
    }

    def save_ajax() {
        try {
            println "Guardar producto: $params"
            def producto = params.id ? Producto.get(params.id) : new Producto()

            producto.nombre = params.nombre
            producto.descripcion = params.descripcion
            producto.precio = params.precio ? new BigDecimal(params.precio.toString()) : BigDecimal.ZERO
            producto.stock = params.stock ? params.stock.toString().toInteger() : 0

            if (params."categoria.id") {
                producto.categoria = Categoria.get(params."categoria.id".toLong())
            } else {
                println "Categoría no seleccionada"
            }

            if (!producto.save(flush: true)) {
                println("Error al guardar producto: " + producto.errors)
                render "no"
            } else {
                render "ok"
            }
        } catch (Exception e) {
            println "Excepción al guardar producto: ${e.message}"
            e.printStackTrace()
            render "no"
        }
    }


    def buscar_ajax() {
        def criterio = params.criterio?.trim() ?: ""
        def productos = Producto.findAllByNombreIlike("%${criterio}%")
        render(template: "buscar_ajax", model: [productos: productos])
    }
}
