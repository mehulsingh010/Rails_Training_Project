class Api::V1::ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :update]

  
  def index
    @reviews = Review.all
    render json: @reviews, status: 200
  end  
  
  def show
    if @review 
      render json: @review, status: 200
    else
      render json: {error: "Review not present"},status: 400
    end
  end

  def create 
    @review = Review.new(review_params)
    if @review.save
      render json: {status: "Success",message: "Review Posted Successfully",data: @review},status: :created
    else
      render json: {status: "Error",message: "Review Not Created",errors: @review.errors.full_message},status: :unprocessable_entity
    end
  end

  def update 
    if @review.update(review_params)
      render json: {status: "Success", message: "Review Details Updated Successfully",data: @review}
  else
      render json: {status: "Error",message: "Errors While Updating Turf Details",error: @turf.errors.full_message}, status: :unprcoessable_entity

  end
  end
    

  private 

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.permit(:review, :user_id, :turf_id)
  end

end
