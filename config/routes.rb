Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bloggers, only: [:new, :create, :show, :index]
  resources :destinations, only: [:show]
  resources :posts, only: [:new, :edit, :update, :create, :show]

  patch '/posts/:id/like', to:"posts#like_post", as: "like"
end
