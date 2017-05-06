module Ecm
  module Downloads
    class DownloadCategory < ActiveRecord::Base
      # associations
      has_many :downloads, -> { order(:position) },
               dependent: :destroy,
               foreign_key: :download_category_id,
               inverse_of: :download_category

      accepts_nested_attributes_for :downloads,
                                    allow_destroy: true

      # attributes
      attr_accessible :description,
                      :downloads_attributes,
                      :downloads_count,
                      :locale,
                      :name,
                      :parent_id,
                      :position,
                      :slug if respond_to? :attr_accessible

      # awesome nested set
      acts_as_nested_set
      default_scope { order('lft ASC') }

      # friendly id
      extend FriendlyId
      friendly_id :name, use: [:slugged]

      # validations
      validates :name, presence: true,
                       uniqueness: { scope: [:parent_id] }

      validates :locale, presence: true,
                         if: :root?

      validates :locale, inclusion: I18n.available_locales.map(&:to_s),
                         if: proc { |cc| cc.locale.present? }

      validates :locale, absence: true,
                         unless: :root?

      def downloads_count
        downloads.count
      end

      def human
        name
      end

      def to_s
        name
      end
    end
  end
end
