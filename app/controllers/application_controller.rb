class ApplicationController < ActionController::Base
    include Pagy::Backend
    include Pundit
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    
    before_action :set_time_zone, if: :current_user

    private

        def set_time_zone
            Time.zone = current_user.time_zone unless current_user.time_zone.nil?
        end


        def user_not_authorized
            flash[:alert] = "You are not authorized to perform this action."
            redirect_to(request.referrer || root_path)
        end
end
