class HealthCheckController < ApplicationController
  helper_method :current_status

  def index
    @latest_messages = Status.latest
  end

  def current_status
    Status.current_status
  end
end
