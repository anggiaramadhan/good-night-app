class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  def create
    @user = User.find_by(name: user_params['name'])
    if @user.present?
      token = @user.encode_token
      render json: { token: }, status: :ok
    else
      render json: { message: 'user not found' }, status: :not_found
    end
  end

  def destroy; end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
