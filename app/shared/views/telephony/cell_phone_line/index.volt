{{ content() }}

<div id="errors" class="text-danger"></div>

<div class="card">
    <div class="card-header">
        <h2>Cadastro de Linhas <small>Digite abaixo o cadastro de linha desejada e então clique no botão Buscar.</small></h2>
    </div>
    <div class="card-body card-padding">
        <div class="row">
            {{ form('telephony/cell_phone_line', 'role': 'form', 'method': 'post', 'autocomplete': 'off', 'onsubmit': 'overlay(true)') }}
            <div class="col-sm-6">
                <div class="input-group fg-float">
                    <span class="input-group-addon"><i class="zmdi zmdi-keyboard"></i></span>
                    <div class="fg-line">
                        <input type="text" class="form-control" name="cellPhoneLines" id="cellPhoneLines" value="{{ pesquisa }}" onclick="this.select()" />
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
                    {{ link_to('telephony/cell_phone_line/new', 'Novo', 'class': 'btn btn-success btn-sm m-t-5 waves-effect') }}
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
            {% if cellPhoneLines is not empty %}
            <table class="table table-striped table-vmiddle datatable">
                <thead>
                    <tr>
                        <th data-column-id="id" data-type="numeric">ID</th>
                        <th data-column-id="cpf">CPF</th>
                        <th data-column-id="linha">Linha</th>
                        <th data-column-id="name">Nome</th>
                        <th data-column-id="tipo">Tipo</th>
                        <th data-column-id="descontaFolha">Desc. em Folha?</th>
                        <th data-column-id="cceo">CC/EO</th>
                        <th data-column-id="commands" data-formatter="commands" data-sortable="false">Comandos</th>
                    </tr>
                </thead>
                <tbody>
                    {% for cellPhoneLine in cellPhoneLines %}
                    <tr>
                        <td>{{ cellPhoneLine.id }}</td>
                        <td>{{ cellPhoneLine.cpf }}</td>
                        <td>{{ cellPhoneLine.linha }}</td>
                        <td>{{ cellPhoneLine.name }}</td>
                        <td>{{ cellPhoneLine.tipo }}
                        </td>
                        <td>
                            {% if cellPhoneLine.descontaFolha == "N" %}
                            Não
                            {% else %}
                            Sim
                            {% endif %}
                        </td>
                        <td>{{ cellPhoneLine.cceo }}</td>
                        <td>{{ static_url('telephony/cell_phone_line')}}</td>
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