class StaticPagesController < ApplicationController
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
end
