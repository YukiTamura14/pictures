Rails.application.routes.draw do
  root to: 'pictures#top'

  resources :pictures
  
  resources :users, only:[:new, :create, :show]
  resources :sessions, only:[:new, :create, :destroy]
  resources :favorites, only:[:create, :destroy, :index]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
