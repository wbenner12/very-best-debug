class VenuesController < ApplicationController

  def index
    matching_venues = Venue.all
    @venues = matching_venues.order(:created_at)

    render({ :template => "venue_templates/venue_list" })
  end

  def show
    venue_id = params.fetch("venue_id")
    matching_venues = Venue.where({ :id => venue_id })
    @the_venue = matching_venues.at(0)

    render({ :template => "venue_templates/details" })
  end

  def create
    @the_venue = Venue.new
    @the_venue.address = params.fetch("query_address")
    @the_venue.name = params.fetch("query_name")
    @the_venue.neighborhood = params.fetch("query_neighborhood")
    @the_venue.save

    redirect_to("/venues/#{@the_venue.id}")
  end
  
  def update
    the_id = params.fetch("the_id")

    matching_venues = Venue.where({ :id => the_id })
    @the_venue = matching_venues.at(0)
    @the_venue.address = params.fetch("query_address")
    @the_venue.name = params.fetch("query_name")
    @the_venue.neighborhood = params.fetch("query_neighborhood")
    @the_venue.save
    
    redirect_to("/venues/#{@the_venue.id}")
  end

  def destroy
    the_id = params.fetch("venue_id")
    matching_venues = Venue.where({ :id => the_id })
    venue = matching_venues
    venue.destroy

    redirect_to("/venues")
  end

end
