class ToysController < ApplicationController
  wrap_parameters format: []

  def index
    toys = Toy.all
    render json: toys
  end

  def create
    toy = Toy.create(toy_params)
    render json: toy, status: :created
  end

  def update
    toy = Toy.find_by(id: params[:id])
    toy.update(toy_params)
  end

  def destroy
    toy = Toy.find_by(id: params[:id])
    toy.destroy
    head :no_content
  end
  def increment_likes
    toy=Toy.find_by(id: params[:id])
    if toy
      toy.update(likes: toy.likes+1)
      render json: toy
    else
      render json: {error: "Toy not found"}
    end 
  end

  private
  
  def toy_params
    params.permit(:name, :image, :likes)
  end

end
