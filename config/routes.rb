Rails.application.routes.draw do

  get("/index", { :controller => "user_authentication", :action => "index" })

  # Routes for the Contacted resource:

  # CREATE
  post("/insert_contacted", { :controller => "contacteds", :action => "create" })
          
  # READ
  get("/contacteds", { :controller => "contacteds", :action => "index" })
  
  get("/contacteds/:path_id", { :controller => "contacteds", :action => "show" })
  
  # UPDATE
  
  post("/modify_contacted/:path_id", { :controller => "contacteds", :action => "update" })
  
  # DELETE
  get("/delete_contacted/:path_id", { :controller => "contacteds", :action => "destroy" })

  #------------------------------

  # Routes for the Favorite resource:

  # CREATE
  post("/insert_favorite", { :controller => "favorites", :action => "create" })
          
  # READ
  get("/favorites", { :controller => "favorites", :action => "index" })
  
  get("/favorites/:path_id", { :controller => "favorites", :action => "show" })
  
  # UPDATE
  
  post("/modify_favorite/:path_id", { :controller => "favorites", :action => "update" })
  
  # DELETE
  get("/delete_favorite/:path_id", { :controller => "favorites", :action => "destroy" })

  #------------------------------

  # Routes for the Role resource:

  # CREATE
  post("/insert_role", { :controller => "roles", :action => "create" })
          
  # READ
  get("/roles", { :controller => "roles", :action => "index" })
  
  get("/roles/:path_id", { :controller => "roles", :action => "show" })
  
  # UPDATE
  
  post("/modify_role/:path_id", { :controller => "roles", :action => "update" })
  
  # DELETE
  get("/delete_role/:path_id", { :controller => "roles", :action => "destroy" })

  #------------------------------

  # Routes for the User interest resource:

  # CREATE
  post("/insert_user_interest", { :controller => "user_interests", :action => "create" })
          
  # READ
  get("/user_interests", { :controller => "user_interests", :action => "index" })
  
  get("/user_interests/:path_id", { :controller => "user_interests", :action => "show" })
  
  # UPDATE
  
  post("/modify_user_interest/:path_id", { :controller => "user_interests", :action => "update" })
  
  # DELETE
  get("/delete_user_interest/:path_id", { :controller => "user_interests", :action => "destroy" })

  #------------------------------

  # Routes for the Expertise resource:

  # CREATE
  post("/insert_expertise", { :controller => "expertises", :action => "create" })
          
  # READ
  get("/expertises", { :controller => "expertises", :action => "index" })
  
  get("/expertises/:path_id", { :controller => "expertises", :action => "show" })
  
  # UPDATE
  
  post("/modify_expertise/:path_id", { :controller => "expertises", :action => "update" })
  
  # DELETE
  get("/delete_expertise/:path_id", { :controller => "expertises", :action => "destroy" })

  #------------------------------

  # Routes for the Time availability resource:

  # CREATE
  post("/insert_time_availability", { :controller => "time_availabilities", :action => "create" })
          
  # READ
  get("/time_availabilities", { :controller => "time_availabilities", :action => "index" })
  
  get("/time_availabilities/:path_id", { :controller => "time_availabilities", :action => "show" })
  
  # UPDATE
  
  post("/modify_time_availability/:path_id", { :controller => "time_availabilities", :action => "update" })
  
  # DELETE
  get("/delete_time_availability/:path_id", { :controller => "time_availabilities", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

end
