class CodesController < ApplicationController
  before_action :move_to_top, except: [:index, :show, :search]
  def index
  end

  def new
  end
  
  private

  def move_to_top
    redirect_to root_path if current_user.admin?
  end
end
