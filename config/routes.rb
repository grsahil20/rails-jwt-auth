Rails.application.routes.draw do
		devise_for :users,
							 path: '',
							 path_names: {sign_in: 'login', sign_out: 'logout', registration: 'signup'},
							 controllers: {sessions: 'sessions', registrations: 'registrations'}



	namespace :api do
		namespace :v1 do
			get "test", to: 'home#test'
			resources :tweets, only: [:index, :show, :create, :destroy]
			resources :users, only: [:index, :show] do
				resources :tweets, only: [:index], controller: 'users/tweets'
			end

			resources :asset_pairs, only: [:index]

		end
	end
end
