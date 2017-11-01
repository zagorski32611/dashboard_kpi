class StaticPagesController < ApplicationController

  before_action :authenticate_user!, only: [:dashboard]

  include HappyFox_API

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
    @status = count_each_status("Closed", "On Hold", "Open", "Unanswered", "New", "Customer Review")

  end

end
