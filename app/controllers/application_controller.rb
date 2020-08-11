class ApplicationController < ActionController::Base
    before_action :set_time_zone, if: :current_user

    private

        def set_time_zone
            Time.zone = current_user.time_zone unless current_user.time_zone.nil?
        end
end
