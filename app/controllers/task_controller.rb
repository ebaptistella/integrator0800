class TaskController < SuperclassController
  unloadable

  before_filter :authorize_global
  before_filter :load_project

  def consult

    if request.post?
      @task = resource[self.ActionTaskPreview].post('{"id": ' + params["chamado_nro"] + '}') { |response, request, result, &block|
        case response.code
          when 200
            response
        end }

      if @task.nil?
        flash[:error] = l('mensagem_chamado_nao_encontrado')
        redirect_to :action => 'consult'
      else
        @task = JSON.parse(@task);
      end
    end

  end

  def taskRedmineExists
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

  def import
    @task = resource[self.ActionTaskImport].post('{"id": ' + params["id"] + '}') { |response, request, result, &block|
      case response.code
        when 200
          {:success => response}
        else
          {:error => response}
      end }

    if !@task[:error].nil?
      error = JSON.parse(@task[:error])
      flash[:error] = error['mensagem']
      redirect_to :action => 'consult'
    else
      success = JSON.parse(@task[:success])
      flash[:notice] = l('mensagem_chamado_importado')
      redirect_to :controller => :issues, :action => :edit, :id => success['id']
    end
  end

end
