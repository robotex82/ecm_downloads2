module Ecm::Downloads
  module DownloadCategoryHelper
    def render_download_category(download_category_name, _options = {})
      download_category = DownloadCategory.where(name: download_category_name).first.decorate
      if download_category.nil?
        I18n.t('ecm.downloads.download_category.messages.not_found', name: download_category_name)
      else
        begin
          o = Ecm::Downloads::Configuration.prevent_textile_rendering_in_html ? '<notextile>' : ''
          o << render(download_category)
          o << '</notextile>' if Ecm::Downloads::Configuration.prevent_textile_rendering_in_html
          return o.html_safe
        rescue => e
          raise e
        end
      end
    end
  end
end
