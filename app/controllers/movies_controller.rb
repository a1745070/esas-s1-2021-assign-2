class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show edit update destroy ]

  # GET /movies or /movies.json
  def index
    @all_ratings = Movie.all_ratings

    session[:ratings] = @ratings = params[:ratings].try(:keys) || session[:ratings] || @all_ratings
    session[:sort] = @sort = params[:sort] || session[:sort]

    if @sort != params[:sort] || @ratings != params[:ratings]
      redirect_to movies_path(sort: @sort, ratings: @ratings)
    else
      @movies = Movie.where(rating: @ratings).order(@sort)
    end
  end

  # GET /movies/1 or /movies/1.json
  def show
    id = params[:id] 
    @movie = Movie.find(id) 
    @id = params[:id] 
     @movie = Movie.find(@id) 
     @director = @movie.director
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies or /movies.json
  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: "Movie was successfully created." }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1 or /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: "Movie was successfully updated." }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1 or /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: "Movie was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  

  def find_movie_by_director
    @movie = Movie.find(params[:id])
    @director= Movie.find_movie_by_director(@movie.director)
    end

    def find_similar_movies
      @movie = Movie.find(params[:id])
      @movies= Movie.find_similar_movies(@movie.movies)
      end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movie_params
      params.require(:movie).permit(:title, :rating, :description, :release_date)
      
    
    end
end