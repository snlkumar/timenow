Rails3Subdomains::Application.routes.draw do
  
  resources :shifts

  authenticated :user do
    root :to => 'home#index'
  end
   resources :employees,:only=>[:shift] do
     collection do
       get :shift
     end
   end
  resources :managers do
    resources :employees,:except=>[:shift]
  end
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users, :only => [:show, :index]  
  constraints(Subdomain) do
    match '/' => 'profiles#show'
   end
   match '/pricing'=>'home#detail_and_pricing'
  root :to => "home#index"
  get 'twilios/voice' => 'twilios#voice'
  get 'twilios/incoming' => 'twilios#incoming'
  # resources :twilios do
    # collection do
      # post 'incoming'
      # post 'verify'
      # post 'direction'
    # end
  # end
  
end
