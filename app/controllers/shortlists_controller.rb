class ShortlistsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  def index

    @shortlists = @user.shortlists
    @properties = Property.all

    respond_to do |format|
      format.html { render '/users/registrations/edit.html.erb', locals:{ajax_render:'index'} }
      format.js { render :index}
    end
  end

  def create
    @shortlist = Shortlist.create property_id:params[:prop_id], user_id:current_user.id
    # Shortlist.create automatically pushes this new shortlist to the property's & user's array
    @current_prop = Property.find(params[:prop_id])

    respond_to do |format|
      format.html { redirect_to @current_prop, notice: 'Property successfully added to shortlist.' }
      format.json { head :no_content }
      format.js {}
    end
  end

  def destroy
    Shortlist.find(params[:id]).destroy
    @shortlists = @user.shortlists
    @properties = Property.all
    @property = Property.find(params[:prop_id])
    respond_to do |format|
      format.html { render './users/registrations/edit', locals:{ajax_render:'index'}, notice: 'Property successfully removed from shortlist.' }
      format.json { head :no_content }
      format.js {}
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
