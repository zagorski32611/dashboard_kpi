module HappyFoxAPI

  def self.count_each_status(tickets, *statuses)
    @status_counters = Hash.new(0)
    tickets["data"].each do |tix|
      if statuses.include?(tix["status"]["name"])
        #puts status_counters # this is cool! Run this
        @status_counters[tix["status"]["name"]] += 1
      end
    end
    puts @status_counters
  end

  # Count tickets with and without a response

  def self.count_unresponded(tickets)
    true_counter = 0
    false_counter = 0
    @tickets["data"].each do |tix|
      if tix["unresponded"] == false
        false_counter += 1
      else true_counter += 1
      end
    end
    puts "There are #{true_counter} tickets without a response"
    puts "There are #{false_counter} ticket with a response"
  end

  # Make a function that creates a count of tickets by user

    def self.user_count(users)
      user_count = Hash.new(0)
      @tickets["data"].each do |users|
          if users["user"]["name"] == users["user"]["name"]
            user_count[users["user"]["name"]] += 1
          end
        end
        puts user_count
    end

end
=begin
puts count_each_status("Closed", "On Hold", "Open", "Unanswered", "New", "Customer Review")
puts user_count($tickets)
puts count_unresponded($data)
=end
