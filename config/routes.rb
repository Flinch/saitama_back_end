Rails.application.routes.draw do
  root 'pages#start'
  get '/getanime', to: 'anime#getanime'
  get '/getuser', to: 'anime#get_user'
  get '/getUserAnime', to: 'anime#getUserAnime'
  get '/userSignup', to: 'anime#userSignup'
  get '/removeAnime', to: 'anime#removeAnime'
end
