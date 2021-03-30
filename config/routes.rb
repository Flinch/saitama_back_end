Rails.application.routes.draw do
  root 'pages#start'
  get '/getanime', to: 'anime#getanime'
  get '/getuser', to: 'anime#get_user'
  get '/destroysession', to: 'anime#destroy'
end
