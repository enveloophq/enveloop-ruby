require 'enveloop_rails/mailer'

module EnveloopRails
  class Railtie < ::Rails::Railtie
    ActiveSupport.on_load(:action_mailer) do
      add_delivery_method :enveloop, EnveloopRails::Mailer
      ActiveSupport.run_load_hooks(:enveloop_mailer, EnveloopRails::Mailer)
    end
  end
end