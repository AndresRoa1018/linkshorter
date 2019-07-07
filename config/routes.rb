Rails.application.routes.draw do

  root 'links#new'

  resources :links
  match "shorter" => 'links#shorter_server', :as => :shorter, :via => :get, format: :json

end
