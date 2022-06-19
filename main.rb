require './response'

class DHHPushCount

    attr_accessor :data
    
    POINTS = {
      "IssuesEvent"=> 7,
      "IssueCommentEvent"=> 6,
      "PushEvent"=> 5,
      "PullRequestReviewCommentEvent"=> 4,
      "WatchEvent"=> 3,
      "CreateEvent"=> 2,
    }.tap { |h| h.default = 1 }

    def initialize
      self.data = git_api_call
    end

    def git_api_call
      DHH::RequestResponse.fecth_api_data
    end

    def dhh_score_count
      data.inject(0) { |sum, h| sum + POINTS[h["type"]] }
    end

    def print_dhh_count
      puts "DHH's github score is #{dhh_score_count}" if data
    end
end

DHHPushCount.new.print_dhh_count


