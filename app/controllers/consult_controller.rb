class ConsultController < SuperclassController
  unloadable

  def index

    if request.post?
      @task = resource[self.ActionTaskConsult].post('{"id": ' + params["chamado_nro"] + '}', :content_type => :json, :accept => :json){ |response, request, result, &block|
      case response.code
        when 200
          response
      end}

      if @task.nil?
        flash[:error] = l('mensagem_chamado_nao_encontrado')
      end

      redirect_to :action => 'index'
    end

  end


  def show
  end

end
