class ShortlistsController < ApplicationController
  before_action :set_user, :set_shortlist
  def index
    #Show all shortlists for the current_user
     #This is the user currently logged in
    @shortlists = @user.shortlists
  end

  def create  #Remember for Property Show view, link the Shortlist button to shortlists_path
    #Write logic to create a shortlist for the current_user logged in
    #Create shortlist
    @shortlist = Shortlist.create property_id:params[:prop_id], user_id:current_user.id

    #Push this instance equipped with these 2 ids into the @user.shortlists
    @user.shortlists.push(@shortlist)
    @user.save
    #Takes in the user id

  end

  def destroy
    @user.shortlists.delete(Shortlist.find(params[:id]))
    @shortlist.destroy

    respond_to do |format|
    format.html { redirect_to shortlists_index_url, notice: 'Property successfully removed from shortlist.' }
    format.json { head :no_content }
    end

  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def set_shortlist
    @shortlist = Shortlist.find(params[:id])
  end
end
