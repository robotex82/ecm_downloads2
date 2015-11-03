module Ecm::Downloads
  module DownloadHelper
    def render_download(download_name, options = {})
      download = Download.where(:name => download_name).first.decorate
      if download.nil?
        I18n.t('ecm.downloads.download.messages.not_found', :name => download_name)
      else
        begin
          o = '<notextile>'
          o << render(download)
          o << '</notextile>'
          return o.html_safe
        rescue => e
          raise e
        end
      end
    end
  end
end