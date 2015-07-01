class PaintingsController < ApplicationController
  http_basic_authenticate_with name: 'bjorn', password: '123'
  before_action :find_painting, only: [:show, :edit, :update, :destroy]

  def index
  	@paintings = Painting.all
  end

  def show
  end

  def new
  	@painting = Painting.new
  end

  def create
  	@painting = Painting.new(painting_params)
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

  private

  def find_painting
  	@painting = Painting.find(params[:id])
  end

  def painting_params
  	params.require(:painting).permit(:title, :genre, :painter, :picture)
  end

end
