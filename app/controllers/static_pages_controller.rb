class StaticPagesController < ApplicationController
  require 'Hfapi'

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
  end

  def happy_fox_api
    @status = HappyFoxAPI.count_each_status("Closed", "On Hold", "Open", "Unanswered", "New", "Customer Review")
    @unresponded = HappyFoxAPI.count_unresponded(tickets)
    @user_count = HappyFoxAPI.user_count(users)
  end

end
