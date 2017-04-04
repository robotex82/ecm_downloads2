class Ecm::Downloads::DownloadCategoriesController < Ecm::Downloads::Configuration.base_controller.constantize
  def index
    @collection = Ecm::Downloads::DownloadCategory.all.decorate
  end

  def show
    @resource = Ecm::Downloads::DownloadCategory.friendly.find(params[:id])
  end
end
