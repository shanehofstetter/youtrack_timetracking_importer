require 'require_all'
require 'rest-client'
require_rel 'youtrack_timetracking_importer'

module YoutrackTimetrackingImporter
  class Importer
    def initialize(url, username, password)
      @client = Youtrack::Client.new(url, username, password)
    end
  end
end
