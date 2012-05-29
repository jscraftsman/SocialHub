class PageController < ApplicationController
  before_filter :authenticate_user!
  def index
    @sent_invites = current_user.friends.where(:status => "pending")
    @friends = current_user.friends.where(:status => "friends")
    @friend_requests = Friend.pending_friends(current_user.id)
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

  def send_friend_request
    if params[:id].to_i  == current_user.id
      redirect_to root_path, :alert => "You cannot add yourself to your friendslist!"
    else
      if current_user.friends.create(:friend_id => params[:id])
        redirect_to page_index_path, :notice => "Friend request sent!"
      else
        redirect_to root_path, :alert => "Friend request failed"
      end
    end
  end

  def accept_friend_request
    if params[:id]
      you = Friend.find(params[:id])
      friend = Friend.new(:user_id => current_user.id, :friend_id => you.user_id, :status => "friends")
      if friend.save && you.update_attributes(:status => "friends")
        redirect_to page_index_path, :notice => "You are now friends"
      else
        redirect_to root_path, :alert => "Failed to add friend"
      end
    else
      redirect_to root_path, :alert => "Failed to add friend!"
    end

  end

  def cancel_friend_request
    if params[:id]
      sent_invite = current_user.friends.find(params[:id])
      if sent_invite && sent_invite.destroy
        redirect_to root_path, :notice => "Friend request canceled"
      else
        redirect_to root_path, :notice => "Friend request was not canceled"
      end
    end
  end

end
