module Enveloop
  class TemplateResponse
    attr_reader :status, :template, :error

    def initialize(status: 200, body: nil)
      @status = status

      if status == 200
        @template = JSON.parse(body)
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