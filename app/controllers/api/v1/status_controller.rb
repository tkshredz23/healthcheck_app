class Api::V1::StatusController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_request

  def create
    render json: { success: true}, status: 200 if Status.create!(status_params)
  end

  private

  def status_params
    params.require(:status).permit(:stat, :message)
  end

  def set_default_response_format
    request.format = :json
  end

end
