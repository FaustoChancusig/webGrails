package geos

class TipoController {

    def list() {
        def tipos = Tipo.list([sort: 'descripcion'])
        return [tipos: tipos]
    }

    def form_ajax() {
        def tipo

        if (params.id) {
            tipo = Tipo.get(params.id)
        } else {
            tipo = new Tipo()
        }
        return [tipoInstance: tipo]
    }

    def show_ajax() {
        def tipo

        if (params.id) {
            tipo = Tipo.get(params.id)
        }
        return [tipoInstance: tipo]
    }

    def delete_ajax() {
        def tipo
        if (params.id) {
            tipo = Tipo.get(params.id)
            tipo.delete(flush: true)
        }
        render "ok"
    }

    def save_ajax() {
        println "guarda tipo: $params"
        def tipo

        if (params.id) {
            tipo = Tipo.get(params.id)
        } else {
            tipo = new Tipo()
        }

        tipo.properties = params

        if (!tipo.save(flush: true)) {
            println("error al guardar tipo: " + tipo.errors)
            render "no"
        } else {
            render "ok"
        }
    }

    def buscar_ajax() {
        def criterio = params.criterio?.trim() ?: ''
        def tipos = Tipo.findAllByDescripcionIlike('%' + criterio + '%')
        return [tipos: tipos]
    }

}
