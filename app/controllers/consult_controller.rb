class ConsultController < SuperclassController
  unloadable

  before_filter :authorize_global
  before_filter :load_project

  def index

    if request.post?
      @task = resource[self.ActionTaskPreview].post('{"id": ' + params["chamado_nro"] + '}') { |response, request, result, &block|
        case response.code
          when 200
            response
        end }

      if @task.nil?
        flash[:error] = l('mensagem_chamado_nao_encontrado')
        redirect_to :action => 'index'
      else
        @task = JSON.parse(@task);
      end
    end

  end

  def task_redmine_exists
    @task = resource[self.ActionTaskConsult].post('{"id": ' + params["chamado_nro"] + '}') { |response, request, result, &block|
      case response.code
        when 200
          response
      end }

    if @task.nil?
      render :status => 204, :json => {}.to_json
    else
      render :status => 200, :json => @task
    end
  end
end
