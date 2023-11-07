require 'action_mailer'
require 'json'
require 'enveloop'
require 'rails'
require 'enveloop_rails/errors'

module EnveloopRails

  # EnveloopRails::Mailer is an ActionMailer provider for sending mail through Enveloop.
  class Mailer
    # [Hash] config ->
    #   Requires *at least* `api_key`
    attr_accessor :config, :settings

    # Initialize the EnveloopRails mailer.
    #
    # @param [Hash] config Hash of config values, typically from `app_config.action_mailer.enveloop_settings`
    def initialize(config)
      @config = config

      raise EnveloopRails::ConfigurationError.new("Config requires `api_key` key", @config) unless @config.has_key?(:api_key)

      @enveloop_client = Enveloop::Client.new(**config)

      # To avoid exception in mail gem v2.6
      @settings = { return_response: true }
    end

    def deliver!(mail)
      @enveloop_client.send_raw(email: mail.to_s)
    end
  end
end