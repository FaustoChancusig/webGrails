package geos

class ProvinciaService {

    def list(params) {
        return Provincia.list(params)
    }

    def count() {
        return Provincia.count()
    }

    def get(Long id) {
        return Provincia.get(id)
    }

    def save(Provincia provincia) {
        provincia.save(flush: true)
    }

    def delete(Long id) {
        def provincia = Provincia.get(id)
        if (provincia) {
            provincia.delete(flush: true)
        }
    }
}
