class StaticPagesController < ApplicationController
  require '/home/joe/API/dashboard_kpi/lib/api/Hfapi_call'
  require 'httparty'

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
    @tickets = HTTParty.get("http://avatarfleet.happyfox.com/api/1.1/json/tickets/?show_updates=0",
                             :basic_auth => @auth, :headers =>{'Content-Type' => 'application/json'})

    @counters = HappyFoxAPI.count_each_status(@tickets, "Closed", "Open")

    #@unresponded = HappyFoxAPI.count_unresponded(@tickets) # doesn't work

  end



end
