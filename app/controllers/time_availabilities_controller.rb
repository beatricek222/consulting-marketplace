class TimeAvailabilitiesController < ApplicationController
  def index
    matching_time_availabilities = TimeAvailability.all

    @list_of_time_availabilities = matching_time_availabilities.order({ :created_at => :desc })

    render({ :template => "time_availabilities/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_time_availabilities = TimeAvailability.where({ :id => the_id })

    @the_time_availability = matching_time_availabilities.at(0)

    render({ :template => "time_availabilities/show.html.erb" })
  end

  def create
    the_time_availability = TimeAvailability.new
    the_time_availability.description = params.fetch("query_description")

    if the_time_availability.valid?
      the_time_availability.save
      redirect_to("/time_availabilities", { :notice => "Time availability created successfully." })
    else
      redirect_to("/time_availabilities", { :alert => the_time_availability.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_time_availability = TimeAvailability.where({ :id => the_id }).at(0)

    the_time_availability.description = params.fetch("query_description")

    if the_time_availability.valid?
      the_time_availability.save
      redirect_to("/time_availabilities/#{the_time_availability.id}", { :notice => "Time availability updated successfully."} )
    else
      redirect_to("/time_availabilities/#{the_time_availability.id}", { :alert => the_time_availability.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_time_availability = TimeAvailability.where({ :id => the_id }).at(0)

    the_time_availability.destroy

    redirect_to("/time_availabilities", { :notice => "Time availability deleted successfully."} )
  end
end
