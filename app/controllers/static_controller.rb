class StaticController < ApplicationController
  def homepage
    #From property database, pick out top 3 popular properties

    #From Property database, pick out 3 most recent properties
    @recent_properties = Property.order('created_at DESC').limit(3)
  end
end
