Rails.application.routes.draw do

  devise_for :users
root to:"items#index"
resources :items, only: [:new, :get, :create, :show, :edit, :update, :destroy] do

end
end
