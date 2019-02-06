Rails.application.routes.draw do
 
  get 'app/app'
 	namespace :api do
    resources :users do
      collection do 
        get 'get(/:query)', action: 'get'
        get 'search(/:query)', action: 'search'
      end
    end 
    
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "app#app" 
  get '/*path' => "app#app"
end
