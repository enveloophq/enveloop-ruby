module Enveloop
  class Client
    def initialize(api_key:, api_host: 'api.enveloop.com', ssl: true)
      @endpoint = "#{ssl ? 'https' : 'http'}://#{api_host}"
      @api_key = api_key
    end

    def send_message(template:, to:, from:, subject: nil, user_variables: {})
      data = {
        to: to,
        from: from,
        subject: subject,
        userVariables: user_variables
      }

      conn = Faraday.new(
        url: @endpoint,
        headers: {
          "Content-Type" => "application/json",
          "Authorization" => "token #{@api_key}"
        }
      )

      conn.post("/templates/#{template}") do |req|
        req.body = data.to_json
      end
    end
  end
end