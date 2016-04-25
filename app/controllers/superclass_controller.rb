class SuperclassController < ApplicationController

  attr_accessor :Hostname, :ServicePrefix, :ActionServiceStatus, :ActionTaskConsult,
                :ServiceStatus

  def initialize
    super

    getSettings
  end

  private
  def getSettings
    self.Hostname = Setting.plugin_integrator0800['hostname']
    self.ServicePrefix = Setting.plugin_integrator0800['service_prefix']
    self.ActionServiceStatus = Setting.plugin_integrator0800['action_info_service']
    self.ActionTaskConsult = Setting.plugin_integrator0800['action_task_consult']
  end

  def resource
    return RestClient::Resource.new(self.Hostname + self.ServicePrefix, :content_type => :json, :accept => :json)
  end

  def getServerStatus
    return resource[self.ActionServiceStatus].post '', :content_type => :json, :accept => :json
  end

end
