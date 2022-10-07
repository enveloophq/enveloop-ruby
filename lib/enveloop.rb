require "faraday"
require "json"

require "enveloop/version"
require 'enveloop/client'
require 'enveloop/message_response'
require 'enveloop/template_response'

module Enveloop
  class Error < StandardError; end
end
