class ShoesController < ApplicationController
    before_action :authenticate_user!
    
    before_action :set_shoe, only: [:edit, :update, :destroy]

    def index
        @pagy, @shoes = pagy(current_user.shoes.ordered.alphabetized)
    end

    def new
        @shoe = current_user.shoes.build
    end

    def create
        @shoe = current_user.shoes.create(shoe_params)
        if @shoe.save
            redirect_to shoes_path, notice: "Shoe Created"
        else
            render "new"
        end
    end

    def edit
    end

    def update
        if @shoe.update(shoe_params)
            redirect_to shoes_path, notice: "Shoe Updated"
        else
            render "edit"
        end
    end

    def destroy
        @shoe.destroy
        redirect_to shoes_path, notice: "Shoe Deleted"
    end

    private

        def shoe_params
            params.require(:shoe).permit(:name, :retired, :allowed_distance_in_miles)
        end

        def set_shoe
            @shoe = Shoe.find(params[:id])
        end
end
