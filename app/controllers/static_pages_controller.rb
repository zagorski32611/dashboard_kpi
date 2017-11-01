class StaticPagesController < ApplicationController

  before_action :authenticate_user!, only: [:dashboard]

  #require HappyFox_API

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
    @status = HappyFox_API.count_each_status("Closed", "On Hold", "Open", "Unanswered", "New", "Customer Review")

    @unresponded = HappyFox_API.count_unresponded(tickets)

  end

end
