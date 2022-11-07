# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy mark_as_approved inactivate mark_as_liked mark_as_disliked]

  # GET /articles or /articles.json
  def index
    @articles = Article.all
    render json: { articles: @articles, meta: { total: @articles.count } }, status: :ok
  end

  def published
    @articles = Article.where(approved: true, active: true)
    render json: { articles: @articles, meta: { total: @articles.count } }, status: :ok
  end

  # GET /articles/1 or /articles/1.json
  def show
    render json: { article: @article, category: @article.category }, status: :ok
  end

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
    @article.update!(article_params)
    render json: { article: @article, category: @article.category }, status: :ok
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy
    head :no_content # status :204
  end

  def mark_as_approved
    @article.update!(approved: true, active: true)
    render json: { article: @article, category: @article.category }, status: :ok
  end

  def inactivate
    @article.update!(active: false)
    render json: { article: @article, category: @article.category }, status: :ok
  end

  def mark_as_liked
    @article.user_articles.create(user_id: params[:user_id])
    render json: { message: 'Article added to favourites' }, status: :ok
  end

  def mark_as_disliked
    @article.user_articles.find_by(user_id: params[:user_id]).destroy
    render json: { message: 'Article removed from favourites' }, status: :ok
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def article_params
    params.fetch(:article, {}).permit(:title, :description, :category_id)
  end
end
