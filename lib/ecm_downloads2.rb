require 'acts_as_list'
require 'acts_as_published'
require 'awesome_nested_set'
require 'awesome_nested_set-tools'
require 'friendly_id'
require 'paperclip'
require 'draper'

require 'ecm/downloads/engine'
require 'ecm/downloads/configuration'

module Ecm
  module Downloads
    extend Configuration
  end
end
