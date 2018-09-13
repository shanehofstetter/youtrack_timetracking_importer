module YoutrackTimetrackingImporter
  module Youtrack
    module WorkItems
      def get_workitems_for_issue(issueId)
        parse_response(get("/issue/#{issueId}/timetracking/workitem"))
      end

      def add_workitem_to_issue(issueId, workItem)
        raise NotImplementedError
        # parse_response(post("/issue/#{issueId}/timetracking/workitem"))
      end
    end
  end
end
