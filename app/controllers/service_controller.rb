class ServiceController < SuperclassController
  unloadable

  before_filter :authorize_global
  before_filter :load_project

  def status
    render :json => getServerStatus;
  end
end
