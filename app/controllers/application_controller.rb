class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from ActionController::ParameterMissing do
    render_exception('missing parameters', :unprocessable_entity)
  end

  rescue_from ActiveRecord::RecordInvalid do |e|
    render_exception(e.message, :bad_request)
  end

  private

  def render_exception(error, status)
    render json: { success: false, error: error }, status: status
  end
end
