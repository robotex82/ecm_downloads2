module Ecm
  module Downloads
    class Download < ActiveRecord::Base
      # acts as list
      acts_as_list scope: :download_category

      # acts as published
      include ActsAsPublished::ActiveRecord
      acts_as_published

      # associations
      belongs_to :download_category,
               inverse_of: :downloads

      # attibutes
      attr_accessible :asset,
                    :description,
                    :download_category_id,
                    :name if respond_to? :attr_accessible

      # callbacks
      before_update :fix_updated_position, if: proc { |d| !position.blank? && d.category_id_changed? }

      # friendly id
      extend FriendlyId
      friendly_id :name, use: [:slugged]

      # paperclip
      has_attached_file :asset, Ecm::Downloads::Configuration.paperclip_options

      # validations
      validates :download_category, presence: true
      validates :name, presence: true
      validates_attachment :asset, presence: true
      do_not_validate_attachment_file_type :asset

      def human
      name
      end

      def to_s
      human
      end

      private

      def fix_updated_position
        Rails.logger.debug "Fixing positions for #{self} (Moving to last)"
        add_to_list_bottom
      end
    end
  end
end
