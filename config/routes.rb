Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "movies#index"

  resources :movies do
  	member do
  		get :theaters
  	end
  end

  resources :bookings do
    member do
      get :book_ticket
    end
    collection do
      post :ticket_checkout
    end
  end

end
