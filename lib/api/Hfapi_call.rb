module HappyFoxAPI
  # class StaticPagesController < ApplicationController
  #require 'httparty'

  # require 'json'
=begin
    def self.get_new()
      @auth = { :username => 'fea750e8cae545ca89f1fcf34ab972cb',
               :password => 'e8dd80d5095540049e89f9f9f64b2b2a' }
      @tickets = HTTParty.get("http://avatarfleet.happyfox.com/api/1.1/json/tickets/?show_updates=0",
                               :basic_auth => @auth)
    end
=end
  # Count each status in ONE method

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
