class PaintingsController < ApplicationController
  
  before_action :check_if_logged_in
  before_action :find_painting, only: [:show, :edit, :update, :destroy]

  def index
  	@paintings = Painting.all
    @user_id = session[:user_id]
  end

  def show
  end

  def new
  	@painting = Painting.new
  end

  def create
  	@painting = Painting.new(painting_params)
    @painting.user_id = session[:user_id]
  	if @painting.save
  		redirect_to root_path, notice: 'Painting saved to database.'
  	else
  		render 'new'
  	end
  end

  def edit
  end

  def update
  	if @painting.update(painting_params)
  		redirect_to @painting, notice: 'Painting updated successfully.'
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@painting.destroy
  	redirect_to root_path, notice: 'Painting deleted.'
  end

  def like
    like = Like.new
    like.user_id = session[:user_id]
    like.painting_id = params[:id]
    if like.save
      redirect_to '/', notice: 'Like registered!'
    else
      redirect_to '/', notice: 'Could not like.'
    end
  end

  private

  def find_painting
  	@painting = Painting.find(params[:id])
  end

  def painting_params
  	params.require(:painting).permit(:title, :genre, :painter, :picture)
  end

end
