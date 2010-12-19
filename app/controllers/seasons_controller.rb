class SeasonsController < ApplicationController
  before_filter :require_user, :only => [:create, :destroy]

  def create
    params[:season][:create_by] = @current_user.id
    params[:season][:update_by] = @current_user.id
    @series = Series.find(params[:series_id])
    @season = @series.seasons.create(params[:season])
    redirect_to series_path(@series)
  end

  def destroy
  end
end
