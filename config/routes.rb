Rails.application.routes.draw do
  root 'movies#index'
   
  # /movies/findmoviebydirector => movies#find_movie_by_director
 
  resources :movies
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

# end