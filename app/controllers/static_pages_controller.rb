class StaticPagesController < ApplicationController
  require 'Hfapi_call'
  
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
  end

  def show
    @call = HappyFoxAPI.get_new
    @unresponded = HappyFoxAPI.new.count_unresponded(tickets)
    @user_count = HappyFoxAPI.new.user_count(users)
  end


end
