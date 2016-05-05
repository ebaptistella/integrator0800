class SuperclassController < ApplicationController

  attr_accessor :Hostname, :ServicePrefix, :ActionServiceStatus, :ActionTaskConsult,
                :ActionTaskPreview, :ActionTaskImport, :ProjectId, :RedmineAPIKey, :RedmineAPIUrl

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
    self.ActionTaskPreview = Setting.plugin_integrator0800['action_task_preview']
    self.ActionTaskImport = Setting.plugin_integrator0800['action_task_import']
    self.ProjectId = Setting.plugin_integrator0800['project_id']
    self.RedmineAPIUrl = Setting.plugin_integrator0800['redmine_api_url']
    self.RedmineAPIKey = Setting.plugin_integrator0800['redmine_api_key']
  end

  def resource
    return RestClient::Resource.new(self.Hostname + self.ServicePrefix, :headers => { :content_type => :json, :accept => :json, :'project_id' => self.ProjectId, :'api_url' => self.RedmineAPIUrl, :'api_key' => self.RedmineAPIKey })
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
  end
end
