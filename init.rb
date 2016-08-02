require 'redmine'

Redmine::Plugin.register :integrator0800 do
  name 'Integrator 0800 Plugin'
  author 'Eurides Baptistella/Adriano Baptistella'
  description 'Integração com 0800net'
  version '0.1.1'
  url 'http://ebaptistella.github.io/integrator0800/'
  author_url 'https://about.me/euridesbaptistella'

  requires_redmine :version_or_higher => '3.0.0'
  settings :default => {'empty' => true}, :partial => 'settings/integrator0800'

  project_module :integrator0800 do
    permission :consultar_chamado, {:task => [:consult]}, :require => :member
    permission :importar_chamado, {:task => [:import]}, :require => :member
  end

  menu(:project_menu,
       :integrator0800,
       {:controller => 'task', :action => 'consult'},
       :caption => '0800Net',
       :param => :project_id,
       :after => :activity,
       :if => Proc.new { !Setting.plugin_integrator0800['hostname'].blank? })
end
