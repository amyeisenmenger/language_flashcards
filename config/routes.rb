Rails.application.routes.draw do

  root 'dashboard#index'


  get 'words/pick_study_params', to: "words#pick_study_params", as: "pick_study_params"
  devise_for :users
  resources :words
  resources :categories
end
