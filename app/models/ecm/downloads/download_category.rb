class Ecm::Downloads::DownloadCategory < ActiveRecord::Base
  # db settings
  self.table_name = 'ecm_downloads_download_categories'

  # associations
  has_many :ecm_downloads_downloads, -> { order(:position) },
           :class_name => Ecm::Downloads::Download,
           :dependent => :destroy,
           :foreign_key => :ecm_downloads_download_category_id,
           inverse_of: :ecm_downloads_download_category

  accepts_nested_attributes_for :ecm_downloads_downloads,
                                :allow_destroy => true

  # attributes
  attr_accessible :description,
                  :ecm_downloads_downloads_attributes,
                  :ecm_downloads_downloads_count,
                  :locale,
                  :name,
                  :parent_id,
                  :position,
                  :slug if respond_to? :attr_accessible

  # awesome nested set
  acts_as_nested_set
  default_scope  { order('lft ASC') }

  # friendly id
  extend FriendlyId
  friendly_id :name, :use => [:slugged, :finders]

  # validations
  validates :name, :presence => true,
                   :uniqueness => { :scope => [ :parent_id ] }

  validates :locale, :presence => true,
                     :if => :root?

  validates :locale, :inclusion => I18n.available_locales.map(&:to_s),
                     :if => Proc.new { |cc| cc.locale.present? }

  validates :locale, :absence => true,
                     :unless => :root?

  def human
    name
  end

  def to_s
    name
  end
end
