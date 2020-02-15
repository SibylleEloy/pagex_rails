class Api::V1::ContentsController < ApplicationController
  def index
    content = Content.all.order(created_at: :desc)
    render json: content
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
    if content
      render json: content
    else
      render json: content.errors
    end
  end

  def destroy
    content&.destroy
    render json: { message: 'Content deleted!' }
  end

  private

  def recipe_params
    params.permit(:name, :image, :ingredients, :instruction)
  end

  def content
    @content ||= Content.find(params[:id])
  end
end
