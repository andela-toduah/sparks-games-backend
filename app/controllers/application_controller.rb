class ApplicationController < ActionController::API
  attr_reader :current_user

  def authenticate_token
    request_auth = RequestAuthorization.call(request.headers, params)
    if request_auth.success?
      @current_user = request_auth.result
    else
      render json: {errors: request_auth.errors}, status: :unauthorized
    end
  end
end
