require_rel 'resources'
require 'json'

module YoutrackTimetrackingImporter
  module Youtrack
    class Client
      include Youtrack::WorkItems
      include Youtrack::Issues

      def initialize(url, username, password)
        @url = url
        @headers = {}

        login(username, password)
        @user = OpenStruct.new(get_current_user)
      end

      # protected

      def get(path, params = {})
        RestClient.get(request_url(path), @headers.merge(params))
      end

      def post(path, payload)
        RestClient.post(request_url(path), payload)
      end

      def get_current_user
        parse_response(get('/user/current'))
      end

      def parse_response(response)
        JSON.parse(response)
      end

      def login(username, password)
        response = RestClient.post(request_url('user/login'),
                                   login: username, password: password)
        @headers = { cookies: response.cookies, accept: :json }
      rescue StandardError => e
        raise "login failed: #{e.message}"
      end

      def request_url(path)
        [@url, path.gsub(/^\//, '')].join('/')
      end
    end
  end
end
