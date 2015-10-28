Ecm::Downloads.configure do |config|
  # Paperclip options
  #
  # default:  config.paperclip_options = {
  #           }
  config.paperclip_options = {
  }

  # Set the base controller for the contact form
  #
  # Default: config.base_controller = 'ApplicationController'
  #
  config.base_controller = 'ApplicationController'

  # Set the css classes for the download categories table
  #
  # Default: config.download_categories_table_classes = 'table table-striped table-hover'
  #
  config.download_categories_table_classes = 'table table-striped table-hover'

  # Set the css classes for the downloads table
  #
  # Default: config.downloads_table_classes = 'table table-striped table-hover'
  #
  config.downloads_table_classes = 'table table-striped table-hover'
end
