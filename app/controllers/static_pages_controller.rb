class StaticPagesController < ApplicationController

  before_action :authenticate_user!, only: [:dashboard]

  # include HappyFoxAPI

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

  end
end
