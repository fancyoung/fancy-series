class SeasonsController < ApplicationController
  before_filter :require_user, :only => [:new, :edit, :create, :update, :destroy]
  
  def new
    @season = Season.new
  end

  def edit
    @season = Season.find(params[:id])
  end

  def create
    episodes_count = params[:season][:episodes_count].to_i

    params[:season][:create_by] = @current_user.id
    params[:season][:update_by] = @current_user.id
    @series = Series.find(params[:series_id])
    @seasons = @series.seasons
    if @seasons.find_by_series_id_and_seq(params[:series_id],params[:season][:seq])
      flash[:notice] = 'season exist!'
      redirect_to series_path(@series)      
    else
      @season = @seasons.create(params[:season])
      1.upto(episodes_count) do |seq|
        Episode.find_or_create_by_season_id_and_seq(@season.id, seq)
      end
      redirect_to series_path(@series)
    end
  end

  def update
    @season = Season.find(params[:id])
    params[:season][:update_by] = @current_user.id
    
    respond_to do |format|
      if @season.update_attributes(params[:season])
        format.html { redirect_to(@season.series, :notice => 'Season was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @season.errors, :status => :unprocessable_entity }
      end
    end

  end

  def destroy
    @season = Season.find(params[:id])
    @season.destroy
    
    respond_to do |format|
      format.html { redirect_to(@season.series) }
      format.xml  { head :ok }
    end
   end
end
