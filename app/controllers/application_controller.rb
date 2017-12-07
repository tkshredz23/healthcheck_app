class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  protect_from_forgery prepend: true

  attr_reader :current_user

  rescue_from ActionController::ParameterMissing do
    render_exception('missing parameters', :unprocessable_entity)
  end

  rescue_from ActiveRecord::RecordInvalid do |e|
    render_exception(e.message, :bad_request)
  end

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end

  private

  def render_exception(error, status)
    render json: { success: false, error: error }, status: status
  end
end
