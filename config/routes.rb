# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

get   '/integrator0800/consult',          :to => 'consult#index'
post  '/integrator0800/consult',          :to => 'consult#index'
get   '/integrator0800/configuration',    :to => 'configuration#show'