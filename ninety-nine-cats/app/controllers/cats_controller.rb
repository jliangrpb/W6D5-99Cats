class CatsController < ApplicationController
    def index
        @cats = Cat.all
        render json:@cats
    end

    def show
        @cat = Cat.find(params[:id])
        render json:@cat
    end

    def new
        @cat = Cat.new

        render json:@cat
        # render :new
    end

    def edit
        @cat = Cat.find(params[:id])
        render json:@cat
        # render :edit
    end

    def create
        @cat = Cat.new(cat_params)
        if @cat.save
            redirect_to cat_url(@cat)
        else
            render json: @cat.errors.full_messages, status: 422
        end
    end

    def update
        @cat = cat.find(params[:id])

        if @cat.update(cat-params)
            redirect_to cat_url(@cat)
        else
            render json: @cat.errors.full_messages, status: 422
        end
    end
    private
    def cat_params
        params.require(:cat).permit(:birth_date, :color, :name, :sex, :description)
    end
end