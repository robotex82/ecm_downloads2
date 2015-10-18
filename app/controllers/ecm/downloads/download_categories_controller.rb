class Ecm::Downloads::DownloadCategoriesController < Ecm::Downloads::Configuration.base_controller.constantize
  def index
    @download_categories = Ecm::Downloads::DownloadCategory.all
  end

  def show
    @download_category = Ecm::Downloads::DownloadCategory.find(params[:id])
  end
end
