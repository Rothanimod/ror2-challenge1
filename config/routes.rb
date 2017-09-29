Rails.application.routes.draw do
  resources :products
  namespace :api, defaults: { format: :json }  do
      namespace :v1 do
        resources :products, :only => [:show, :index]
      end

    end

end
