module Ecm::Downloads
  class DownloadCategoryDecorator < Draper::Decorator
    delegate_all

    def display_code
      "<%= render_download_category '#{name}' %>"
    end

    def ecm_downloads_downloads_count_label
      h.content_tag(:span, ecm_downloads_downloads_count, class: 'badge')
    end

    def locale_label
      h.content_tag(:span, locale, class: 'label label-default')
    end

    def tree_name
      name
    end

    def index_name
      if self.root?
        "[#{self.locale}] #{self.name}"
      else
        "#{'&#160;&#160;&#160;&#160;' * self.level} |--&#160;#{self.name}".html_safe
      end
    end
  end
end