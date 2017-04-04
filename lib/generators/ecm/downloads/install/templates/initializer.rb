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

  # Adds <notextile> tags around the to fix html output.
  #
  # Default: config.prevent_textile_rendering_in_html = true
  #
  config.prevent_textile_rendering_in_html = true
end
