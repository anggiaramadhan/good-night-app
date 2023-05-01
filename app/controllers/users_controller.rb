class UsersController < ApplicationController
  def follow
    following = @current_user.follow(params[:id])
    if following.present?
      render json: { message: 'success follow the user' }, status: :ok
    else
      render json: { message: 'failed to follow the user' }, status: :bad_request
    end
  end

  def unfollow
    follow = @current_user.unfollow(params[:id])
    if follow.present?
      render json: { message: 'success unfollow the user' }, status: :ok
    else
      render json: { message: 'failed to unfollow the user' }, status: :bad_request
    end
  end

  def histories
    records = @current_user.friend_records
    if records.present?
      render json: { records: }, status: :ok
    else
      render json: { message: 'failed to fetch all the friends records' }, status: :bad_request
    end
  end
end
