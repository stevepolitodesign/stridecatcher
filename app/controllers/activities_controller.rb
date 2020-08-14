class ActivitiesController < ApplicationController
    before_action :authenticate_user!

    def new
       @activity = current_user.activities.build
    end

    def create
        @activity = current_user.activities.create(activity_params)
        if @activity.save
            redirect_to @activity, notice: "Created Activity"
        else
            render "new"
        end
    end

    private

        def activity_params
            params.require(:activity).permit(:duration, :category, :distance, :difficulty, :unit, :date)
        end
end
