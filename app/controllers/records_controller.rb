class RecordsController < ApplicationController
  def create
    record = @current_user.clock_in
    if record.present?
      render json: { message: 'success create clock in' }, status: :ok
    else
      render json: { message: 'failed create clock in' }, status: :internal_server_error
    end
  end

  def update; end
end
