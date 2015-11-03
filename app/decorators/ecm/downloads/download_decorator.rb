module Ecm::Downloads
  class DownloadDecorator < Draper::Decorator
    delegate_all

    def ecm_downloads_downloads_count_label
      h.content_tag(:span, ecm_downloads_downloads_count, class: 'badge')
    end

    def filesize
      h.number_to_human_size(asset_file_size)
    end

    def locale_label
      h.content_tag(:span, locale, class: 'label label-info')
    end

    def tree_name
      name
    end

    def display_code
      "<%= render_download '#{self.name}' %>"
    end
  end
end