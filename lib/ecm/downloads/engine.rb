module Ecm
  module Downloads
    class Engine < Rails::Engine 
      # active admin
      initializer :ecm_downloads_engine do
        ::ActiveAdmin.setup do |config|
          config.load_paths += Dir[root.join('app', 'admin')]
          config.register_stylesheet 'ecm_downloads.css'
          # config.register_javascript 'ecm_downloads.js'
        end
      end if Gem::Specification::find_all_by_name('activeadmin').any?
      
      # helpers
      config.to_prepare do
        ApplicationController.helper(Ecm::Downloads::DownloadCategoryHelper)
        ApplicationController.helper(Ecm::Downloads::DownloadHelper)
      end 
    end
  end
end    
