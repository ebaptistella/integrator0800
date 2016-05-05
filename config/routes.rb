# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html


RedmineApp::Application.routes.draw do
  scope "/projects/:project_id/integrator0800" do

    get 'consult',
        :to => 'consult#index'

    post 'consult',
         :to => 'consult#index'

    get 'consult/task_redmine_exists/:chamado_nro',
        :to => 'consult#task_redmine_exists'

    get 'service/status',
        :to => 'service#status'

  end
end