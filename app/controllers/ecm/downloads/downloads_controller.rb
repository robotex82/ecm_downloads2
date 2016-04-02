class Ecm::Downloads::DownloadsController < Ecm::Downloads::Configuration.base_controller.constantize
  # Support secured downloads with expiring urls on S3.
  def download
    @download = Ecm::Downloads::Download.published.friendly.find(params[:id]).decorate
    redirect_to @download.asset.expiring_url(100)
  end

  def index
    @downloads = Ecm::Downloads::Download.published.all.decorate
  end

  def show
    @download = Ecm::Downloads::Download.published.friendly.find(params[:id]).decorate
  end
end
