class UserInterestsController < ApplicationController
  def index
    matching_user_interests = UserInterest.all

    @list_of_user_interests = matching_user_interests.order({ :created_at => :desc })

    render({ :template => "user_interests/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_user_interests = UserInterest.where({ :id => the_id })

    @the_user_interest = matching_user_interests.at(0)

    render({ :template => "user_interests/show.html.erb" })
  end

  def create
    the_user_interest = UserInterest.new
    the_user_interest.expertise_id = params.fetch("query_expertise_id")
    the_user_interest.user_id = params.fetch("query_user_id")

    if the_user_interest.valid?
      the_user_interest.save
      redirect_to("/user_interests", { :notice => "User interest created successfully." })
    else
      redirect_to("/user_interests", { :alert => the_user_interest.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_user_interest = UserInterest.where({ :id => the_id }).at(0)

    the_user_interest.expertise_id = params.fetch("query_expertise_id")
    the_user_interest.user_id = params.fetch("query_user_id")

    if the_user_interest.valid?
      the_user_interest.save
      redirect_to("/user_interests/#{the_user_interest.id}", { :notice => "User interest updated successfully."} )
    else
      redirect_to("/user_interests/#{the_user_interest.id}", { :alert => the_user_interest.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_user_interest = UserInterest.where({ :id => the_id }).at(0)

    the_user_interest.destroy

    redirect_to("/user_interests", { :notice => "User interest deleted successfully."} )
  end
end
