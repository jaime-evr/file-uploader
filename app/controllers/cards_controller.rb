class CardsController < ApplicationController
  before_action :find_card, only: [:show, :edit, :update, :destroy]

  def index
    @card = Card.new
    @cards = Card.all
  end

  def create
    @card = Card.new(permited_params)
    if @card.save
      redirect_to @card
    end
  end

  def update
    if @card.update_attributes(permited_params)
      redirect_to @card
    end
  end

  def destroy
    @card.destroy
    redirect_to root_path
  end

  private
  def find_card
    @card = Card.find(params[:id])
  end

  def permited_params
    params.require(:card).permit(:name, :note, :image)
  end
end
