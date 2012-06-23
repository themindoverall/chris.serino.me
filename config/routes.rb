Serinome::Application.routes.draw do
  root to: 'articles#index'

  match 'blog(/:category)', to: 'articles#index', as: 'blog'
  match 'work(/:category)', to: 'projects#index', as: 'work'

  match 'bio', to: 'pages#bio', as: 'bio'
  match 'contact', to: 'pages#contact', as: 'contact'

  resources :articles
  resources :projects
end
