class RegionsController < ApplicationController

  before_action :find_region, only: [:show, :edit, :update, :destroy]

  def index
    @region = Region
    @region = @region.includes(:country).order("country_id, id")
    @region = @region.where("country_id = ?", params[:id])       if params[:id]
  end

  def show
  end

  def create
    @region = Region.create(params[:region].permit!)
    if @region.errors.empty?
      flash[:success] = "Регион успешно добавлен!"
      redirect_to region_path(@region)
    else
      flash.now[:error] = "Такой регион уже есть!!!"
      render "new"
    end
  end

  def new
    @region = Region.new
  end

  def edit
  end

  def update
    @region.update_attributes(params[:region].permit!)
    if @region.errors.empty?
      flash[:success] = "Регион успешно обновлен!"
      redirect_to region_path(@region)
    else
      flash.now[:error] = "Такой регион уже есть!!!"
      render "edit"
    end
  end

  def destroy
    @region.destroy
    redirect_to action: "index"
  end

  private

  def find_region
    @region = Region.where(id: params[:id]).first
    render_404 unless @region
  end

end
