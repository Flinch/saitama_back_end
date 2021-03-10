Rails.application.routes.draw do
  root 'pages#start'
  get '/getanime', to: 'anime#getanime'
end
