class StaticPagesController < ApplicationController
  include HappyFoxAPI
  require 'httparty'
  require 'json'

  before_action :authenticate_user!, only: [:dashboard]


  def home
  end

  def help
  end

  def about
  end

  def contact
  end

  def dashboard
    @auth = { :username => 'fea750e8cae545ca89f1fcf34ab972cb',
             :password => 'e8dd80d5095540049e89f9f9f64b2b2a' }
    @data = HTTParty.get("http://avatarfleet.happyfox.com/api/1.1/json/tickets/?size=50&page=1",
                             :basic_auth => @auth, :headers =>{'Content-Type' => 'application/json'})
    @tickets = JSON.parse(@data.body)
  end

  def show(tickets, *statuses)
    @status_counters = Hash.new(0)
    @tickets["data"].each do |tix|
      if statuses.include?(tix["status"]["name"])
        #puts status_counters # this is cool! Run this
        @status_counters[tix["status"]["name"]] += 1
      end
    end
     return @status_counters
  end
  helper_method :show

  def count_unresponded(tickets)
    true_counter = 0
    false_counter = 0
    tickets["data"].each do |tix|
      if tix["unresponded"] == false
        false_counter += 1
      else true_counter += 1
      end
    end
    return "There are #{true_counter} tickets without a response"
    return "There are #{false_counter} ticket with a response"
  end
  helper_method :count_unresponded

  def user_count(users)
    user_count = Hash.new(0)
    @tickets["data"].each do |users|
        if users["user"]["name"] == users["user"]["name"]
          user_count[users["user"]["name"]] += 1
        end
      end
      return user_count
  end
  helper_method :user_count

end
