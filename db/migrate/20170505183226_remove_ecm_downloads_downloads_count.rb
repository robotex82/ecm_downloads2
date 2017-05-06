class RemoveEcmDownloadsDownloadsCount < ActiveRecord::Migration[4.2]
  def change
    remove_column :ecm_downloads_download_categories, :ecm_downloads_downloads_count
  end
end
