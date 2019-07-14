Rails.application.routes.draw do

  root 'links#new'

  resources :links
  match "shorter" => 'links#shorter_server', :as => :shorter, :via => :get, format: :json

  get "shortened/:shorted_link", to: "links#shortened", as: :shortened, format: :json
  get "/links/fetch_original_url"

end
