module Ecm::Downloads
  module DownloadHelper
    def render_download(download_name, options = {})
      download = Download.where(:name => download_name).first.decorate
      if download.nil?
        I18n.t('ecm.downloads.download.messages.not_found', :name => download_name)
      else
        begin
          o = Ecm::Pictures::Configuration.prevent_textile_rendering_in_html ? '<notextile>' : ''
          o << render(download)
          o << '</notextile>' if Ecm::Pictures::Configuration.prevent_textile_rendering_in_html
          return o.html_safe
        rescue => e
          raise e
        end
      end
    end
  end
end