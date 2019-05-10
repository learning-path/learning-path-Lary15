class ApiController < ApplicationController
    protect_from_forgery with: :null_session
    include AbstractController::Translation
    
    respond_to :json

    def current_user
        @current_user ||= authenticate_token
    end
    
    private
    
    def authenticate_token
        authenticate_with_http_token do |token, options|
            @user = User.find_by(access_token: token)
            if @user.nil?
                render json: {error: t('unauthorized')}, status: 401
            else
                render json: {usuário: @user.name}
            end
        end
    end
end
