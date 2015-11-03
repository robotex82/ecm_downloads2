module Ecm::Downloads
  module DownloadCategoryHelper
    def render_download_category(download_category_name, options = {})
      download_category = DownloadCategory.where(:name => download_category_name).first.decorate
      if download_category.nil?
        I18n.t('ecm.downloads.download_category.messages.not_found', :name => download_category_name)
      else
        begin
          o = '<notextile>'
          o << render(download_category)
          o << '</notextile>'
          return o.html_safe
        rescue => e
          raise e
        end
      end
    end
  end
end