Ecm::Downloads::Engine.routes.draw do
  localized do
    resources :download_categories, only: [:index, :show]
    resources :downloads,  only: [:index, :show] do
      get :download, on: :member
    end
  end
end
