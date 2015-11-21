class Ecm::Downloads::Download < ActiveRecord::Base
  # db settings
  self.table_name = 'ecm_downloads_downloads'

  # acts as list
  acts_as_list :scope => :ecm_downloads_download_category

  # acts as published
  include ActsAsPublished::ActiveRecord
  acts_as_published

  # associations
  belongs_to :ecm_downloads_download_category,
             class_name: Ecm::Downloads::DownloadCategory,
             inverse_of: :ecm_downloads_downloads

  # attibutes
  attr_accessible :asset,
                  :description,
                  :ecm_downloads_download_category_id,
                  :name if respond_to? :attr_accessible

  # callbacks
  before_update :fix_updated_position, :if => Proc.new { |d| !position.blank? && d.ecm_downloads_download_category_id_changed? }

  # friendly id
  extend FriendlyId
  friendly_id :name, :use => [:slugged, :finders]

  # paperclip
  has_attached_file :asset, Ecm::Downloads::Configuration.paperclip_options

  # validations
  validates :ecm_downloads_download_category, :presence => true
  validates :name, :presence => true
  validates_attachment :asset, presence => true
  do_not_validate_attachment_file_type :asset


  def human
    name
  end

  def to_s
    human
  end

  private

  def fix_updated_position
    Rails.logger.debug "Fixing positions for #{self.to_s} (Moving to last)"
    add_to_list_bottom
  end
end
