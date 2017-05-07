Ecm::Downloads::Engine.routes.draw do
  localized do
    scope :ecm_downloads do
      resources :download_categories, only: [:index, :show]
      resources :downloads,           only: [:index, :show] do
        get :download, on: :member
      end
      root to: 'download_categories#index'
    end
  end
end
