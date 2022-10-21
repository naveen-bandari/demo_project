# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]

  # GET /articles or /articles.json
  def index
    @articles = Article.all
    render json: { articles: @articles }, status: :ok
  end

  # GET /articles/1 or /articles/1.json
  def show
    render json: @article, status: :ok
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit; end

  # POST /articles or /articles.json
  def create
    @article = Article.new(article_params)
    @article.save!
    render json: @article, status: :created

    # respond_to do |format|
    #   if @article.save
    #     format.html { redirect_to article_url(@article), notice: "Article was successfully created." }
    #     format.json { render :show, status: :created, location: @article }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @article.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    @article.update(article_params)
    render json: @article, status: :ok
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy
    head :no_content # status :204
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def article_params
    params.fetch(:article, {}).permit(:title, :description)
  end
end
