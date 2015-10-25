module Ecm::Downloads
  class DownloadCategoryDecorator < Draper::Decorator
    # delegate :root?, :parent_id, :persisted?
    delegate_all

    def ecm_downloads_downloads_count_label
      h.content_tag(:span, ecm_downloads_downloads_count, class: 'badge')
    end

    def locale_label
      h.content_tag(:span, locale, class: 'label label-info')
    end

    def tree_name
      name
    end
  end
end