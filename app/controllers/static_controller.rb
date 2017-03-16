class StaticController < ApplicationController
  def homepage
    #From property database, pick out top 3 popular properties

    @properties = Property.all
    @sorted_properties = @properties.sort_by {|prop| prop.shortlists.count}
    @sorted_properties.reverse!
    @top_shortlists = [@sorted_properties[0], @sorted_properties[1], @sorted_properties[2]]

    #From Property database, pick out 3 most recent properties
    @recent_properties = Property.order('created_at DESC').limit(3)

    @all_properties = []
    @properties.each { |p| @all_properties.push(p.address) }
  end
end
