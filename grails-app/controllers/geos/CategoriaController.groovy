package geos

class CategoriaController {

    def list() {
        def categorias = Categoria.list([sort: 'nombre'])
        return [categorias: categorias]
    }

    def form_ajax() {
        def categoria
        if (params.id) {
            categoria = Categoria.get(params.id)
        } else {
            categoria = new Categoria()
        }
        return [categoriaInstance: categoria]
    }

    def show_ajax() {
        def categoria = Categoria.get(params.id)
        return [categoriaInstance: categoria]
    }

    def delete_ajax() {
        def categoria = Categoria.get(params.id)
        try {
            categoria.delete(flush: true)
            render "ok"
        } catch (e) {
            render "no"
        }
    }

    def save_ajax() {
        def categoria
        if (params.id) {
            categoria = Categoria.get(params.id)
        } else {
            categoria = new Categoria()
        }
        categoria.properties = params
        if (!categoria.save(flush: true)) {
            render "no"
        } else {
            render "ok"
        }
    }

    def buscar_ajax() {
        def categorias = Categoria.findAllByNombreIlike("%${params.criterio}%")
        return [categorias: categorias]
    }

}
