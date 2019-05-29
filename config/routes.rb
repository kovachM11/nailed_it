Rails.application.routes.draw do
  # Routes for the Progress photo resource:

  # CREATE
  get("/progress_photos/new", { :controller => "progress_photos", :action => "new_form" })
  post("/create_progress_photo", { :controller => "progress_photos", :action => "create_row" })

  # READ
  get("/progress_photos", { :controller => "progress_photos", :action => "index" })
  get("/progress_photos/:id_to_display", { :controller => "progress_photos", :action => "show" })

  # UPDATE
  get("/progress_photos/:prefill_with_id/edit", { :controller => "progress_photos", :action => "edit_form" })
  post("/update_progress_photo/:id_to_modify", { :controller => "progress_photos", :action => "update_row" })

  # DELETE
  get("/delete_progress_photo/:id_to_remove", { :controller => "progress_photos", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
