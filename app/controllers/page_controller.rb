class PageController < ApplicationController
  before_filter :authenticate_user!
  def index
  end

  def profile
  end

  def customize
  end

  def settings
  end

  def search
    @results = User.search(params[:search])
  end

  def news
  end

  def chat
  end

  def jokes
  end

  def inbox
  end
end
