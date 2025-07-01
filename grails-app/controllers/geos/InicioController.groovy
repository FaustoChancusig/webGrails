package geos

class InicioController {

    def index() {
        def productos = Producto.list() // si tienes modelo Producto
        [productos: productos]          // esto pasa los productos a la vista
    }
}
