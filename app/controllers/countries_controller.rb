class CountriesController < ApplicationController

  before_action :find_item, only: [:show, :edit, :update, :destroy]

  def index
    @country = Country
    @country = @country.order("id")
  end

  def show
  end

  def create
    @country = Country.create(params[:country].permit!)
    if @country.errors.empty?
      flash[:success] = "Страна успешно добавлена!"
      redirect_to country_path(@country)
    else
      flash.now[:error] = "Такая страна уже есть!!!"
      render "new"
    end
  end

  def new
    @country = Country.new
  end

  def edit
  end

  def update
    @country.update_attributes(params[:country].permit!)
    if @country.errors.empty?
      flash[:success] = "Страна успешно обновлена!"
      redirect_to country_path(@country)
    else
      render "edit"
    end
  end

  def destroy
    @country.destroy
    redirect_to action: "index"
  end

  private

  def find_item
    @country = Country.where(id: params[:id]).first
    render_404 unless @country
  end

end
