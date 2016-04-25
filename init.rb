Redmine::Plugin.register :integrator0800 do
  name 'Integrator 0800 plugin'
  author 'Eurides Baptistella'
  description 'Integração com 0800'
  version '0.0.1'
  url 'http://sysmo.com.br'
  author_url 'http://sysmo.com.br'

  settings :default => {'empty' => true}, :partial => 'settings/integrator0800'
  menu :application_menu, :integrator0800, { :controller => 'consult', :action => 'index' }, :caption => 'Integrator 0800'
end
