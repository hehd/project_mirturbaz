class CampsController < ApplicationController

  before_action :find_camp, only: [:show, :edit, :update, :destroy]

  def index
    @camp = Camp
    @camp = @camp.includes(city: [ region: :country ]).order("city_id, id")
    @camp = @camp.where("city_id = ?", params[:id])       if params[:id]
  end

  def show
  end

  def create
    @camp = Camp.create(params[:camp].permit!)
    if @camp.errors.empty?
      redirect_to camp_path(@camp)
    else
      render "new"
    end
  end

  def new
    @camp = Camp.new
  end

  def edit
  end

  def update
    @camp.update_attributes(params[:camp].permit!)
    if @camp.errors.empty?
      redirect_to camp_path(@camp)
    else
      render "edit"
    end
  end

  def destroy
    @camp.destroy
    render json: { success: true }
  end

  private

  def find_camp
    @camp = Camp.where(id: params[:id]).first
    render_404 unless @camp
  end

end
