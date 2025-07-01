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
        <g:form class="form-horizontal" name="frmPersona" role="form" controller="persona"
                action="save_ajax" method="POST">
            <div class="form-group row ${hasErrors(bean: personaInstance, field: 'nombre', 'error')} ${hasErrors(bean: personaInstance, field: 'apellido', 'error')} required">
                <div class="col-md-6">
                    <span class="grupo">
                        <label for="nombre" class="col-md-4 control-label">
                            Nombre
                        </label>

                        <div class="col-md-12">
                            <g:textField name="nombre" maxlength="40" minlength="3"
                                         required="" class="form-control input-sm required"
                                         value="${personaInstance?.nombre}"/>
                        </div>
                    </span>
                </div>

                <div class="col-md-6">
                    <span class="grupo">
                        <label for="apellido" class="col-md-4 control-label">
                            Apellido
                        </label>

                        <div class="col-md-12">
                            <g:textField name="apellido" maxlength="40" minlength="3" required=""
                                         class="form-control input-sm required" value="${personaInstance?.apellido}"/>
                        </div>
                    </span>
                </div>
            </div>

            <div class="form-group row ${hasErrors(bean: personaInstance, field: 'cedula', 'error')}">
                <div class="col-md-6">
                    <span class="grupo">
                        <label for="cedula" class="col-md-4 control-label">
                            Cédula
                        </label>

                        <div class="col-md-10">
                            <g:textField name="cedula" maxlength="10" minlength="10"
                                         class="form-control input-sm required digits"
                                         value="${personaInstance?.cedula}"/>
                        </div>
                    </span>
                </div>

                <div class="col-md-6">
                    <span class="grupo">
                        <label for="sexo" class="col-md-4 control-label">
                            Sexo
                        </label>

                        <div class="col-md-12">
                            <g:select name="sexo" from="${['F': 'Femenino', 'M': 'Masculino']}" required=""
                                      optionKey="key" optionValue="value"
                                      class="form-control input-sm required" value="${personaInstance?.sexo}"/>
                        </div>
                    </span>
                </div>
            </div>

            <div class="form-group row ${hasErrors(bean: personaInstance, field: 'mail', 'error')} ${hasErrors(bean: personaInstance, field: 'telefono', 'error')} ">
                <div class="col-md-12 row">
                    <div class="col-md-3">
                        <label for="mail" class="control-label" style="width: 100%; text-align: right">
                            E-mail
                        </label>
                    </div>

                    <div class="col-md-9">
                        <div class="input-group input-group-sm"><span class="input-group-addon"><i
                                class="fa fa-envelope"></i>
                        </span><g:field type="email" name="mail" maxlength="63"
                                        class="form-control input-sm unique noEspacios"
                                        value="${personaInstance?.mail ?: '@empresa.com'}"/>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-group row ${hasErrors(bean: personaInstance, field: 'mail', 'error')} ${hasErrors(bean: personaInstance, field: 'telefono', 'error')} ">
                <div class="col-md-12 row">
                    <div class="col-md-2">
                        <label for="telefono" class="col-md-2 control-label">
                            Teléfono
                        </label>
                    </div>

                    <div class="col-md-4">
                        <g:textField name="telefono" maxlength="31" class="form-control input-sm digits"
                                     value="${personaInstance?.telefono}"/>
                    </div>
                </div>
            </div>

            <div class="form-group row ${hasErrors(bean: personaInstance, field: 'direccion', 'error')} ">
                <div class="col-md-12 row">
                    <div class="col-md-3">
                        <label for="direccion" class="col-md-2 control-label">
                            Dirección
                        </label>
                    </div>

                    <div class="col-md-9">
                        <g:textArea name="direccion" cols="80" rows="2" maxlength="255"
                                    class="form-control input-sm" value="${personaInstance?.direccion}"
                                    style="resize: none"/>
                    </div>
                </div>
            </div>

            <div class="form-group row ${hasErrors(bean: personaInstance, field: 'activo', 'error')}">
                <div class="col-md-12">
                    <span class="row">

                        <label for="activo" class="col-md-2 control-label">
                            Activo
                        </label>

                        <div class="col-md-2">
                            <g:select name="activo" value="${personaInstance.activo}"
                                      class="form-control input-sm required" required=""
                                      from="${[1: 'Sí', 0: 'No']}" optionKey="key" optionValue="value"/>
                        </div>

                    </span>
                </div>
            </div>

            <div class="form-group row ${hasErrors(bean: personaInstance, field: 'login', 'error')} ${hasErrors(bean: personaInstance, field: 'password', 'error')}">
                <g:hiddenField name="id" value="${personaInstance?.id}"/>

                <div class="col-md-6">
                    <span class="grupo">
                        <label for="login" class="col-md-4 control-label">
                            Usuario
                        </label>

                        <div class="col-md-8">
                            <div class="input-group input-group-sm">
                                <span class="input-group-addon"><i class="fa fa-user"></i>
                                </span>
                                <g:field type="login" name="login" maxlength="15" minlength="4" style=""
                                         class="form-control input-sm noEspacios required"
                                         value="${personaInstance?.login ?: ''}"/>
                            </div>
                        </div>
                    </span>
                </div>

                <div class="col-md-6">
                    <span class="grupo">
                        <label for="password" class="col-md-4 control-label">
                            Password
                        </label>

                        <div class="col-md-8">
                            <div class="input-group input-group-sm"><span class="input-group-addon"><i
                                    class="fa fa-key"></i>
                            </span><g:field type="password" name="password" maxlength="63"
                                            class="form-control input-sm noEspacios required"
                                            value="${personaInstance?.password ?: ''}"/>
                            </div>
                        </div>
                    </span>
                </div>
            </div>

        </g:form>

    </div>

</g:else>