Rails3Subdomains::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users, :only => [:show, :index]
  constraints(Subdomain) do
    match '/' => 'profiles#show'
   end
   match '/pricing'=>'home#detail_and_pricing'
  root :to => "home#index"
end
