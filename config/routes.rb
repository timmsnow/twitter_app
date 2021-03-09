Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/users" => "users#index"
    get "/users/:id" => "users#show"
    post "/users" => "users#create"
    patch "/users/:id" => "users#update"
    delete "/users/:id" => "users#destroy"

    get "/tweets" => "tweets#index"
    get "/tweets/:id" => "tweets#show"
    post "/tweets" => "tweets#create"
    patch "/tweets/:id" => "tweets#update"
    delete "/tweets/:id" => "tweets#destroy"
  end
end
