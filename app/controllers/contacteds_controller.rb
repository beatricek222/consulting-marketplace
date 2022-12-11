class ContactedsController < ApplicationController
  def index
    matching_contacteds = Contacted.where({ :user_id => @current_user.id })

    @list_of_contacteds = matching_contacteds.order({ :created_at => :desc })

    render({ :template => "contacteds/index.html.erb" })
  end

  def click
    @other_user_id = params["query_other_user_id"]
    render({ :template => "contacteds/form.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_contacteds = Contacted.where({ :id => the_id })

    @the_contacted = matching_contacteds.at(0)

    render({ :template => "contacteds/show.html.erb" })
  end

  def create
    require "mailgun-ruby"

    the_contacted = Contacted.new
    the_contacted.user_id = @current_user.id
    the_contacted.other_user_id = params.fetch("query_other_user_id")
    other_email = User.where({ :id => the_contacted.other_user_id })[0].email

    subject = params.fetch("query_subject")
    email_body = params.fetch("query_email")

    if the_contacted.valid?

      # Get your credentials from your Mailgun dashboard, or from Canvas if you're using mine
      mg_api_key = ENV.fetch("MAILGUN_API_KEY")
      mg_sending_domain = ENV.fetch("MAILGUN_SENDING_DOMAIN")

      # Create an instance of the Mailgun Client and authenticate with your API key
      mg_client = Mailgun::Client.new(mg_api_key)

      # Craft your email as a Hash literal with these four keys
      email_info = {
        :from => @current_user.email,
        :to => other_email,  # Put your own email address here if you want to see it in action
        :subject => subject,
        :text => email_body,
      }

      # Send your email!
      mg_client.send_message(mg_sending_domain, email_info)

      the_contacted.save
      redirect_to("/contacteds", { :notice => "Contacted successfully." })
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
