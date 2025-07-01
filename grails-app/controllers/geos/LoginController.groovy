package geos

class LoginController {

    def index() {
        redirect(controller: 'login', action: 'login')
    }

    def login() {
        def usro = session.usuario
        def cn = "inicio"
        def an = "index"
        if (usro) {
            redirect(controller: cn, action: an)
        }
    }

    def validar() {
        println "valida " + params
        println "valida $params"
        def user = Persona.withCriteria {
            eq("login", params.login, [ignoreCase: true])
            eq("activo", 1)
            eq( "password", params.pass.toString().encodeAsMD5() )
        }
        println "usuario: ${user.nombre} pass: ${user.password}"

        def perfil = Sesion.findAllByUsuarioAndFechaFinIsNull(user)
        println "tiene ${perfil.size()}"
        if (perfil.size() > 0) {
//            session.usuario.vaciarPermisos()
            session.usuario = user
            redirect(controller: 'login', action: "perfiles")
            return
        } else {
            flash.message = "No hay perfiles definidos para este usuario"
            redirect(controller: 'login', action: "login")
        }
    }


    def perfiles() {
        def usuarioLog = session.usuario
        def perfilesUsr = Sesion.findAllByUsuarioAndFechaFinIsNull(usuarioLog, [sort: 'perfil'])
        def perfiles = []
        perfilesUsr.each { p ->
            if (p.fechaFin == null) {
                perfiles.add(p.perfil)
            }
        }
        println "---- perfiles ---- ${perfiles} --> ${perfiles.id}"
        return [perfilesUsr: perfiles.sort{it.descripcion}]
    }

    def savePer() {
        println ("entra en el sistema" + params)
        def prfl = Perfil.get(params.prfl)
        if (prfl) {
            session.perfil = prfl
            redirect(controller: 'inicio', action: 'index')
        } else {
            redirect(controller: 'login', action: "login")
        }
    }

    def logout() {
        session.usuario = null
        session.perfil = null
        session.an = null
        session.cn = null
        session.invalidate()

        redirect(controller: 'login', action: 'login')
    }


}
