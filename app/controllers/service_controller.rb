class ServiceController < SuperclassController
  unloadable

  before_filter :load_project
  #before_filter :authorize

  def status
    render :json => getServerStatus
  end
end
