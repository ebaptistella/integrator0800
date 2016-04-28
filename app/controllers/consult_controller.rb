class ConsultController < SuperclassController
  unloadable

  def index

    if request.post?
      @task = resource[self.ActionTaskPreview].post('{"id": ' + params["chamado_nro"] + '}', :content_type => :json, :accept => :json) { |response, request, result, &block|
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


  def show
  end

end
