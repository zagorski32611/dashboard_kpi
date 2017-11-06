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
    #include HTTParty
    @auth = { :username => 'fea750e8cae545ca89f1fcf34ab972cb',
             :password => 'e8dd80d5095540049e89f9f9f64b2b2a' }
    @data = HTTParty.get("http://avatarfleet.happyfox.com/api/1.1/json/tickets/?size=50&page=1",
                             :basic_auth => @auth, :headers =>{'Content-Type' => 'application/json'})
    @tickets = JSON.parse(@data.body)

    #@counters = HappyFoxAPI.count_each_status(@tickets, "Open", "New", "Closed", "On Hold", "Unanswered")

    #@unresponded = HappyFoxAPI.count_unresponded(@tickets) # doesn't work

  end

  def show
    @counters = HappyFoxAPI.count_each_status(@tickets, "Open", "New", "Closed", "On Hold", "Unanswered")

    #@unresponded = HappyFoxAPI.count_unresponded(@tickets) # doesn't work
  end

end
