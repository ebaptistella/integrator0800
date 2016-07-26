class TaskController < SuperclassController
  unloadable

  before_filter :authorize_global
  before_filter :load_project

  def consult

    if request.post?
      if (params["tipo_consulta"].eql?  "tarefa")
        req = self.ActionTask2Consult
      else
        req = self.ActionTask1Consult
      end


      @task = resource[req].post('{"id": ' + params["registro_nro"] + '}') { |response, request, result, &block|
        case response.code
          when 200
            response
        end }

      if @task.nil?
        flash[:error] = l('mensagem_registro_nao_encontrado')
        redirect_to :action => 'consult'
      else
        @task = JSON.parse(@task);
      end
    end

  end

  def import
    @task = resource[self.ActionTask2Import].post('{"id": ' + params["id"] + '}') { |response, request, result, &block|
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
      flash[:notice] = l('mensagem_registro_importado')
      redirect_to :controller => :issues, :action => :show, :id => success['id']
    end
  end

end
