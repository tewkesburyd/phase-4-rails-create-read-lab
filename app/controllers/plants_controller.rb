class PlantsController < ApplicationController

    def index
        render json: Plant.all
    end

    def show
        plant = Plant.find_by(id: params[:id])
        if plant
            render json: plant
        else
            render json: {error: 'not found'}, status: :not_found
        end
    end

    def create
        plant = Plant.create(plant_params)
        if plant
            render json: plant, status: :created
        else
            render json: {error: 'not found'}, status: :not_found
        end
    end

    private

    def plant_params
        params.permit(:name, :image, :price)
    end
end
