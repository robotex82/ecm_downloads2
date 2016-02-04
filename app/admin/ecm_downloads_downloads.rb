include ActiveAdmin::ActsAsList::Helper if Gem::Specification.find_all_by_name('activeadmin').any?
include ActsAsPublished::ActiveAdminHelper if Gem::Specification.find_all_by_name('activeadmin').any?

ActiveAdmin.register Ecm::Downloads::Download do
  decorate_with Ecm::Downloads::DownloadDecorator

  # acts as list
  sortable_member_actions

  # acts as published
  acts_as_published_actions

  # config
  menu parent: I18n.t('ecm.downloads.active_admin.menu')

  permit_params :asset,
                :description,
                :ecm_downloads_download_category_id,
                :name

  # scopes
  scope :all
  scope :published
  scope :unpublished

  form html: { enctype: 'multipart/form-data' } do |f|
    f.inputs do
      f.input :ecm_downloads_download_category, as: :select,
                                                collection: nested_set_options(Ecm::Downloads::DownloadCategory) { |dc| "#{'-' * dc.level} #{dc.name}" }
      f.input :asset, as: :file
      f.input :name
      f.input :published, as: :boolean
      f.input :description
    end

    f.actions
  end

  index do
    selectable_column
    column :ecm_downloads_download_category
    column :name
    acts_as_published_columns
    column :asset_file_name
    column :asset_file_size, sortable: :asset_file_size do |download|
      number_to_human_size(download.asset_file_size)
    end
    column :created_at
    actions
  end

  show title: :to_s do
    attributes_table do
      row :ecm_downloads_download_category
      row :name
      row :published_at
      row :asset_file_name
      row :filesize
      row :asset_content_type
      row :asset_fingerprint
      row :created_at
      row :updated_at
    end

    panel Ecm::Downloads::Download.human_attribute_name(:description) do
      div do
        ecm_downloads_download.description
      end
    end

    panel Ecm::Downloads::Download.human_attribute_name(:display_code) do
      div do
        ecm_downloads_download.display_code
      end
    end

    panel Ecm::Downloads::Download.human_attribute_name(:link) do
      div do
        ecm_downloads_download_path(ecm_downloads_download)
      end
    end
  end
end if Gem::Specification.find_all_by_name('activeadmin').any?
