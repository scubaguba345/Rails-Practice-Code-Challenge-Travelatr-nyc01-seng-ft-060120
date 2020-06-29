class DestinationsController < ApplicationController
    before_action :find_destination, only: [:show, :edit, :update]

    def index
        @destinations = Destination.all
    end

    def show

    end

    def new
        @destination = Destination.new
    end

    def create
        destination = Destination.creat (destination_params)
        if destination.valid?
            redirect_to destination_path(destination)
        else     
            flash[:my_errors]= @destination.errors.full_messages
            redirect_to edit_destination_path
        end
    end

    def edit

    end

    def update
        if @destination.update(destination_params)
            redirect_to destination_path(@destination)
        else     
            flash[:my_errors]= @destination.errors.full_messages
            redirect_to edit_destination_path
        end

    end

    private

    def destination_params
        params.require(:destination).permit(:name, :country)
    end

    def find_destination
        @destination = Destination.find(params[:id])
    end

end
