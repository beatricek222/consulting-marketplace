class ContactedsController < ApplicationController
  def index
    matching_contacteds = Contacted.where({ :user_id => @current_user.id })

    @list_of_contacteds = matching_contacteds.order({ :created_at => :desc })

    render({ :template => "contacteds/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_contacteds = Contacted.where({ :id => the_id })

    @the_contacted = matching_contacteds.at(0)

    render({ :template => "contacteds/show.html.erb" })
  end

  def create
    the_contacted = Contacted.new
    the_contacted.user_id = @current_user.id
    the_contacted.other_user_id = params.fetch("query_other_user_id")

    if the_contacted.valid?
      the_contacted.save
      redirect_to("/contacteds", { :notice => "Contacted created successfully." })
    else
      redirect_to("/contacteds", { :alert => the_contacted.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_contacted = Contacted.where({ :id => the_id }).at(0)

    the_contacted.user_id = params.fetch("query_user_id")
    the_contacted.other_user_id = params.fetch("query_other_user_id")

    if the_contacted.valid?
      the_contacted.save
      redirect_to("/contacteds/#{the_contacted.id}", { :notice => "Contacted updated successfully." })
    else
      redirect_to("/contacteds/#{the_contacted.id}", { :alert => the_contacted.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_contacted = Contacted.where({ :other_user_id => the_id }).where({ :user_id => @current_user.id }).at(0)

    the_contacted.destroy

    redirect_to("/contacteds", { :notice => "Contacted deleted successfully." })
  end
end
