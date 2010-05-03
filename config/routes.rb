ActionController::Routing::Routes.draw do |map|
  map.resources :plugins, :has_many => :ratings
  map.resources :categories
  map.root  :controller => :'plugins'
end
