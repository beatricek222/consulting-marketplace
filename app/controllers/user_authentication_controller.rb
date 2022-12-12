class UserAuthenticationController < ApplicationController
  # Uncomment line 3 in this file and line 5 in ApplicationController if you want to force users to sign in before any other actions.
  skip_before_action(:force_user_sign_in, { :only => [:sign_up_form, :create, :sign_in_form, :create_cookie] })

  def index
    if @current_user.role_id == 1
      @users = User.where({ :role_id => 2 })
      @q = User.where({ :role_id => 2 }).ransack(params[:q])
      #@q = User.ransack(params[:q])
      @list_of_users = @q.result(:distinct => true).includes(:user_interests)
    else
      @users = User.where({ :role_id => 1 })
     @q = User.where({ :role_id => 1 }).ransack(params[:q])
     #@q = User.ransack(params[:q])
      @list_of_users = @q.result(:distinct => true).includes(:user_interests)
    end
    render({ :template => "user_authentication/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_users = User.where({ :id => the_id })

    @the_user = matching_users.at(0)
    render({ :template => "user_authentication/show.html.erb" })
  end

  def profile
    # @user = @current_user
    # if params["query_email"] != nil
    #   @user.email = params.fetch("query_email")
    # end
    # if params["query_password"] != nil
    #   @user.password = params.fetch("query_password")
    # end
    # if params["query_password_confirmation"] != nil
    #   @user.password_confirmation = params.fetch("query_password_confirmation")
    # end
    # if params["query_username"] != nil
    #   @user.username = params.fetch("query_username")
    # end
    # if params["query_description"] != nil
    #   @user.description = params.fetch("query_description")
    # end
    # if params["query_time_id"] != nil
    #   @user.time_id = params.fetch("query_time_id")
    # end
    # if params["query_role_id"] != nil
    #   @user.role_id = params.fetch("query_role_id")
    # end
    # if params["query_company_name"] != nil
    #   @user.company_name = params.fetch("query_company_name")
    # end
    # if params["query_full_name"] != nil
    #   @user.full_name = params.fetch("query_full_name")
    # end

    # if @user.valid?
    #   @user.save

    render({ :template => "user_authentication/profile.html.erb" })
    # else
    #   render({ :template => "user_authentication/edit_profile_with_errors.html.erb", :alert => @user.errors.full_messages.to_sentence })
    # end
  end

  def sign_in_form
    render({ :template => "user_authentication/sign_in.html.erb" })
  end

  def create_cookie
    user = User.where({ :email => params.fetch("query_email") }).first

    the_supplied_password = params.fetch("query_password")

    if user != nil
      are_they_legit = user.authenticate(the_supplied_password)

      if are_they_legit == false
        redirect_to("/user_sign_in", { :alert => "Incorrect password." })
      else
        session[:user_id] = user.id

        redirect_to("/", { :notice => "Signed in successfully." })
      end
    else
      redirect_to("/user_sign_in", { :alert => "No user with that email address." })
    end
  end

  def destroy_cookies
    reset_session

    redirect_to("/", { :notice => "Signed out successfully." })
  end

  def sign_up_form
    render({ :template => "user_authentication/sign_up.html.erb" })
  end

  def create
    @user = User.new
    @user.email = params.fetch("query_email")
    @user.password = params.fetch("query_password")
    @user.password_confirmation = params.fetch("query_password_confirmation")
    @user.username = params.fetch("query_username")
    @user.description = params.fetch("query_description")
    @user.time_id = params.fetch("query_time_id")
    @user.role_id = params.fetch("query_role_id")
    @user.company_name = params.fetch("query_company_name")
    @user.full_name = params.fetch("query_full_name")

    save_status = @user.save

    @interest = UserInterest.new
    @interest.expertise_id = params.fetch("query_interest_id")
    @interest.user_id = @user.id
    @interest.save

    #interests = params.fetch("query_interest_id")
    #interests.each do |expertise|
    #  @interest = UserInterest.new
    #  @interest.expertise_id = expertise
    #  @interest.user_id = @user.id
    #  @interest.save
    # end

    if save_status == true
      session[:user_id] = @user.id

      redirect_to("/", { :notice => "User account created successfully." })
    else
      redirect_to("/user_sign_up", { :alert => @user.errors.full_messages.to_sentence })
    end
  end

  def edit_profile_form
    render({ :template => "user_authentication/edit_profile.html.erb" })
  end

  def update
    @user = @current_user
    if params["query_email"] != nil
      @user.email = params.fetch("query_email")
    else
      @user.email = @user.email
    end
    if params["query_password"] != nil
      @user.password = params.fetch("query_password")
    else
      @user.password = @user.password
    end
    if params["query_password_confirmation"] != nil
      @user.password_confirmation = params.fetch("query_password_confirmation")
    else
      @user.password_confirmation = @user.password_confirmation
    end
    if params["query_username"] != nil
      @user.username = params.fetch("query_username")
    else
      @user.username = @user.username
    end
    if params["query_description"] != nil
      @user.description = params.fetch("query_description")
    else
      @user.description = @user.description
    end
    if params["query_time_id"] != nil
      @user.time_id = params.fetch("query_time_id")
    else
      @user.time_id = @user.time_id
    end
    if params["query_role_id"] != nil
      @user.role_id = params.fetch("query_role_id")
    else
      @user.role_id = @user.role_id
    end
    if params["query_company_name"] != nil
      @user.company_name = params.fetch("query_company_name")
    else
      @user.company_name = @user.company_name
    end
    if params["query_full_name"] != nil
      @user.full_name = params.fetch("query_full_name")
    else
      @user.full_name = @user.full_name
    end

    #if @user.valid?
    @user.save
    #end

    expert = params["query_interest_id"]
    if ((expert != nil) && (UserInterest.where({ :user_id => @user.id }).where({ :expertise_id => expert })[0] == nil))
      @interest = UserInterest.new
      @interest.expertise_id = params.fetch("query_interest_id")
      @interest.user_id = @user.id
      @interest.save
    end

    #interests = params.fetch("query_interest_id")
    #interests.each do |expertise|
    #  @interest = UserInterest.new
    #  @interest.expertise_id = expertise
    #  @interest.user_id = @user.id
    #  @interest.save
    # end

    # if save_status == true
    #   session[:user_id] = @user.id

    redirect_to("/profile", { :notice => "Your account was updated successfully." })
    # else
    #   render({ :template => "user_authentication/edit_profile_with_errors.html.erb", :alert => @user.errors.full_messages.to_sentence })
    # end
  end

  def destroy
    @current_user.destroy
    reset_session

    redirect_to("/", { :notice => "User account cancelled" })
  end
end
