class RecordsController < ApplicationController
  def create
    records = @current_user.clock_in
    if records.present?
      render json: { records: }, status: :ok
    else
      render json: { message: 'failed create clock in' }, status: :internal_server_error
    end
  end

  def update
    record = @current_user.clock_out(params[:id])
    if record.present?
      render json: { message: 'success create clock out' }, status: :ok
    else
      render json: { message: 'failed create clock out' }, status: :internal_server_error
    end
  end
end
