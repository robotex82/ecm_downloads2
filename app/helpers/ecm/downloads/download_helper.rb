module Ecm::Downloads
  module DownloadHelper
    def render_download(download_name, _options = {})
      download = Download.where(name: download_name).first.decorate
      if download.nil?
        I18n.t('ecm.downloads.download.messages.not_found', name: download_name)
      else
        o = Ecm::Downloads::Configuration.prevent_textile_rendering_in_html ? '<notextile>' : ''
        o << render(download)
        o << '</notextile>' if Ecm::Downloads::Configuration.prevent_textile_rendering_in_html
        return o.html_safe
      end
    end
  end
end
