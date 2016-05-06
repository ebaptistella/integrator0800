# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html


RedmineApp::Application.routes.draw do
  scope "/projects/:project_id/integrator0800" do

    get 'task/consult',
        :to => 'task#consult'

    post 'task/consult',
         :to => 'task#consult'

    get 'task/taskRedmineExists/:chamado_nro',
        :to => 'task#taskRedmineExists'

    get 'task/serviceStatus',
        :to => 'service#status'

    post 'task/import',
         :to => 'task#import'

  end
end