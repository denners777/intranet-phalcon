{{ content() }}

<div id="errors" class="text-danger"></div>

<div class="card">
    <div class="card-header">
        <h2>Controladores <small>Digite abaixo o controlador desejado e então clique no botão Buscar.</small></h2>
    </div>
    <div class="card-body card-padding">
        <div class="row">
            {{ form('nucleo/controllers', 'role': 'form', 'method': 'post', 'autocomplete': 'off', 'onsubmit': 'overlay(true)') }}
            <div class="col-sm-6">
                <div class="input-group fg-float">
                    <span class="input-group-addon"><i class="zmdi zmdi-keyboard"></i></span>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="controllers" id="controllers" value="{{ pesquisa }}" onclick="this.select()" />
                        <label class="fg-label">Digite sua pesquisa</label>
                    </div>
                </div>
            </div>
            <div class="col-sm-1">
                <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-sm m-t-5 waves-effect">Buscar</button>
                    <br class="visible-xs-block" />
                    <br class="visible-xs-block" />
                </div>
            </div>
            <div class="col-sm-1 col-sm-offset-4">
                <div class="form-group">
                    {{ link_to('nucleo/controllers/new', 'Novo', 'class': 'btn btn-success btn-sm m-t-5 waves-effect') }}
                    <br class="visible-xs-block" />
                    <br class="visible-xs-block" />
                </div>
            </div>
            {{ end_form() }}
        </div>
    </div>
</div>

<div class="card">
    <div class="card-header">
        Resultado para pesquisa: <span class="text-danger">{{ pesquisa }}</span>
    </div>
    <div class="card-body card-padding">
        <div class="table-responsive">
            {% if controllers is not empty %}
            <table class="table table-striped table-vmiddle datatable">
                <thead>
                    <tr>
                        <th data-column-id="id" data-type="numeric">ID</th>
                        <th data-column-id="title">Título</th>
                        <th data-column-id="slug">Slug</th>
                        <th width='20'>Comandos</th>
                    </tr>
                </thead>
                <tbody>
                    {% for controller in controllers %}
                    <tr>
                        <td>{{ controller.id }}</td>
                        <td>{{ controller.title }}</td>
                        <td>{{ controller.slug }}</td>
                        <td style="white-space: nowrap">
                            {{ link_to('nucleo/controllers/edit/'~controller.id, '<i class="zmdi zmdi-edit"></i>', 'class': 'btn btn-warning btn-sm m-t-5 waves-effect') }}
                            <button type="button" class="btn btn-danger btn-sm m-t-5 waves-effect" onclick="deleteItem('{{ static_url('nucleo/controllers/delete')}}', '{{controller.id}}')"><i class="zmdi zmdi-close-circle"></i></button>
                        </td>
                    </tr>
                    {% endfor %}
                </tbody>
            </table>
            {% else %}
            <table class="table table-striped table-vmiddle">
                <tr><td>Não há dados a exibir</td></tr>
            </table>
            {% endif %}
        </div>
    </div>
</div>
