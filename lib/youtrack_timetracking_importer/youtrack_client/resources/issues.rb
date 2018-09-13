module YoutrackTimetrackingImporter
  module Youtrack
    module Issues
      def get_issue(issueId)
        parse_response(get("/issue/#{issueId}"))
      end
    end
  end
end
