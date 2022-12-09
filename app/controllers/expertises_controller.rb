class ExpertisesController < ApplicationController
  def index
    matching_expertises = Expertise.all

    @list_of_expertises = matching_expertises.order({ :created_at => :desc })

    render({ :template => "expertises/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_expertises = Expertise.where({ :id => the_id })

    @the_expertise = matching_expertises.at(0)

    render({ :template => "expertises/show.html.erb" })
  end

  def create
    the_expertise = Expertise.new
    the_expertise.name = params.fetch("query_name")

    if the_expertise.valid?
      the_expertise.save
      redirect_to("/expertises", { :notice => "Expertise created successfully." })
    else
      redirect_to("/expertises", { :alert => the_expertise.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_expertise = Expertise.where({ :id => the_id }).at(0)

    the_expertise.name = params.fetch("query_name")

    if the_expertise.valid?
      the_expertise.save
      redirect_to("/expertises/#{the_expertise.id}", { :notice => "Expertise updated successfully."} )
    else
      redirect_to("/expertises/#{the_expertise.id}", { :alert => the_expertise.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_expertise = Expertise.where({ :id => the_id }).at(0)

    the_expertise.destroy

    redirect_to("/expertises", { :notice => "Expertise deleted successfully."} )
  end
end
