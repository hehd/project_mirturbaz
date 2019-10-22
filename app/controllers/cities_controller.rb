class CitiesController < ApplicationController

  before_action :find_city, only: [:show, :edit, :update, :destroy]

  def index
    @city = City
    @city = @city.order("id")
  end

  def show
  end

  def create
    @city = City.create(params[:city].permit!)
    if @city.errors.empty?
      redirect_to city_path(@city)
    else
      render "new"
    end
  end

  def new
    @city = City.new
  end

  def edit
  end

  def update
    @city.update_attributes(params[:city].permit!)
    if @city.errors.empty?
      redirect_to city_path(@city)
    else
      render "edit"
    end
  end

  def destroy
    @city.destroy
    redirect_to action: "index"
  end

  private

  def find_city
    @city = City.where(id: params[:id]).first
    render_404 unless @city
  end

end
