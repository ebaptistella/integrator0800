class SuperclassController < ApplicationController

  attr_accessor :Hostname, :ServicePrefix, :ActionServiceStatus, :ActionTask1Consult,
                :ActionTask2Consult, :ActionTask2Import, :ProjectId, :RedmineAPIKey, :RedmineAPIUrl

  def initialize
    super

    getSettings
  end

  private
  def getSettings
    self.Hostname = Setting.plugin_integrator0800['hostname']
    self.ServicePrefix = Setting.plugin_integrator0800['service_prefix']
    self.ActionServiceStatus = Setting.plugin_integrator0800['action_info_service']
    self.ActionTask1Consult = Setting.plugin_integrator0800['action_task1_consult']
    self.ActionTask2Consult = Setting.plugin_integrator0800['action_task2_consult']
    self.ActionTask2Import = Setting.plugin_integrator0800['action_task2_import']
    self.RedmineAPIUrl = Setting.plugin_integrator0800['redmine_api_url']
    self.RedmineAPIKey = Setting.plugin_integrator0800['redmine_api_key']
    self.ProjectId = ''
  end

  def resource
    return RestClient::Resource.new(self.Hostname + self.ServicePrefix, :headers => { :content_type => :json, :accept => :json, 'project_id' => self.ProjectId, 'api_url' => self.RedmineAPIUrl, 'api_key' => self.RedmineAPIKey })
  end

  def getServerStatus
    return resource[self.ActionServiceStatus].post('') { |response, request, result, &block|
      case response.code
        when 200
          response
      end }

  end

  def load_project
    @project = Project.find_by_identifier(params[:project_id])
    if (!@project.nil?)
      self.ProjectId = @project.id
    else
      self.ProjectId = 1
    end
  end
end
