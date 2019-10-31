class CitiesController < ApplicationController

  before_action :find_city, only: [:show, :edit, :update, :destroy]

  def index
    @city = City
    @city = @city.includes(:region => :country).order("region_id, id")
    @city = @city.where("region_id = ?", params[:id])       if params[:id]
  end

  def show
  end

  def create
    @city = City.create(params[:city].permit!)
    if @city.errors.empty?
      flash[:success] = "Город успешно добавлен!"
      redirect_to city_path(@city)
    else
      flash.now[:error] = "Такой город уже есть!!!"
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
      flash[:success] = "Город успешно обновлен!"
      redirect_to city_path(@city)
    else
      flash.now[:error] = "Такой город уже есть!!!"
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
