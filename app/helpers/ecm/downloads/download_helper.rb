module Ecm::Downloads
  module DownloadHelper
    def render_download(download_name, options = {})
      download = Download.where(:name => download_name).first
      if download.nil?
        I18n.t('ecm.downloads.download.messages.not_found', :name => download_name)
      else
        render download
      end
    end
  end
end