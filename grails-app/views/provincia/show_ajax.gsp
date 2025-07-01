<g:if test="${provincia?.id}">
    <div class="row">
        <div class="col-md-2 show-label">
            Id
        </div>

        <div class="col-md-8">
            <g:fieldValue bean="${provincia}" field="id"/>
        </div>
    </div>
</g:if>
<g:if test="${provincia?.nombre}">
    <div class="row">
        <div class="col-md-2 show-label">
            Nombre
        </div>

        <div class="col-md-8">
            %{--<g:fieldValue bean="${provincia}" field="nombre"/> --}%
            <span style="background-color: #ddd">${provincia?.nombre}</span>
        </div>
    </div>
</g:if>
