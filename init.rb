require 'redmine'

Redmine::Plugin.register :integrator0800 do
  name 'Integrator 0800 Plugin'
  author 'Eurides Baptistella'
  description 'Integração com 0800'
  version '0.0.1'
  url ''
  author_url 'https://about.me/euridesbaptistella'

  project_module :integrator0800 do
    permission :view_consult, {:consult => [:index]}, :public => false
  end
  settings :default => {'empty' => true}, :partial => 'settings/integrator0800'

  # A new item is added to the project menu
  menu(:project_menu,
    :integrator0800,
    { :controller => 'consult', :action => 'index' },
    :caption => '0800Net',
    :param => :project_id,  
    :if => Proc.new { !Setting.plugin_integrator0800['hostname'].blank? })
end
