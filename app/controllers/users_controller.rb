class UsersController < ApplicationController
  before_action :old_date, only: [:index]
  def index
  end

  private

  def old_date
    @old_date = Code.old_date
  end
end
