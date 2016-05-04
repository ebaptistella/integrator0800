class ConsultController < SuperclassController
  unloadable

  before_filter :authorize_global

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

end
