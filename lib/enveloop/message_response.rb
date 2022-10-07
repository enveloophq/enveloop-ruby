module Enveloop
  class MessageResponse
    attr_reader :status, :message, :error

    def initialize(status: 200, body: nil)
      @status = status

      if status == 200
        @message = JSON.parse(body)
      elsif status == 500
        @error = JSON.parse(body)['error']
      else
        @error = 'Unknown error'
      end
    end

    def success?
      @status == 200
    end
  end
end