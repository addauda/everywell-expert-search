class FriendsController < ApplicationController
  include ExceptionHandler

  # POST /friends
  def create
    @from_friend = Friend.new
    @from_friend.from_id = friend_params[:member_id]
    @from_friend.to_id = friend_params[:friend_member_id]

    @to_friend = Friend.new
    @to_friend.from_id = friend_params[:friend_member_id]
    @to_friend.to_id = friend_params[:member_id]

    render status: :created if @from_friend.save && @to_friend.save
  end

  def friend_params
    params.permit(:member_id, :friend_member_id)
  end
end
