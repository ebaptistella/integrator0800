require 'redmine'

Redmine::Plugin.register :integrator0800 do
  name 'Integrator 0800 Plugin'
  author 'Eurides Baptistella'
  description 'Integração com 0800net'
  version '0.0.1'
  url 'http://ebaptistella.github.io/integrator0800/'
  author_url 'https://about.me/euridesbaptistella'

  settings :default => {'empty' => true}, :partial => 'settings/integrator0800'

  project_module :integrator0800 do
    permission :consultar_chamado, {:consult => [:index]}, :require => :member
  end

  menu(:project_menu,
       :integrator0800,
       {:controller => 'consult', :action => 'index'},
       :caption => '0800Net',
       :param => :id,
       :after => :activity,
       :if => Proc.new { !Setting.plugin_integrator0800['hostname'].blank? })
end
