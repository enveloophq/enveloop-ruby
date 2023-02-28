module Enveloop
  class Client
    def initialize(api_key:, api_host: 'api.enveloop.com', ssl: true)
      @endpoint = "#{ssl ? 'https' : 'http'}://#{api_host}"
      @api_key = api_key
    end

    def send_message(template:, to:, from: nil, subject: nil, template_variables: {})
      data = {
        to: to,
        from: from,
        subject: subject,
        template: template,
        templateVariables: template_variables
      }

      conn = Faraday.new(
        url: @endpoint,
        headers: {
          "Content-Type" => "application/json",
          "Authorization" => "token #{@api_key}",
          "Sdk-Version" => "ruby-#{Enveloop::VERSION}"
        }
      )

      response = conn.post('/messages') do |req|
        req.body = data.to_json
      end

      if response.status == 500
        raise Enveloop::Error.new(JSON.parse(response.body)['error'])
      end

      return MessageResponse.new(status: response.status, body: response.body)
    end

    def template_info(template:)
      conn = Faraday.new(
        url: @endpoint,
        headers: {
          "Content-Type" => "application/json",
          "Authorization" => "token #{@api_key}"
        }
      )

      response = conn.get("/templates/#{template}")

      if response.status == 500
        raise Enveloop::Error.new(JSON.parse(response.body)['error'])
      end
      
      return TemplateResponse.new(status: response.status, body: response.body)
    end
  end
end
