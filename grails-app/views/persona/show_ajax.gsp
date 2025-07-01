<%@ page import="geos.Perfil; geos.Persona" %>

<style type="text/css">

option[selected] {
    background-color: yellow;
}

</style>

<g:if test="${!personaInstance}">
    <elm:notFound elem="Persona" genero="o"/>
</g:if>
<g:else>

    <div class="modal-contenido">
        <div class="form-group row ${hasErrors(bean: personaInstance, field: 'nombre', 'error')} ${hasErrors(bean: personaInstance, field: 'apellido', 'error')} required">
            <div class="col-md-6 row">
                <div class="col-md-4">
                        Nombre
                </div>

                <div class="col-md-8">
                    <strong>${personaInstance?.nombre}</strong>
                </div>
                    
            </div>

            <div class="col-md-6 row">
                <div class="col-md-4">
                    Apellido
                </div>

                <div class="col-md-8">
                    <strong>${personaInstance?.apellido}</strong>
                </div>
                    
            </div>
        </div>

        <div class="form-group row ${hasErrors(bean: personaInstance, field: 'cedula', 'error')}" style="margin-top:15px">
            <div class="col-md-6 row">
                <div class="col-md-4">
                        Cédula
                </div>

                <div class="col-md-8">
                    <strong>${personaInstance?.cedula}</strong>
                </div>
                    
            </div>

            <div class="col-md-6 row">
                <div class="col-md-4">
                    Sexo
                </div>

                <div class="col-md-8">
                    <strong>${personaInstance?.sexo == 'M' ? 'Masculino' : (personaInstance?.sexo == 'F' ? 'Femenino' : '')}</strong>
                </div>
                    
            </div>
        </div>

        <div class="form-group row ${hasErrors(bean: personaInstance, field: 'mail', 'error')} ${hasErrors(bean: personaInstance, field: 'telefono', 'error')} ">
            <div class="col-md-12 row" style="margin-top:15px">
                <div class="col-md-4">
                    Email
                </div>

                <div class="col-md-8">
                    <strong>${personaInstance?.mail}</strong>
                </div>
            </div>         

            <div class="col-md-12 row" style="margin-top:15px">
                <div class="col-md-4">
                    Dirección
                </div>

                <div class="col-md-8">
                    <strong>${personaInstance?.direccion}</strong>
                </div>
            </div>  

            <div class="col-md-6 row" style="margin-top:15px">
                <div class="col-md-4">
                    Telefono
                </div>

                <div class="col-md-8">
                    <strong>${personaInstance?.telefono}</strong>
                </div>
            </div> 
            <div class="col-md-6 row" style="margin-top:15px">
                <div class="col-md-4">
                    Activo
                </div>

                <div class="col-md-8">
                    <strong>${personaInstance?.activo == 1 ? "Activo" : "Inactivo"}</strong>
                </div>
            </div>  

            <div class="col-md-12 row" style="margin-top:15px">
                <div class="col-md-4">
                    Usuario
                </div>

                <div class="col-md-8">
                    <strong>${personaInstance?.login}</strong>
                </div>
            </div>  
        </div>  
    </div>  

</g:else>