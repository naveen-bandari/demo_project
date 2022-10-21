# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show update destroy]

  # GET /articles or /articles.json
  def index
    @categories = Category.all
    render json: { categories: @categories }, status: :ok
  end

  def create
    @category = Category.new(category_params)
    @category.save!
    render json: { category: @category }, status: :ok
  end

  def show
    render json: { category: @category, articles: @category.articles }, status: :ok
  end

  def update
    @category.update(category_params)
    render json: { category: @category }, status: :ok
  end

  def destroy
    @category.destroy
    head :no_content
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.fetch(:category, {}).permit(:name)
  end
end
