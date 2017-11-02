class Hfapi_v1_Controller < ApplicationController
  protect_from_forgery with: :null_session

  before_action :destroy_session

  before_action :authenticate_user!, only: [:happyfox]

  def index
    #format :json
    @auth = { :username => 'fea750e8cae545ca89f1fcf34ab972cb',
             :password => 'e8dd80d5095540049e89f9f9f64b2b2a' }
    @tickets = HTTParty.get("http://avatarfleet.happyfox.com/api/1.1/json/tickets/?show_updates=0",
                             :basic_auth => auth, :headers =>{'Content-Type' => 'application/json'} )
    @counters = show("On Hold", "Open")
  end

    def show(tickets, *statuses)
      @status_counters = Hash.new(0)
      tickets["data"].each do |tix|
        if statuses.include?(tix["status"]["name"])
          #puts status_counters # this is cool! Run this
          @status_counters[tix["status"]["name"]] += 1
        end
      end
      @status_counters
    end

  def destroy_session
    request.session_options[:skip] = true
  end
end
