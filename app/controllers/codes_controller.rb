class CodesController < ApplicationController
  before_action :move_to_top, except: [:index, :show, :search]
  before_action :set_code, only: [:show, :edit, :update, :destroy]
  before_action :old_date, only: [:index, :show, :search]

  def index
    if params[:category].present?
      @codes = Code.where("category = ?", params[:category])
    else
      @codes = Code.all
    end
  end

  def new
    @code = Code.new
  end

  def create
    @code = Code.new(code_params)
    if @code.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @code.update(code_params)
      redirect_to code_path(@code.id)
    else
      render :edit
    end
  end

  def search
    @codes = Code.search(params[:keyword])
    @keyword = params[:keyword]
  end

  def destroy
    @code.destroy
    redirect_to root_path
  end

  private

  def move_to_top
    redirect_to root_path unless current_user.admin?
  end

  def code_params
    params.require(:code).permit(:codeno, :title, :category, :summary, :detail, :supplement).merge(user_id: current_user.id)
  end

  def set_code
    @code = Code.find(params[:id])
  end

  def old_date
    @old_date = Code.old_date
  end
end
