class StaticController < ApplicationController
  def homepage

    @properties = Property.all
    @prop_length = @properties.length
    i = 0
    @top_shortlists = []
    if !@properties.empty?
      #From property database, pick out top 3 popular properties
      @sorted_properties = @properties.sort_by {|prop| prop.shortlists.count}
      @sorted_properties.reverse!

      if @prop_length > 3
          @prop_length = 3
      end

      while i < @prop_length
          @top_shortlists.push(@sorted_properties[i])
          i += 1
      end

      #From Property database, pick out 3 most recent properties
      @recent_properties = Property.order('created_at DESC').limit(3)
    end

    @all_properties = []
    @properties.each { |p| @all_properties.push(p.address) }
  end
end
