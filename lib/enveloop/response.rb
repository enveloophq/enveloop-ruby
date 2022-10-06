module Enveloop
  class Response
    attr_reader :status, :message, :error

    def initialize(status: 200, body: nil)
      @status = status

      if status == 200
        @message = JSON.parse(body)
        @error = nil
      elsif status == 500
        @message = nil
        @error = JSON.parse(body)['error']
      else
        @message = nil
        @error = 'Unknown error'
      end
    end

    def success?
      @status == 200
    end
  end
end