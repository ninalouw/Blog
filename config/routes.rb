Rails.application.routes.draw do
  resources :stars
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'home#index', as: :home
  get '/about' => 'home#about'
  # get '/posts/new' =>'posts#new', as: :new_post
  # post '/posts' => 'posts#create', as: :posts
  # get '/posts' => 'posts#index'
  # get '/posts/:id' => 'posts#show', as: :post
  # get '/posts/:id/edit' => 'posts#edit', as: :edit_post
  # patch '/posts/:id' => 'posts#update'
  # delete '/posts/:id' => 'posts#destroy'
  # get '/posts/:id/comments/new' => 'comments#new', as: :new_post_comment
  # post '/posts/:post_id/comments' => 'comments#create', as: :post_comments
  # delete 'posts/:post_id/comments/:id' => 'comments#destroy'
resources :posts do
  resources :comments
  resources :favourites, only: [:create, :destroy]
  resources :stars, shallow: true, only: [:create, :update, :destroy]
end

  resources :users, only:[:create, :new, :edit, :update] do
    get :favourite_list, on: :collection
  end
  resources :sessions, only:[:new, :create, :update] do
    delete :destroy, on: :collection

end
  resources :passwords, only:[:edit,:update,:new] do
    post :link, on: :collection
    get :forgot_password, on: :collection
    patch :update_password, on: :collection
  end

  resources :tags, only: [:index, :show]

end
