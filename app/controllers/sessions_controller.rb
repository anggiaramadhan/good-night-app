class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  def create
    @user = User.find_by(name: user_params['name'])
    token = @user.encode_token
    render json: { token: }, status: :ok
  end

  def destroy; end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
