class ShortlistsController < ApplicationController
  before_action :set_user
  def index
    #Show all shortlists for the current_user
     #This is the user currently logged in
    @shortlists = @user.shortlists
    @properties = Property.all
  end

  def create
    @shortlist = Shortlist.create property_id:params[:prop_id], user_id:current_user.id
    # Shortlist.create automatically pushes this new shortlist to the property's & user's array
    @current_prop = Property.find(params[:prop_id])

    respond_to do |format|
      format.html { redirect_to @current_prop, notice: 'Property successfully added to shortlist.' }
      format.json { head :no_content }
    end
  end

  def destroy
    Shortlist.find(params[:id]).destroy
    @shortlists = @user.shortlists
    @properties = Property.all
    respond_to do |format|
      format.html { render :_index, notice: 'Property successfully removed from shortlist.' }
      format.json { head :no_content }
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  # def set_shortlist
  #   @shortlist = Shortlist.find(params[:id])
  # end
end
