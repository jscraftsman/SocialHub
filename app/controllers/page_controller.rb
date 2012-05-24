class PageController < ApplicationController
  before_filter :authenticate_user!
  def index
  end

  def profile
    if params[:id]
      @user = User.find(params[:id]);
    else
      @user = current_user
    end
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

  def add_friend
    if current_user.friends.create(:status => "pending")
      redirect_to page_index_path, :notice => "Added"
    else
      render "search", :alert => "Failed"
    end
  end
end
