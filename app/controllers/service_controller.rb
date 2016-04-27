class ServiceController < SuperclassController
  unloadable

  def status
    render :json => getServerStatus;
  end
end
