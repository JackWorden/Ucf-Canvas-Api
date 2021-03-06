class UcfCanvasApi
  class Request
    HEADER_PREFIX = 'Bearer '.freeze

    def initialize(token)
      @token = token
    end

    def perform
      request = HTTParty.get(url, headers: header, query: query_params)
      {
          status: request.headers['status'],
          response: request.parsed_response
      }
    end

    private

    attr_reader :token

    def url
      fail NotImplementedError
    end

    def query_params
      {}
    end

    def header
      { 'Authorization' => HEADER_PREFIX + token }
    end
  end
end