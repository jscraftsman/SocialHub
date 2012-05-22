Socialhub::Application.routes.draw do
  devise_for :users
  get "page/index"
  get "page/profile"
  get "page/customize"
  get "page/settings"
  get "page/search"
  get "page/news"
  get "page/chat"
  get "page/jokes"
  get "page/inbox"

  authenticated :user do
    root :to => "page#index"
  end
  unauthenticated :user do
    devise_scope :user do
      get "/" => "devise/registrations#new"
    end
  end
end
