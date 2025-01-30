class ReviewsController < ApplicationController

    #
    def index
        @reviews = Review.all
    end

    def new
        @review = Review.new
    end     
    
    def show 
        @review = Review.find(params[:id])
        
    end

    def create 
        @review = Review.new(review_params)

        if @review.save
            redirect_to @review, notice: "review created successfully"
        else
            render :new ,status: :unprcoessable_entity
        end
    end

    def review_params
        params.require(:review).permit(:review)
    end
end
