package geos

class PersonaController {

    def list() {
        def personas = Persona.list([sort: 'nombre'])

        return [personas: personas]
    }

    def form_ajax() {
        def persona

        if(params.id) {
            persona = Persona.get(params.id)
        } else {
            persona = new Persona()
        }
        return [personaInstance: persona]
    }

    def show_ajax(){
        def persona

        if(params.id) {
            persona = Persona.get(params.id)
        }
        return [personaInstance: persona]
    }

    def delete_ajax(){
        def persona
        if(params.id){
            persona = Persona.get(params.id)
            Persona.delete(persona);
        }

    }

    def save_ajax(){
        println "guarda persona: $params"
        def persona

        if(params.id){
            persona = Persona.get(params.id)
        }else{
            persona = new Persona()
        }

        def password = persona.password

        persona.properties = params

        if(params.password != password){
            persona.password = params.password.encodeAsMD5()
        }

        println "password antes de grabar ${params.password.encodeAsMD5()}"

        //persona.password = params.password.encodeAsMD5()
        println "password para grabar ${persona.password}"

        if(!persona.save(flush:true)){
            println("error al guardar la persona " + persona.errors)
            render "no"
        }else{
            render "ok"
        }
    }

    def buscar_ajax() {
        //render "Retorno desde buscar_ajax"
        //println "llega: $params"
        def personas = Persona.findAllByNombreIlike('%' + params.criterio + '%')
        //println "personas: $personas"
        return [personas: personas]
    }


}
