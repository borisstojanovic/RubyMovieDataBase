class ActorsController < ApplicationController
  before_action :set_actor, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :is_authorized!, except: %i[index show]

  # GET /actors or /actors.json
  def index
    @actors = Actor.all
    if params[:movie]
      @movie = Movie.friendly.find(params[:movie])
      actors = []
      @role = params[:role]
      @list = params[:list]
      if @list == "true"
        @actors.each { |actor|
          if actor.has_acted(@movie)
            actors.append(actor)
          end
        }
      elsif @role == "true"
        @actors.each { |actor|
          unless actor.has_acted(@movie)
            actors.append(actor)
          end
        }
      else
        if @movie.directed_by
          redirect_to movie_path(@movie)
        else
          actors = @actors
        end
      end

      @actors = actors
      puts(@actors)
    end
  end

  # GET /actors/1 or /actors/1.json
  def show
  end

  # GET /actors/new
  def new
    @actor = Actor.new
  end

  # GET /actors/1/edit
  def edit
  end

  # POST /actors or /actors.json
  def create
    @actor = Actor.new(actor_params)

    respond_to do |format|
      if @actor.save
        format.html { redirect_to @actor, notice: "Actor was successfully created." }
        format.json { render :show, status: :created, location: @actor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @actor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /actors/1 or /actors/1.json
  def update
    respond_to do |format|
      if @actor.update(actor_params)
        format.html { redirect_to @actor, notice: "Actor was successfully updated." }
        format.json { render :show, status: :ok, location: @actor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @actor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /actors/1 or /actors/1.json
  def destroy
    @actor.destroy
    respond_to do |format|
      format.html { redirect_to actors_url, notice: "Actor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_actor
      @actor = Actor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def actor_params
      params.require(:actor).permit(:firstname, :lastname, :date_of_birth, :bio)
    end
end