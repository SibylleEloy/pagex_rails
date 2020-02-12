class Api::V1::ContentsController < ApplicationController
  def index
    content = Content.all.order(created_at: :desc)
    render json: recipe
  end

  def create
    content = Content.create!(content_params)
    if content
      render json: content
    else
      render json: content.errors
    end
  end

  def show
    if recipe
      render json: content
    else
      render json: content.errors
    end
  end

  def destroy
    def destroy
      content&.destroy
      render json: { message: 'Content deleted!' }
  end

  private

  def content_params
    params.permit(:text, :image, :video, :user_id)
  end

  def content
     @content ||= Content.find(params[:id])
   end
end
