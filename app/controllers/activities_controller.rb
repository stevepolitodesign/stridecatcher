class ActivitiesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_activity, only: [:show, :edit, :update, :destroy]

    def index
        @pagy, @activities = pagy(current_user.activities)
    end

    def show
        authorize @activity
    end

    def new
       @activity = current_user.activities.build(date: Time.zone.now)
    end

    def create
        @activity = current_user.activities.create(activity_params)
        if @activity.save
            redirect_to @activity, notice: "Created Activity"
        else
            render "new"
        end
    end

    def edit
        authorize @activity
    end

    def update
        authorize @activity
        if @activity.update(activity_params)
            redirect_to @activity, notice: "Updated Activity"
        else
            render "edit"
        end
    end

    def destroy
        authorize @activity
        @activity.destroy
        redirect_to activities_path, notice: "Activity Deleted"
    end

    private

        def activity_params
            params.require(:activity).permit(:category, :distance, :difficulty, :unit, :date, :description, :hours, :minutes, :seconds)
        end

        def set_activity
            @activity = Activity.find(params[:id])
        end
end
